import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

// Release maintenance utility. Review changes before regenerating this index.
const root = path.resolve(import.meta.dirname, '..');
const excludedDirectories = new Set(['.git', 'node_modules', 'dist', 'build', '.Xil', '.vscode', '.idea']);
const files = [];
function walk(dir) {
  for (const item of fs.readdirSync(dir, {withFileTypes: true}).sort((a,b) => a.name.localeCompare(b.name, 'en'))) {
    if (excludedDirectories.has(item.name)) continue;
    const full = path.join(dir, item.name);
    const relative = path.relative(root, full).split(path.sep).join('/');
    if (relative === 'PUBLICATION_MANIFEST.json') continue;
    if (item.isDirectory()) walk(full);
    else if (item.isFile()) {
      const bytes = fs.readFileSync(full);
      files.push({path: relative, bytes: bytes.length, sha256: crypto.createHash('sha256').update(bytes).digest('hex')});
    } else throw new Error(`Unsupported filesystem entry: ${relative}`);
  }
}
walk(root);
files.sort((a,b) => a.path < b.path ? -1 : a.path > b.path ? 1 : 0);
const manifest = {schema_version: 1, kind: 'reviewed_github_publication', date: '2026-10-26', self_hash_excluded: true, exclusions: [...excludedDirectories], files};
fs.writeFileSync(path.join(root, 'PUBLICATION_MANIFEST.json'), JSON.stringify(manifest, null, 2) + '\n');
console.log(`Indexed ${files.length} publication files. Original package indexes were not changed.`);
