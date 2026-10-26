import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';

// Verify the delivered records without rerunning simulation. Full research
// traces and logs belong to the complete ZIP, not the compact Git checkout.
const root = path.resolve(import.meta.dirname, '..');
const read = p => fs.readFileSync(path.join(root, p));
const json = p => JSON.parse(read(p));
const sha256 = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
const verification = json('evidence/ghdl/verification.json');
const metrics = json('experiments/results/metrics.json');
const configurations = json('experiments/results/configuration.json');
assert.deepEqual(verification.source_sha256, metrics.source_sha256);
for (const [file, expected] of Object.entries(metrics.source_sha256)) {
  assert.equal(sha256(read(file)), expected, `Source changed: ${file}`);
}
assert.equal(verification.tests.length, 14);
for (const test of verification.tests) {
  assert.equal(test.status, 'PASS');
  const log = read(test.log).toString();
  assert.ok(log.includes(`PASS ${test.top}`), `Missing test marker: ${test.name}`);
  assert.ok(!/assertion (?:error|failure)/i.test(log), `Failed test: ${test.name}`);
}
assert.equal(metrics.runs.length, 93);
assert.equal(configurations.length, 93);
assert.equal(new Set(metrics.runs.map(run => run.run_id)).size, 93);
const checked = [];
for (let i = 0; i < metrics.runs.length; i++) {
  const run = metrics.runs[i];
  assert.deepEqual(
    {depth: run.depth, scenario: run.scenario, rate: run.rate, seed: run.seed},
    configurations[i], `Configuration mismatch: ${run.run_id}`
  );
  assert.equal(run.trace_file, `traces/${run.run_id}.csv`);
  assert.equal(sha256(read(`experiments/results/${run.trace_file}`)), run.trace_sha256,
    `Trace changed: ${run.run_id}`);
  const logFile = `experiments/results/logs/${run.run_id}.log`;
  const logBytes = read(logFile);
  const log = logBytes.toString();
  assert.ok(!/assertion (?:error|failure)/i.test(log), `Failed run: ${run.run_id}`);
  const counts = log.match(/PASS tb_noc_2x2 accepted=(\d+) delivered=(\d+) reset_discarded=(\d+)/);
  assert.ok(counts, `Missing simulation PASS: ${run.run_id}`);
  assert.deepEqual(counts.slice(1).map(Number), [run.accepted, run.delivered, run.reset_discarded]);
  assert.equal(run.accepted, run.delivered);
  assert.equal(run.reset_discarded, 0);
  assert.equal(run.outstanding, 0);
  assert.equal(run.measured_cycles, 1000);
  assert.equal(run.verification, 'DRAIN COMPLETE');
  checked.push({run_id: run.run_id, trace_sha256: run.trace_sha256, log_sha256: sha256(logBytes)});
}
const xsimChecked = [];
for (const test of verification.tests) {
  const logFile = `evidence/vivado/xsim/${test.name}.log`;
  const log = read(logFile).toString();
  assert.ok(log.includes(`PASS ${test.top}`), `Missing XSim PASS marker: ${test.name}`);
  assert.ok(!/assertion (?:error|failure)|severity failure|ERROR:/i.test(log),
    `Failed XSim test: ${test.name}`);
  xsimChecked.push(test.name);
}

const vivadoStageSpecs = [
  ['evidence/vivado/synthesis_ooc', 'synthesis_ooc'],
  ['evidence/vivado/route_demo_ooc', 'route_demo_ooc'],
];
const vivadoSummaries = [];
let vivadoReportFilesChecked = 0;

for (const [directory, expectedStage] of vivadoStageSpecs) {
  const summary = json(`${directory}/summary.json`);
  assert.equal(summary.schema_version, 1);
  assert.equal(summary.kind, 'vivado_report_export');
  assert.equal(summary.part, 'xc7s15cpga196-2');
  assert.equal(summary.tool, 'Vivado 2026.1');
  assert.equal(summary.stage, expectedStage);
  assert.equal(summary.target_period_ns, 10);
  assert.equal(summary.board_verified, false);
  assert.ok(Number.isFinite(summary.wns_ns) && summary.wns_ns > 0,
    `Non-positive WNS: ${expectedStage}`);
  assert.equal(summary.tns_ns, 0);

  for (const report of summary.reports) {
    assert.equal(
      sha256(read(`${directory}/${report.name}`)),
      report.sha256,
      `Vivado report changed: ${directory}/${report.name}`,
    );
    vivadoReportFilesChecked++;
  }

  vivadoSummaries.push(summary);
}
const bundled = [
  ['evidence/ghdl/verification.json', 'frontend/public/data/verification.json'],
  ['experiments/results/metrics.json', 'frontend/public/data/metrics.json'],
  ['evidence/ghdl/directed-d4.csv', 'frontend/public/data/directed-d4.csv'],
];
for (const [source, copy] of bundled) assert.equal(sha256(read(source)), sha256(read(copy)), copy);
const total = key => metrics.runs.reduce((n, run) => n + run[key], 0);
assert.equal(total('accepted'), 82523);
assert.equal(total('delivered'), 82523);
const result = {
  schema_version: 1, status: 'PASS',
  scope: 'Source and trace hashes, log counts, configuration and dashboard-copy consistency; simulations were not rerun.',
  source_files_checked: Object.keys(metrics.source_sha256).length,
  supplemental_test_logs_checked: verification.tests.length,
  experiment_runs_checked: checked.length,
  accepted: total('accepted'), delivered: total('delivered'),
  reset_discarded: total('reset_discarded'), outstanding: total('outstanding'),
  dashboard_copies_checked: bundled.length,
  vivado_xsim_logs_checked: xsimChecked.length,
  vivado_report_files_checked: vivadoReportFilesChecked,
  vivado_stages: vivadoSummaries.map(summary => ({
    stage: summary.stage,
    part: summary.part,
    lut: summary.lut,
    ff: summary.ff,
    bram: summary.bram,
    wns_ns: summary.wns_ns,
    tns_ns: summary.tns_ns,
    board_verified: summary.board_verified,
  })),
  target_execution: 'GHDL 6.0.0 and Vivado 2026.1/XSim executed locally; exact-part OOC synthesis and routing completed; physical FPGA board not executed.',
  checked_runs: checked,
};
const output = path.join(root, 'evidence/package/source_trace_audit.json');
fs.mkdirSync(path.dirname(output), {recursive: true});
fs.writeFileSync(output, JSON.stringify(result, null, 2) + '\n');
console.log(`PASS: ${result.source_files_checked} source hashes, 14 GHDL logs, ${result.vivado_xsim_logs_checked} XSim logs, ${result.vivado_report_files_checked} Vivado report files and 93 trace/log pairs verified; 82,523 accepted = delivered.`);
