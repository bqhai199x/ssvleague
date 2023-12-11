import { defineStore } from 'pinia';

export const useAuthStore = defineStore('auth', {
  state: () => (
    {
      user: null,
    }
  ),
  getters: {
    isLoggedIn: (state) => state.user != null,
    role: (state) => state.user?.role,
  },
  actions: {
    login(data) {
      this.user = data;
    },

    logout() {
      this.user = null;
    },
  },
});
