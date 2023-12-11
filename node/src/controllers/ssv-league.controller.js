const ssvLeagueService = require('../services/ssv-league.service')

module.exports = {
  getPlayers: async (req, res) => {
    const result = await ssvLeagueService.getPlayers();
    return res.status(200).json({
        code: 200, status: 'success', data: result
    })
  },

  getClubs: async (req, res) => {
    const result = await ssvLeagueService.getClubs();
    return res.status(200).json({
        code: 200, status: 'success', data: result
    })
  },

  createMatch: async (req, res) => {
    const result = await ssvLeagueService.creatMatch(req.body.home_player, req.body.away_player);
    return res.status(200).json({
        code: 200, status: 'success', data: result
    })
  },

  getMatchByKey: async (req, res) => {
    const result = await ssvLeagueService.getMatchByKey(req.body.key);
    return res.status(200).json({
        code: 200, status: 'success', data: result
    })
  },
  
  getAllMatch: async (req, res) => {
    const result = await ssvLeagueService.getAllMatch();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  updateMatch: async (req, res) => {
    const result = await ssvLeagueService.updateMatch(req.body);
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getRank: async (req, res) => {
    const result = await ssvLeagueService.getRank();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getHistory: async (req, res) => {
    const result = await ssvLeagueService.getHistory(req.params.player);
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getMatching: async (req, res) => {
    const result = await ssvLeagueService.getMatching();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getTopGoalScore: async (req, res) => {
    const result = await ssvLeagueService.getTopGoalScore();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getTopConceded: async (req, res) => {
    const result = await ssvLeagueService.getTopConceded();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getTopBadPlay: async (req, res) => {
    const result = await ssvLeagueService.getTopBadPlay();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },

  getFavoriteClub: async (req, res) => {
    const result = await ssvLeagueService.getFavoriteClub();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },
  getTopAttackClub: async (req, res) => {
    const result = await ssvLeagueService.getTopAttackClub();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },
  getTopConcededClub: async (req, res) => {
    const result = await ssvLeagueService.getTopConcededClub();
    return res.status(200).json({
      code: 200, status: 'success', data: result
    });
  },
}