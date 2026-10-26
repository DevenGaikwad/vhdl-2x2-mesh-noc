import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
const root=path.resolve(import.meta.dirname,'..'),work=path.join(root,'build','ghdl'),evidence=path.join(root,'evidence','ghdl');
fs.mkdirSync(work,{recursive:true});fs.mkdirSync(evidence,{recursive:true});
const ghdl=process.env.GHDL??'ghdl',results=[];
function run(name,args){
 const r=spawnSync(ghdl,args,{cwd:work,encoding:'utf8',maxBuffer:16*1024*1024});
 fs.writeFileSync(path.join(evidence,name+'.log'),[ghdl,...args].join(' ')+'\n'+(r.stdout??'')+(r.stderr??''));
 if(r.error||r.status!==0)throw new Error(name+': '+(r.error??r.stdout+r.stderr));return r.stdout;
}
const version=run('version',['--version']).trim();
for(const f of fs.readdirSync(work))if(f.endsWith('.cf'))fs.unlinkSync(path.join(work,f));
const rtl=fs.readFileSync(path.join(root,'rtl/compile_order.txt'),'utf8').trim().split(/\r?\n/);
const tb=['tb_fifo_buffer','tb_xy_route_unit','tb_rr_arbiter','tb_router','tb_demo','tb_noc_2x2'];
run('compile',['-a','--std=08',...rtl.map(p=>path.join(root,p)),...tb.map(n=>path.join(root,'tb',n+'.vhd'))]);
for(const n of tb)run('elaborate-'+n,['-e','--std=08',n]);
const jobs=[...[1,3,4,8].map(d=>['fifo-'+d,'tb_fifo_buffer',['-gDEPTH='+d]]),
 ['routing','tb_xy_route_unit',[]],['arbitration','tb_rr_arbiter',[]],
 ...[0,1,2,3].map(c=>['router-'+c,'tb_router',['-gCURRENT='+c]]),['demo','tb_demo',[]],
 ...[4,2,8].map(d=>['mesh-'+d,'tb_noc_2x2',['-gDEPTH='+d,'-gRUN_ID=directed-d'+d,
 '-gTRACE_FILE='+path.join(evidence,'directed-d'+d+'.csv'),'-gTRACE_LEVEL=2']])];
for(const [name,top,g] of jobs){
 const output=run(name,['-r','--std=08',top,...g,'--assert-level=error']);
 if(!output.includes('PASS '+top))throw new Error(name+': missing PASS marker');
 results.push({name,top,status:'PASS',generics:g,log:'evidence/ghdl/'+name+'.log'});console.log(name+' PASS');
}
const hashes={};for(const f of [...rtl,...tb.map(n=>'tb/'+n+'.vhd')])hashes[f]=crypto.createHash('sha256').update(fs.readFileSync(path.join(root,f))).digest('hex');
fs.writeFileSync(path.join(evidence,'verification.json'),JSON.stringify({schema_version:1,provenance:'GHDL RTL simulation',tool:version,
 part_target:'xc7s15cpga196-2',xsim_status:'not run',source_sha256:hashes,tests:results},null,2)+'\n');
console.log('Verified '+results.length+' GHDL runs. Vivado/XSim status is recorded separately in evidence/vivado.');
