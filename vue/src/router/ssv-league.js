const ssvLeague = {
  path: '/ssv-league',
  component: () => import('layouts/MainLayout.vue'),
  children: [
    {
      path: 'rank',
      component: () => import('views/SSVLeague/Rank.vue'),
    },
    {
      path: 'ban-pick/:key',
      component: () => import('views/SSVLeague/BanPick.vue'),
    },
    {
      path: 'create-match',
      component: () => import('views/SSVLeague/CreateMatch.vue'),
    },
    {
      path: 'update-match',
      component: () => import('views/SSVLeague/UpdateMatch.vue'),
    },
    {
      path: 'history/:player',
      component: () => import('views/SSVLeague/History.vue'),
    }
  ]
}

export default ssvLeague;