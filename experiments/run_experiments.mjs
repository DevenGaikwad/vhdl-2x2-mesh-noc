import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';
import {parseTrace,inspectTrace} from '../frontend/src/data.ts';
const root=path.resolve(import.meta.dirname,'..'),work=path.join(root,'build/ghdl'),out=path.join(root,'experiments/results');fs.mkdirSync(path.join(out,'traces'),{recursive:true});fs.mkdirSync(path.join(out,'logs'),{recursive:true});
if(!fs.existsSync(path.join(root,'evidence/ghdl/verification.json')))throw new Error('Run depth-4 verification gate first');
const seeds=[101,202,303],configs=[];
for(const depth of [4,2,8]){for(const scenario of [1,2,5,6])configs.push({depth,scenario,rate:1000,seed:101});for(const scenario of [3,4])for(const rate of [100,250,500,900])for(const seed of seeds)configs.push({depth,scenario,rate,seed});for(const seed of seeds)configs.push({depth,scenario:7,rate:500,seed});}
const names=['directed','no_load','disjoint','all_to_all','hotspot','burst','sustained','sink_stall'];const runs=[];
for(const [i,c] of configs.entries()){
 const run_id=`d${c.depth}-${names[c.scenario]}-r${c.rate}-s${c.seed}`,file=path.join(out,'traces',run_id+'.csv');
 const args=['-r','--std=08','tb_noc_2x2',...Object.entries({DEPTH:c.depth,SCENARIO:c.scenario,RATE:c.rate,SEED:c.seed,WARMUP:100,MEASURE:1000,TRACE_LEVEL:2,RUN_ID:run_id,TRACE_FILE:file}).map(([k,v])=>`-g${k}=${v}`),'--assert-level=error'];
 const p=spawnSync(process.env.GHDL??'ghdl',args,{cwd:work,encoding:'utf8',maxBuffer:8e6});fs.writeFileSync(path.join(out,'logs',run_id+'.log'),args.join(' ')+'\n'+(p.stdout??'')+(p.stderr??''));
 if(p.status!==0||!p.stdout.includes('PASS tb_noc_2x2'))throw new Error(run_id+': '+p.stdout+p.stderr);
 const bytes=fs.readFileSync(file),trace=parseTrace(bytes.toString()),m=inspectTrace(trace);
 if(m.outstanding||m.accepted!==m.delivered||m.reset_discarded||m.measured_cycles!==1000)throw new Error(run_id+': experiment accounting failure');
 runs.push({run_id,...c,scenario_name:names[c.scenario],warmup:100,measurement_cycles:1000,trace_sha256:crypto.createHash('sha256').update(bytes).digest('hex'),trace_file:'traces/'+run_id+'.csv',...m});
 if(i%10===0||i===configs.length-1)console.log(`${i+1}/${configs.length} verified RTL experiments`);
}
const verification=JSON.parse(fs.readFileSync(path.join(root,'evidence/ghdl/verification.json'),'utf8'));
const summary={schema_version:1,provenance:'GHDL RTL simulation',tool:verification.tool,source_sha256:verification.source_sha256,part_target:'xc7s15cpga196-2',clock_basis:'cycles only; no physical clock verified',latency_convention:'delivery edge minus accepted injection edge; cohort accepted during phase 1, including drain completions',offered_definition:'cycles presenting valid at injection; repeated stalled presentations count',fairness_definition:'Jain index across four source service counts during measurement; unequal eligibility may bias',occupancy_definition:'pre-edge samples across 12 active input FIFOs',xsim_status:'not run',runs};
fs.writeFileSync(path.join(out,'metrics.json'),JSON.stringify(summary,null,2)+'\n');fs.writeFileSync(path.join(out,'configuration.json'),JSON.stringify(configs,null,2)+'\n');
const columns=['run_id','depth','scenario_name','rate','seed','accepted','delivered','measured_cycles','offered_rate','accepted_rate','throughput','latency_samples','latency_mean','latency_median','latency_p95','fifo_mean','fifo_peak','stall_port_cycles','jain_fairness'];
fs.writeFileSync(path.join(out,'metrics.csv'),columns.join(',')+'\n'+runs.map(r=>columns.map(c=>r[c]??'').join(',')).join('\n')+'\n');
console.log(`PASS ${runs.length} experiments accepted=${runs.reduce((a,r)=>a+r.accepted,0)} delivered=${runs.reduce((a,r)=>a+r.delivered,0)}`);
