import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';

const root = path.resolve(import.meta.dirname, '..');
const manifest = JSON.parse(fs.readFileSync(path.join(root, 'PUBLICATION_MANIFEST.json')));
assert.equal(manifest.schema_version, 1);
assert.ok(manifest.files.length > 470);
const seen = new Set();
const hash = b => crypto.createHash('sha256').update(b).digest('hex');
for (const entry of manifest.files) {
  assert.ok(!seen.has(entry.path), `Duplicate manifest path: ${entry.path}`);
  seen.add(entry.path);
  assert.ok(!path.isAbsolute(entry.path) && !entry.path.split('/').includes('..'), 'Unsafe manifest path');
  const bytes = fs.readFileSync(path.join(root, entry.path));
  assert.equal(bytes.length, entry.bytes, `Size mismatch: ${entry.path}`);
  assert.equal(hash(bytes), entry.sha256, `Hash mismatch: ${entry.path}`);
}
const screenshots = JSON.parse(fs.readFileSync(path.join(root, 'docs/assets/vivado/index.json')));
assert.equal(screenshots.length, 42);
assert.equal(new Set(screenshots.map(s => s.path)).size, 42);
for (const s of screenshots) {
  assert.ok(seen.has(s.path), `Unindexed screenshot: ${s.path}`);
  assert.equal(hash(fs.readFileSync(path.join(root, s.path))), s.sha256, s.path);
}
assert.equal(manifest.files.filter(f => /^rtl\/.*\.vhd$/.test(f.path)).length, 11);
assert.equal(manifest.files.filter(f => /^tb\/.*\.vhd$/.test(f.path)).length, 6);
assert.equal(manifest.files.filter(f => /^experiments\/results\/traces\/.*\.csv$/.test(f.path)).length, 93);
assert.equal(manifest.files.filter(f => /^experiments\/results\/logs\/.*\.log$/.test(f.path)).length, 93);
console.log(`PASS: ${manifest.files.length} published file hashes; 11 RTL modules, 6 testbenches, 42 screenshots and 93 complete benchmark pairs.`);
