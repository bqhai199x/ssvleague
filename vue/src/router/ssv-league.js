const ssvLeague = {
  path: '/ssv-league',
  component: () => import('layouts/MainLayout.vue'),
  children: [
    {
      name: 'rank',
      path: 'rank',
      component: () => import('views/SSVLeague/Rank.vue'),
    },
    {
      name: 'ban-pick',
      path: 'ban-pick/:key',
      component: () => import('views/SSVLeague/BanPick.vue'),
    },
    {
      name: 'create-match',
      path: 'create-match',
      component: () => import('views/SSVLeague/CreateMatch.vue'),
    },
    {
      name: 'update-match',
      path: 'update-match',
      component: () => import('views/SSVLeague/UpdateMatch.vue'),
    },
    {
      name: 'history',
      path: 'history/:player',
      component: () => import('views/SSVLeague/History.vue'),
    },
    {
      name: 'matching',
      path: 'matching',
      component: () => import('views/SSVLeague/Matching.vue'),
    }
  ]
}

export default ssvLeague;