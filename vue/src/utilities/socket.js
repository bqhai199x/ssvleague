import { io } from 'socket.io-client';

class SocketManager {
  socket;
  constructor() {}

  connect(key) {
    this.socket = io(import.meta.env.VITE_SOCKET_ENDPOINT, { query: 'key='+key });
  }

  disconnect() {
    if (this.socket) {
        this.socket.disconnect();
    }
  }
}

export default new SocketManager();