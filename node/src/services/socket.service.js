const ssvLeagueService = require('./ssv-league.service');

const initSocket = (http) => {
  const io = require('socket.io')(http, {
    cors: {
      origins: ['http://localhost:5173', 'http://192.168.12.39:5173']
  }});

  const client = emitToClient(io);
  const server = receiveOnServer(client);

  io.on('connection', (socket) => {
    socket.onAny((name, ...args) => {
      if (name == 'joinChanel') socket.join(args);
      else if (server[name]) server[name](...args);
    })
  });
}

const emitToClient = (io) => {
  const broadcastToAll = (...param) => io.emit(...param);
  const broadcastToChanel = (chanel, ...param) => io.to(chanel).emit(...param);
  return { broadcastToAll, broadcastToChanel };
};

const receiveOnServer = (client) => {
  const banPick = async (key, player, club) => {
    const state = await ssvLeagueService.updateBanPickState(key, club);
    if (state <= 4) client.broadcastToChanel(key, 'banning', state, club);
    else client.broadcastToChanel(key, 'picking', state, player, club);
  }
  return { banPick };
};

module.exports = initSocket;