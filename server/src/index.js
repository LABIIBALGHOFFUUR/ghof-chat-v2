const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (_req, res) => {
  res.send('GHOF CHAT backend ready');
});

app.listen(PORT, () => {
  console.log(`GHOF CHAT backend listening on port ${PORT}`);
});
