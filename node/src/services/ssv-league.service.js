const knex = require('../configs/knex');
const randToken = require('rand-token');
const { MATCH_STATE, BAN_PICK_VIEW, MATCH_HISTORY } = require('../helper/constant');

module.exports = {
  getPlayers: async () => {
    try {
      return await knex('player').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getClubs: async () => {
    try {
      return await knex('club').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  createMatch: async (home_player, away_player) => {
    try {
      const match = {
        key: randToken.generate(45),
        home_key: randToken.generate(45),
        away_key: randToken.generate(45),
        home_player,
        away_player,
        date: new Date(Date.now()),
      }
      await knex('match').insert(match);
      return match;
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getMatchByKey: async (key) => {
    try {
      const [data] = await knex('match')
        .where((builder) => {
          builder.where({ key: key})
          .orWhere({ home_key: key })
          .orWhere({ away_key: key })
        })
        .andWhereNot({ban_pick_state : MATCH_STATE.MATCH_CANCEL})
        .select();
      if (data) {
        if (key == data.home_key) data.mode = BAN_PICK_VIEW.HOME;
        else if (key == data.away_key) data.mode = BAN_PICK_VIEW.AWAY;
        else data.mode = BAN_PICK_VIEW.VIEWER;
      }
      return data;
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  updateBanPickState: async (key, club) => {
    try {
      const [ { ban_pick_state } ] = await knex('match').where({key}).select('ban_pick_state');
      const dataUpd = { ban_pick_state: ban_pick_state + 1 };
      if (ban_pick_state == MATCH_STATE.HOME_BANNING_1) dataUpd.home_banned_1 = club;
      else if (ban_pick_state == MATCH_STATE.AWAY_BANNING_1) dataUpd.away_banned_1 = club;
      else if (ban_pick_state == MATCH_STATE.HOME_BANNING_2) dataUpd.home_banned_2 = club;
      else if (ban_pick_state == MATCH_STATE.AWAY_BANNING_2) dataUpd.away_banned_2 = club;
      else if (ban_pick_state == MATCH_STATE.HOME_PICKING) dataUpd.home_club = club;
      else if (ban_pick_state == MATCH_STATE.AWAY_PICKING) dataUpd.away_club = club;
      await knex('match').where({key}).update(dataUpd);
      return dataUpd.ban_pick_state;
    } catch(e) {
      console.log(e);
      return null;
    }
  },

  getAllMatch: async () => {
    try {
      return await knex('match').whereNot({ban_pick_state: MATCH_STATE.MATCH_CANCEL}).orderBy('date', 'desc').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  updateMatch: async (match) => {
    try {
      delete match.date;
      delete match.home_key;
      delete match.away_key;
      delete match.mode;
      if (match.home_goal > match.away_goal) match.winner = match.home_player;
      else if (match.home_goal < match.away_goal) match.winner = match.away_player;
      else match.winner = null;
      return await knex('match').where({key : match.key}).update(match);
    } catch(e) {
      console.log(e);
      return null;
    }
  },

  getRank: async() => {
    try {
      const result = await knex('rank').select();
      for (const item of result) {
        item.nearest = item.nearest.split(',').map(Number);
      }
      return result;
    } catch(e) {
      console.log(e);
      return null;
    }
  },

  getHistory: async (player) => {
    try {
      if (player == 'all') return await knex('match').where({ban_pick_state: 7}).orderBy('date', 'desc').select();
      else return await knex('match')
        .where((builder) =>
        builder.where({ home_player: player})
          .orWhere({away_player: player })
        ).andWhere({ban_pick_state: MATCH_STATE.MATCH_END})
        .orderBy('date', 'desc')
        .select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getMatching: async() => {
    try {
      return await knex('match').whereNot({ban_pick_state: MATCH_STATE.MATCH_END}).andWhereNot({ban_pick_state: MATCH_STATE.MATCH_CANCEL}).orderBy('date', 'desc').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopGoalScore: async() => {
    try {
      return await knex('top_goal').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopConceded: async() => {
    try {
      return await knex('top_defended').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopBadPlay: async() => {
    try {
      return await knex('top_bad_play').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getFavoriteClub: async() => {
    try {
      return await knex('favorite_club').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopAttackClub: async() => {
    try {
      return await knex('top_attack_club').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopConcededClub: async() => {
    try {
      return await knex('top_conceded_club').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  deleteMatch: async(key) => {
    try {
      return await knex('match').where({ key }).update({ ban_pick_state: MATCH_STATE.MATCH_CANCEL });
    } catch (e) {
      console.log(e);
      return null;
    }
  },
}