const express = require('express');
const { db, DB_PATH } = require('./db');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware dasar
app.use(express.json());

// Health check backend + info DB path
app.get('/', (_req, res) => {
  res.json({
    ok: true,
    message: 'GHOF CHAT backend ready',
    dbPath: DB_PATH,
  });
});

app.listen(PORT, () => {
  console.log(`GHOF CHAT backend listening on port ${PORT}`);
  console.log(`SQLite dev DB at: ${DB_PATH}`);
});
