const bcrypt = require('bcrypt');

const PIN_ROUNDS = 10;

// Hash PIN 6 digit
function hashPin(pin) {
  if (typeof pin !== 'string' || !/^\d{6}$/.test(pin)) {
    throw new Error('PIN must be 6 digits string');
  }
  return bcrypt.hashSync(pin, PIN_ROUNDS);
}

// Cek PIN dengan hash
function verifyPin(pin, hash) {
  if (!hash) return false;
  return bcrypt.compareSync(pin, hash);
}

module.exports = {
  hashPin,
  verifyPin,
};
