// Converts authentic saved reports; no default numerical results are supplied.
import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
if(process.argv.length!==3)throw new Error('Usage: node scripts/import_vivado_reports.mjs evidence/vivado/synthesis_ooc');
const dir=path.resolve(process.argv[2]);const meta=JSON.parse(fs.readFileSync(path.join(dir,'metadata.json'),'utf8'));
if(meta.part!=='xc7s15cpga196-2'||!['synthesis_ooc','route_demo_ooc'].includes(meta.stage))throw new Error('Unexpected part/stage');
const util=fs.readFileSync(path.join(dir,'utilization.rpt'),'utf8'),timing=fs.readFileSync(path.join(dir,'timing_summary.rpt'),'utf8');
function row(labels){for(const label of labels){const line=util.split(/\r?\n/).find(s=>s.split('|')[1]?.trim().replace(/\*+$/,'')===label);if(line){const n=Number(line.split('|')[2].trim().replaceAll(',',''));if(Number.isFinite(n))return n}}return null}
let wns=null,tns=null;const lines=timing.split(/\r?\n/);for(let i=0;i<lines.length;i++)if(lines[i].includes('WNS(ns)')&&lines[i].includes('TNS(ns)')){for(let j=i+1;j<Math.min(i+6,lines.length);j++){const values=lines[j].trim().split(/\s+/);if(values.length>1&&/^[-+]?\d+(\.\d+)?$/.test(values[0])&&/^[-+]?\d+(\.\d+)?$/.test(values[1])){wns=Number(values[0]);tns=Number(values[1]);break}}break}
const names=['metadata.json','utilization.rpt','timing_summary.rpt','check_timing.rpt','critical_paths.rpt','drc.rpt'];
const reports=names.map(name=>({name,sha256:crypto.createHash('sha256').update(fs.readFileSync(path.join(dir,name))).digest('hex')}));
const result={schema_version:1,kind:'vivado_report_export',...meta,provenance:'User-supplied saved Vivado reports; verify raw reports',lut:row(['Slice LUTs','CLB LUTs']),ff:row(['Slice Registers','CLB Registers']),bram:row(['Block RAM Tile']),io:row(['Bonded IOB']),wns_ns:wns,tns_ns:tns,reports};
const output=path.join(dir,'summary.json');fs.writeFileSync(output,JSON.stringify(result,null,2)+'\n');console.log('Saved',output,'Missing/unrecognized values remain null. Review warnings and unconstrained paths.');
