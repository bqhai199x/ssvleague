import RestClient from "./rest-client";
const api = new RestClient('ssvleague');

export default {
  getClubs: async () => {
    const { data } = await api.get('clubs');
    return data;
  },
  getPlayers: async () => {
    const { data } = await api.get('players');
    return data;
  },
  createMatch: async (home_player, away_player) => {
    const { data } = await api.post('create-match', { home_player, away_player });
    return data;
  },
  getMatchByKey: async (key) => {
    const { data } = await api.post('match', { key });
    return data;
  },
  getAllMatch: async () => {
    const { data } = await api.get('match-all');
    return data;
  },
  updateMatch: async (match) => {
    const { data } = await api.patch('update-match', match);
    return data;
  },
  getRank: async () => {
    const { data } = await api.get('rank');
    return data;
  },
  getHistory: async (player) => {
    const { data } = await api.get(`history/${player}`);
    return data;
  },
  getMatching: async () => {
    const { data } = await api.get('matching');
    return data;
  },
  getTopGoalScore: async () => {
    const { data } = await api.get('top-goal-score');
    return data;
  },
  getTopConceded: async () => {
    const { data } = await api.get('top-conceded');
    return data;
  },
  getTopBadPlay: async () => {
    const { data } = await api.get('top-bad-play');
    return data;
  },
  getFavoriteClub: async () => {
    const { data } = await api.get('favorite-club');
    return data;
  },
  getTopAttackClub: async () => {
    const { data } = await api.get('top-attack-club');
    return data;
  },
  getTopConcededClub: async () => {
    const { data } = await api.get('top-conceded-club');
    return data;
  },
  deleteMatch: async (key) => {
    const { data } = await api.delete(`delete-match/${key}`);
    return data;
  },
}