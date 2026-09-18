const express = require('express');
const { db, DB_PATH, initSchema } = require('./db');
const { hashPin, verifyPin } = require('./auth');

const app = express();
const PORT = process.env.PORT || 3000;

initSchema();

app.use(express.json());

// Cek server jalan
app.get('/', (_req, res) => {
  res.json({
    ok: true,
    message: 'GHOF CHAT backend ready',
    dbPath: DB_PATH,
  });
});

// REGISTER: phone + PIN (6 digit) + optional name/username
app.post('/auth/register', (req, res) => {
  const { phone, pin, name, username } = req.body || {};

  if (!phone || !pin) {
    return res.status(400).json({
      ok: false,
      error: 'phone_and_pin_required',
      message: 'Phone dan PIN wajib diisi',
    });
  }

  if (typeof pin !== 'string' || !/^\d{6}$/.test(pin)) {
    return res.status(400).json({
      ok: false,
      error: 'invalid_pin_format',
      message: 'PIN harus 6 digit angka',
    });
  }

  const pinHash = hashPin(pin);

  try {
    const stmt = db.prepare(
      'INSERT INTO users (phone, pin_hash, name, username) VALUES (?, ?, ?, ?)'
    );
    const info = stmt.run(phone, pinHash, name || null, username || null);

    return res.status(201).json({
      ok: true,
      user: {
        id: info.lastInsertRowid,
        phone,
        name: name || null,
        username: username || null,
      },
    });
  } catch (err) {
    if (err && err.message && err.message.includes('UNIQUE constraint failed')) {
      return res.status(409).json({
        ok: false,
        error: 'duplicate_user',
        message: 'Nomor atau username sudah terdaftar',
      });
    }

    console.error('Register error:', err);
    return res.status(500).json({
      ok: false,
      error: 'server_error',
      message: 'Terjadi kesalahan di server',
    });
  }
});

// LOGIN: phone + PIN
app.post('/auth/login', (req, res) => {
  const { phone, pin } = req.body || {};

  if (!phone || !pin) {
    return res.status(400).json({
      ok: false,
      error: 'phone_and_pin_required',
      message: 'Phone dan PIN wajib diisi',
    });
  }

  try {
    const stmt = db.prepare(
      'SELECT id, phone, name, username, pin_hash FROM users WHERE phone = ?'
    );
    const user = stmt.get(phone);

    if (!user) {
      return res.status(401).json({
        ok: false,
        error: 'invalid_credentials',
        message: 'Nomor atau PIN salah',
      });
    }

    const valid = verifyPin(pin, user.pin_hash);
    if (!valid) {
      return res.status(401).json({
        ok: false,
       error: 'invalid_credentials',
        message: 'Nomor atau PIN salah',
      });
    }

    return res.json({
      ok: true,
      user: {
        id: user.id,
        phone: user.phone,
        name: user.name,
        username: user.username,
      },
    });
  } catch (err) {
    console.error('Login error:', err);
    return res.status(500).json({
      ok: false,
      error: 'server_error',
      message: 'Terjadi kesalahan di server',
    });
  }
});

app.listen(PORT, () => {
  console.log(`GHOF CHAT backend listening on port ${PORT}`);
  console.log(`SQLite dev DB at: ${DB_PATH}`);
  console.log('Schema initialized (users table ready)');
});
