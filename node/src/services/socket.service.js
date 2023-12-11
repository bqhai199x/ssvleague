const ssvLeagueService = require('./ssv-league.service');

const initSocket = (http) => {
  const io = require('socket.io')(http, {
    cors: {
      origins: ['http://localhost:5173', 'http://192.168.12.39:5173']
  }});

  io.on('connection', (socket) => {
    socket.on('joinChanel', (chanel) => {
      socket.join(chanel);
    });
    
    socket.on('banpick', async (key, player, club) => {
      const state = await ssvLeagueService.updateBanPickState(key, club);
      if (state <= 4) io.to(key).emit('banning', state, player, club);
      else io.to(key).emit('picking', state, player, club);
    });

    socket.on('disconnect', () => {
    });
  });
}

module.exports = initSocket;