import RestClient from "./rest-client";
const api = new RestClient('auth');

export default {
  login: async (username, password) => {
    const { data } = await api.post('login', { username, password });
    return data;
  },
  register: async (username, password) => {
    const { data } = await api.post('register', { username, password });
    return data;
  },
  getMe: async () => {
    const { data } = await api.get('me');
    return data;
  },
  logout: async () => {
    const { data } = await api.delete('logout');
    return data;
  }
}