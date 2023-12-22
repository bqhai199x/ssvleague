import { io } from 'socket.io-client';

class SocketManager {
  connect() {
    this.socket = io(import.meta.env.VITE_SOCKET_ENDPOINT);
  }

  joinChanel(chanel) {
    this.socket.emit('joinChanel', chanel);
  }

  sendMessage(...param) {
    this.socket.emit(...param);
  }

  onReceive(...callback) {
    this.socket.onAny((name, ...args) => {
      const func = callback.find(x => x.name == name);
      if (func) func(...args);
    })
  }

  disconnect() {
    if (this.socket) {
        this.socket.disconnect();
    }
  }
}

export default new SocketManager();