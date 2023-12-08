import api from "./rest-client";

export default {
  getClubs: async () => {
    const { data } = await api.get('/ssvleague/clubs');
    return data;
  },
  getPlayers: async () => {
    const { data } = await api.get('/ssvleague/players');
    return data;
  },
  createMatch: async (home_player, away_player) => {
    const { data } = await api.post('/ssvleague/create-match', { home_player, away_player });
    return data;
  },
  getMatchByKey: async (key) => {
    const { data } = await api.post('/ssvleague/match', { key });
    return data;
  },
  getAllMatch: async () => {
    const { data } = await api.get('/ssvleague/match-all');
    return data;
  },
  updateMatch: async (match) => {
    const { data } = await api.patch('/ssvleague/update-match', match);
    return data;
  },
  getRank: async () => {
    const { data } = await api.get('/ssvleague/rank');
    return data;
  },
  getHistory: async (player) => {
    const { data } = await api.get(`/ssvleague/history/${player}`);
    return data;
  },
  getMatching: async () => {
    const { data } = await api.get('/ssvleague/matching');
    return data;
  },
  getTopGoalScore: async () => {
    const { data } = await api.get('/ssvleague/top-goal-score');
    return data;
  },
  getTopConceded: async () => {
    const { data } = await api.get('/ssvleague/top-conceded');
    return data;
  },
  getBotFairPlay: async () => {
    const { data } = await api.get('/ssvleague/bot-fair-play');
    return data;
  },
}