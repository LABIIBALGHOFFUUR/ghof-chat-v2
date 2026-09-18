const Database = require('better-sqlite3');
const path = require('path');
const fs = require('fs');

const DATA_DIR = path.join(__dirname, '..', 'data');
const DB_PATH = path.join(DATA_DIR, 'ghof-chat-dev.sqlite');

// Pastikan folder data ada
if (!fs.existsSync(DATA_DIR)) {
  fs.mkdirSync(DATA_DIR, { recursive: true });
}

const db = new Database(DB_PATH);

// Untuk sekarang, kita hanya export instance db.
// Nanti kita tambah fungsi helper / migration di sini.
module.exports = {
  db,
  DB_PATH,
};
