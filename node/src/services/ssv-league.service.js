const knex = require('../configs/knex');
const randtoken = require('rand-token');

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

  creatMatch: async (home_player, away_player) => {
    try {
      const match = {
        key: randtoken.generate(45),
        home_key: randtoken.generate(45),
        away_key: randtoken.generate(45),
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
      const [data] = await knex('match').where({ key }).orWhere({home_key: key}).orWhere({away_key: key}).select();
      if(data) {
        switch (key) {
          case data.home_key:
            data.mode = 1;
            break;
          case data.away_key:
            data.mode = 2;
            break;
          default:
            data.mode = 0;
            break;
        }
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
      if (ban_pick_state == 0) dataUpd.home_banned_1 = club;
      else if (ban_pick_state == 1) dataUpd.away_banned_1 = club;
      else if (ban_pick_state == 2) dataUpd.home_banned_2 = club;
      else if (ban_pick_state == 3) dataUpd.away_banned_2 = club;
      else if (ban_pick_state == 4) dataUpd.home_club = club;
      else if (ban_pick_state == 5) dataUpd.away_club = club;
      await knex('match').where({key}).update(dataUpd);
      return dataUpd.ban_pick_state;
    } catch(e) {
      console.log(e);
      return null;
    }
  },

  getAllMatch: async () => {
    try {
      return await knex('match').orderBy('date', 'desc').select();
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
      const result = [];
      const players = await knex('player').select();
      const matches = await knex('match').orderBy('date', 'desc').where({ban_pick_state: 7}).select();
      for (const { name, avatar } of players) {
        const player = name;
        const data = { player, avatar };
        const match = matches.filter(x => x.home_player == player || x.away_player == player);
        data.matched = match.length;
        data.win = match.filter(x => x.winner == player).length;
        data.draw = match.filter(x => x.winner == null).length;
        data.lose = match.filter(x => x.winner && x.winner != player).length;
        data.yellow_card = match.reduce((accumulator, currentValue) => accumulator + (currentValue.home_player == player ? currentValue.home_yellow_card : currentValue.away_yellow_card), 0);
        data.red_card = match.reduce((accumulator, currentValue) => accumulator + (currentValue.home_player == player ? currentValue.home_red_card : currentValue.away_red_card), 0);
        data.goal_win = match.reduce((accumulator, currentValue) => accumulator + (currentValue.home_player == player ? currentValue.home_goal : currentValue.away_goal), 0);
        data.goal_lose = match.reduce((accumulator, currentValue) => accumulator + (currentValue.home_player == player ? currentValue.away_goal : currentValue.home_goal), 0);
        data.difference = data.goal_win - data.goal_lose;
        data.point = data.win * 3 + data.draw;
        data.nearest = [];
        for (let index = 0; index < 5; index++) {
          if(!match[index]) data.nearest.push(0); //Chưa diễn ra
          else if(match[index].winner == null) data.nearest.push(1); //Hoà
          else if(match[index].winner == player) data.nearest.push(2); //Thắng
          else data.nearest.push(3); //Thua
        }
        result.push(data);
      }
      result.sort((a, b) => {
        return b.point - a.point || b.difference - a.difference || (a.yellow_card + a.red_card * 3) - (b.yellow_card + b.red_card * 3);
      });
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
        ).andWhere({ban_pick_state: 7})
        .orderBy('date', 'desc')
        .select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getMatching: async() => {
    try {
      return await knex('match').whereNot({ban_pick_state: 7}).orderBy('date', 'desc').select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopGoalScore: async() => {
    try {
      return await knex.fromRaw(
        '(SELECT player, SUM(goal) AS goal, avatar ' +
        'FROM (' +
          'SELECT home_player AS player, SUM(home_goal) AS goal ' +
          'FROM `match` ' +
          'GROUP BY home_player ' +
          'UNION ALL ' +
          'SELECT away_player AS player, SUM(away_goal) AS goal ' +
          'FROM `match` ' +
          'GROUP BY away_player' +
        ') AS score ' +
        'INNER JOIN player on player.name = player ' +
        'GROUP BY player ' +
        'ORDER BY goal DESC ' +
        'LIMIT 5) as top_goal')
      .select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getTopConceded: async() => {
    try {
      return await knex.fromRaw(
        '(SELECT player, SUM(goal) AS goal, avatar ' +
        'FROM (' +
          'SELECT home_player AS player, SUM(away_goal) AS goal ' +
          'FROM `match` ' +
          'GROUP BY home_player ' +
          'UNION ALL ' +
          'SELECT away_player AS player, SUM(home_goal) AS goal ' +
          'FROM `match` ' +
          'GROUP BY away_player' +
        ') AS score ' +
        'INNER JOIN player on player.name = player ' +
        'GROUP BY player ' +
        'ORDER BY goal DESC ' +
        'LIMIT 5) as top_conceded')
      .select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },

  getBotFairPlay: async() => {
    try {
      return await knex.fromRaw(
        '(SELECT player, avatar, SUM(yellow_card) AS yellow_card, SUM(red_card) AS red_card,  (red_card * 3 + yellow_card) AS fair_play_point ' +
        'FROM (' +
          'SELECT home_player AS player, SUM(home_yellow_card) as yellow_card, SUM(home_red_card) as red_card ' +
          'FROM `match` ' +
          'GROUP BY home_player ' +
          'UNION ALL ' +
          'SELECT away_player AS player, SUM(away_yellow_card) as yellow_card, SUM(away_red_card) as red_card ' +
          'FROM `match` ' +
          'GROUP BY away_player' +
        ') AS card ' +
        'INNER JOIN player on player.name = player ' +
        'GROUP BY player ' +
        'ORDER BY fair_play_point DESC ' +
        'LIMIT 5) as bot_fair_play')
      .select();
    } catch (e) {
      console.log(e);
      return null;
    }
  },
}