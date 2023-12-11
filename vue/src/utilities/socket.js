import { io } from 'socket.io-client';

class SocketManager {
  socket;
  constructor() {}

  connect() {
    this.socket = io(import.meta.env.VITE_SOCKET_ENDPOINT);
  }

  joinChanel(chanel) {
    this.socket.emit('joinChanel', chanel);
  }

  disconnect() {
    if (this.socket) {
        this.socket.disconnect();
    }
  }
}

export default new SocketManager();