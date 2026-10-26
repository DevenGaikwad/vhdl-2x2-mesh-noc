import fs from 'node:fs';import {parseTrace,inspectTrace} from '../frontend/src/data.ts';
if(process.argv.length!==4)throw new Error('Usage: node scripts/analyze_trace.mjs input.csv output.json');
const trace=parseTrace(fs.readFileSync(process.argv[2],'utf8'));const metrics=inspectTrace(trace);
fs.writeFileSync(process.argv[3],JSON.stringify({schema_version:1,kind:'trace_analysis',provenance:'Imported RTL-format trace; tool requires log verification',run_id:trace.runId,...metrics},null,2)+'\n');
console.log(metrics.verification,metrics.accepted,metrics.delivered,metrics.reset_discarded,metrics.outstanding);
