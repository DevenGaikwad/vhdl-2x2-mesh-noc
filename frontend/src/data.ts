export const fields=['run_id','scenario','cycle','phase','event','router','port','src','dst','packet_id','payload','packet_hex','fifo_count','req_mask','grant_mask','ready'] as const;
export const ports=['N','S','E','W','L'] as const;
export type EventName='offer'|'inject'|'link'|'deliver'|'stall'|'state'|'reset_discard';
export interface TraceEvent{run_id:string;scenario:number;cycle:number;phase:number;event:EventName;router:number;port:string;src:number;dst:number;packet_id:number;payload:number;packet_hex:string;fifo_count:number;req_mask:number|null;grant_mask:number|null;ready:number|null}
export interface Trace{runId:string;scenario:number;events:TraceEvent[];maxCycle:number;hasState:boolean}
export function active(node:number,port:string){return port==='L'||(port==='E'&&node%2===0)||(port==='W'&&node%2===1)||(port==='S'&&node<2)||(port==='N'&&node>=2)}
export function neighbor(node:number,port:string){if(!active(node,port)||port==='L')throw new Error('Invalid physical link');return node+({N:-2,S:2,E:1,W:-1}[port]??0)}
export function route(src:number,dst:number){const path=[src];let c=src;while(c!==dst){if(c%2!==dst%2)c+=dst%2>c%2?1:-1;else c+=dst>c?2:-2;path.push(c)}return path}
export function decode(hex:string){if(!/^[0-9a-fA-F]{8}$/.test(hex))throw new Error('Packet must contain exactly 8 hex digits');const n=parseInt(hex,16)>>>0;return {marker:n>>>31,type:(n>>>29)&3,src:((n>>>28)&1)+2*((n>>>27)&1),dst:((n>>>26)&1)+2*((n>>>25)&1),id:(n>>>21)&15,priority:(n>>>19)&3,payload:n&0x7ffff,bits:n.toString(2).padStart(32,'0')}}
export function parseCSV(text:string):string[][]{
 const rows:string[][]=[];let row:string[]=[],cell='',quoted=false;
 for(let i=0;i<text.length;i++){const c=text[i];if(c==='"'){if(quoted&&text[i+1]==='"'){cell+='"';i++}else quoted=!quoted}
 else if(c===','&&!quoted){row.push(cell);cell=''}else if((c==='\n'||c==='\r')&&!quoted){if(c==='\r'&&text[i+1]==='\n')i++;row.push(cell);if(row.some(v=>v!==''))rows.push(row);row=[];cell=''}else cell+=c}
 if(quoted)throw new Error('Unclosed CSV quote');row.push(cell);if(row.some(v=>v!==''))rows.push(row);return rows;
}
const names=new Set(['offer','inject','link','deliver','stall','state','reset_discard']);
function integer(s:string,name:string,min:number,max:number){if(!/^-?\d+$/.test(s.trim()))throw new Error(name+' must be an integer');const n=Number(s);if(!Number.isSafeInteger(n)||n<min||n>max)throw new Error(name+' outside range');return n}
export function parseTrace(text:string):Trace{
 if(text.length>32*1024*1024)throw new Error('Trace exceeds 32 MB limit');const rows=parseCSV(text.replace(/^\uFEFF/,''));
 if(rows.length<2)throw new Error('Trace has no events');if(rows[0].join(',')!==fields.join(','))throw new Error('Trace header does not match schema v1');
 let last=0,run='',scenario=-1;const events:TraceEvent[]=[];
 for(const [i,r] of rows.slice(1).entries()){
  if(r.length!==16)throw new Error('Row '+(i+2)+' has '+r.length+' fields, expected 16');
  if(!r[0]||r[0].length>120)throw new Error('Invalid run ID');if(!names.has(r[4]))throw new Error('Unknown event '+r[4]);if(!ports.includes(r[6] as typeof ports[number]))throw new Error('Invalid port');
  const e:TraceEvent={run_id:r[0],scenario:integer(r[1],'scenario',0,7),cycle:integer(r[2],'cycle',0,100000000),phase:integer(r[3],'phase',0,2),event:r[4] as EventName,router:integer(r[5],'router',0,3),port:r[6],src:integer(r[7],'source',-1,3),dst:integer(r[8],'destination',-1,3),packet_id:integer(r[9],'ID',-1,15),payload:integer(r[10],'payload',-1,524287),packet_hex:r[11],fifo_count:integer(r[12],'FIFO',-1,1024),req_mask:r[13]===''?null:integer(r[13],'request mask',0,31),grant_mask:r[14]===''?null:integer(r[14],'grant mask',0,31),ready:r[15]===''?null:integer(r[15],'ready',0,1)};
  if(i===0){run=e.run_id;scenario=e.scenario}if(e.run_id!==run||e.scenario!==scenario)throw new Error('Mixed runs are not permitted');if(e.cycle<last)throw new Error('Cycles must be nondecreasing');last=e.cycle;
  if(e.event!=='state'){const p=decode(e.packet_hex);if(p.marker!==1||p.type!==0||p.src!==e.src||p.dst!==e.dst||p.id!==e.packet_id||p.payload!==e.payload)throw new Error('Packet fields disagree with hex at row '+(i+2));if(e.event==='link'&&!active(e.router,e.port))throw new Error('Link leaves mesh');if(e.event==='deliver'&&(e.router!==e.dst||e.port!=='L'))throw new Error('Delivery destination mismatch')}
  else if(e.packet_hex!==''||e.src!==-1||e.dst!==-1||e.req_mask===null||e.grant_mask===null||e.ready===null||e.fifo_count<0)throw new Error('State row missing recorded values');
  events.push(e);
 }
 return {runId:run,scenario,events,maxCycle:last,hasState:events.some(e=>e.event==='state')};
}
export function inspectTrace(trace:Trace){
 const accepted=new Map<number,TraceEvent>(),pending=new Map<number,TraceEvent>(),locations=new Map<number,number>(),latencies:number[]=[],cohort:number[]=[],sourceCounts=[0,0,0,0];
 let delivered=0,discards=0,offeredWindow=0,acceptedWindow=0,deliveredWindow=0;const measuredCycles=new Set<number>();const stateMasks=new Map<number,number>();const service:Record<string,number>={};
 let occupancySum=0,occupancySamples=0,occupancyPeak=0,stallPortCycles=0;
 for(const e of trace.events){
  if(e.phase===1){measuredCycles.add(e.cycle);if(e.event==='state')stateMasks.set(e.cycle,(stateMasks.get(e.cycle)??0)|(1<<(5*e.router+ports.indexOf(e.port as typeof ports[number]))))}
  if(e.event==='offer'&&e.phase===1)offeredWindow++;
  if(e.event==='inject'){if(accepted.has(e.payload))throw new Error('Duplicate injection identity');accepted.set(e.payload,e);pending.set(e.payload,e);locations.set(e.payload,e.src);if(e.phase===1)acceptedWindow++}
  if(e.event==='link'){const start=pending.get(e.payload);if(!start||start.packet_hex!==e.packet_hex)throw new Error('Link has no matching accepted packet');if(locations.get(e.payload)!==e.router)throw new Error('Link starts at wrong router');const path=route(e.router,e.dst);if(path.length<2||neighbor(e.router,e.port)!==path[1])throw new Error('Link violates XY routing');locations.set(e.payload,path[1])}
  if(e.event==='deliver'||e.event==='reset_discard'){const start=pending.get(e.payload);if(!start)throw new Error('Unexpected or duplicate completion');if(start.packet_hex!==e.packet_hex)throw new Error('Packet integrity failure');pending.delete(e.payload);if(e.event==='deliver'){if(e.cycle<=start.cycle)throw new Error('Nonpositive packet latency');const latency=e.cycle-start.cycle;latencies.push(latency);if(start.phase===1)cohort.push(latency);delivered++;if(e.phase===1){deliveredWindow++;sourceCounts[e.src]++}}else discards++}
  if(e.phase===1&&(e.event==='link'||e.event==='deliver')){const key=e.router+':'+e.port;service[key]=(service[key]??0)+1}
  if(e.phase===1&&e.event==='state'&&active(e.router,e.port)){occupancySum+=e.fifo_count;occupancySamples++;occupancyPeak=Math.max(occupancyPeak,e.fifo_count)}
  if(e.phase===1&&e.event==='stall')stallPortCycles++;
 }
 const sorted=[...cohort].sort((a,b)=>a-b),sum=sourceCounts.reduce((a,b)=>a+b,0),squares=sourceCounts.reduce((a,b)=>a+b*b,0);
 const times=[...measuredCycles];const contiguous=times.length>0&&times.length===Math.max(...times)-Math.min(...times)+1;const complete=contiguous&&times.every(c=>stateMasks.get(c)===0xfffff);const n=complete?times.length:0;return {rate_basis:complete?'Complete contiguous pre-edge state coverage':'Unavailable: measurement interval is incomplete or lacks state rows',accepted:accepted.size,delivered,reset_discarded:discards,outstanding:pending.size,offered_valid_cycles:offeredWindow,accepted_window:acceptedWindow,delivered_window:deliveredWindow,measured_cycles:n,offered_rate:n?offeredWindow/n:null,accepted_rate:n?acceptedWindow/n:null,throughput:n?deliveredWindow/n:null,latency_samples:sorted.length,latency_mean:sorted.length?sorted.reduce((a,b)=>a+b,0)/sorted.length:null,latency_median:sorted.length?(sorted[Math.floor((sorted.length-1)/2)]+sorted[Math.ceil((sorted.length-1)/2)])/2:null,latency_p95:sorted.length?sorted[Math.ceil(.95*sorted.length)-1]:null,latencies:sorted,source_service:sourceCounts,jain_fairness:squares?sum*sum/(4*squares):null,output_service:service,fifo_mean:occupancySamples?occupancySum/occupancySamples:null,fifo_peak:occupancySamples?occupancyPeak:null,stall_port_cycles:stallPortCycles,verification:pending.size===0?'DRAIN COMPLETE':'PARTIAL TRACE'};
}
export function safeCSVCell(s:unknown){const v=String(s??'');return '"'+(/^[=+\-@\t\r]/.test(v)?"'":'')+v.replaceAll('"','""')+'"'}
export function parseMetrics(text:string){
 const o=JSON.parse(text);
 if(o.schema_version!==1||!['GHDL RTL simulation','XSim RTL simulation'].includes(o.provenance)||typeof o.tool!=='string'||o.part_target!=='xc7s15cpga196-2'||!Array.isArray(o.runs)||!o.runs.length||o.runs.length>10000)throw new Error('Unsupported metrics schema or provenance');
 const seen=new Set<string>();const nonnegative=(n:unknown)=>typeof n==='number'&&Number.isFinite(n)&&n>=0;const integer=(n:unknown)=>nonnegative(n)&&Number.isSafeInteger(n);
 for(const r of o.runs){
  if(typeof r.run_id!=='string'||r.run_id.length>120||seen.has(r.run_id)||![2,4,8].includes(r.depth)||!integer(r.scenario)||r.scenario<1||r.scenario>7||typeof r.scenario_name!=='string'||!integer(r.seed)||!integer(r.rate)||r.rate>1000||!integer(r.measured_cycles)||r.measured_cycles<1||!nonnegative(r.throughput)||r.throughput>2||!integer(r.accepted)||r.accepted!==r.delivered||r.reset_discarded!==0||r.outstanding!==0||!nonnegative(r.accepted_rate)||!nonnegative(r.offered_rate)||!integer(r.accepted_window)||!integer(r.delivered_window)||!nonnegative(r.fifo_mean)||!integer(r.fifo_peak)||r.fifo_peak>r.depth||!nonnegative(r.jain_fairness)||r.jain_fairness>1||!integer(r.latency_samples)||r.latency_samples<1||!nonnegative(r.latency_mean)||!nonnegative(r.latency_median)||!nonnegative(r.latency_p95)||!Array.isArray(r.source_service)||r.source_service.length!==4||r.source_service.some((v:unknown)=>!integer(v))||!Array.isArray(r.latencies)||r.latencies.length!==r.latency_samples||r.latencies.some((v:unknown)=>!integer(v)||Number(v)<1))throw new Error('Invalid experiment metrics');
  seen.add(r.run_id);
 }return o;
}
export function parseResourceReport(text:string){const r=JSON.parse(text);if(r.schema_version!==1||r.kind!=='vivado_report_export'||r.part!=='xc7s15cpga196-2'||typeof r.tool!=='string'||!['synthesis_ooc','route_demo_ooc'].includes(r.stage)||!Array.isArray(r.reports))throw new Error('Unsupported Vivado report summary');for(const k of ['lut','ff','bram','io','wns_ns','tns_ns','target_period_ns'])if(r[k]!==null&&(typeof r[k]!=='number'||!Number.isFinite(r[k])||(['lut','ff','bram','io','target_period_ns'].includes(k)&&r[k]<0)))throw new Error('Invalid Vivado metric '+k);return r}
