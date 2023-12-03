const express = require('express');
const app = express();
const routes = require('./routes');
const cors = require('cors');
const http = require('http').createServer(app);
const io = require('socket.io')(http, {
  cors: {
    origins: ['http://localhost:5173']
}});
const ssvLeagueService = require('./services/ssv-league.service')

app.use(cors({
  credentials: true,
  origin: true,
}));

app.use(express.json());

for (const [key, value] of Object.entries(routes)) {
  app.use(`/api/${key}`, value);
}

io.on('connection', (socket) => {
  console.log('a user connected');
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
  socket.on('banpick', async (key, player, club) => {
    const state = await ssvLeagueService.updateBanPickState(key, club);
    if (state <= 4) io.emit('banning', state, player, club);
    else io.emit('picking', state, player, club);
  });
});

http.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});