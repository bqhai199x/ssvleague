<template>
  <q-card class="tw-mx-10 tw-my-3 tw-p-3">
    <div class="tw-flex tw-align-middle tw-justify-center">
      <div class="tw-my-10 tw-grid tw-gap-y-10 tw-gap-x-20 club" :class="{'tw-pointer-events-none' : viewMode }">
        <div v-for="item in clubs" :key="item"
          class="tw-flex tw-justify-center tw-align-middle hover:tw-opacity-50 tw-cursor-pointer" 
          :data-pick="item.picked"
          :class="{'banned' : item.banned, 'tw-opacity-20': state == 6 && !item.picked && !item.banned }" 
          @click="banPick(item.name)">
          <img :src="`/logos/${item.name}-l.png`" :alt="item.alias"/>
        </div>
      </div>
    </div>
    <div class="tw-text-center tw-text-3xl tw-text-blue-500">
      {{ title }}
    </div>
  </q-card>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { onMounted, onBeforeMount, ref, computed } from 'vue';
import SocketManager from 'utilities/socket'
import { useRouter } from 'vue-router';
import toast from "utilities/toast";

const clubs = ref([]);
const router = useRouter();
const playerKey = ref();
const player = ref();
const homePlayer = ref();
const awayPlayer = ref();
const viewMode = ref(false);
const key = ref();
const pickMode = ref(false);
const mode = ref(null);
const state = ref(0);
const title = computed(() => {
  if ([0, 2].includes(state.value)) return `${homePlayer.value} banning`;
  if ([1, 3].includes(state.value)) return `${awayPlayer.value} banning`;
  if (state.value == 4) return `${homePlayer.value} picking`;
  if (state.value == 5) return `${awayPlayer.value} picking`;
  return '';
})

onMounted(async() => {
  const match = await ssvLeagueCaller.getMatchByKey(router.currentRoute.value.params.key);
  if(match) {
    mode.value = match.mode;
    if (match.mode) {
      player.value = match.mode == 1 ? match.home_player : match.away_player;
      playerKey.value = match.mode == 1 ? match.home_key : match.away_key;
    }
    homePlayer.value = match.home_player;
    awayPlayer.value = match.away_player;
    key.value = match.key;
    setState(match.ban_pick_state);
    initSocket();
    clubs.value = await ssvLeagueCaller.getClubs();
    if (match.home_banned_1 || match.away_banned_1 || match.home_banned_2 || match.away_banned_2) {
      const club = clubs.value.filter(x => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.away_banned_2].includes(x.name));
      if (club) club.forEach(x => x.banned = true);
    }
    if (match.home_club) {
      const club = clubs.value.find(x => x.name == match.home_club);
      if (club) club.picked = match.home_player;
    }
    if (match.away_club) {
      const club = clubs.value.find(x => x.name == match.away_club);
      if (club) club.picked = match.away_player;
    }
  } else toast.error('Không tìm thấy trận đấu');
})

const setState = (banPickState) => {
  state.value = banPickState;
  viewMode.value = true;
  if (mode.value == 1 && [0, 2, 4].includes(banPickState) || mode.value == 2 && [1, 3, 5].includes(banPickState)) viewMode.value = false;
  if ((mode.value == 1 && banPickState == 4) || (mode.value == 2 && banPickState == 5)) pickMode.value = true;
}

const initSocket = () => {
  SocketManager.connect(key.value);
  SocketManager.socket.on('banning', (state, player, clubName) => {
    const club = clubs.value.find(x => x.name == clubName);
    club.banned = true;
    setState(state);
  });
  SocketManager.socket.on('picking', (state, player, clubName) => {
    const club = clubs.value.find(x => x.name == clubName);
    club.picked = player;
    setState(state);
  });
}

const banPick = (club) => {
    SocketManager.socket.emit('banpick', key.value, player.value, club);
}


onBeforeMount( async() => {
  SocketManager.disconnect();
});
</script>

<style scoped>
.club {
  grid-template-columns: 150px 150px 150px 150px 150px 150px;
  grid-template-rows: 150px 150px 150px 150px;
}

.club .banned,
.club div[data-pick] {
  position: relative;
  pointer-events: none;
}

.club .banned img {
  opacity: 0.2;
}

.club > div.banned::before{
    content: 'Banned';
    position: absolute;
    top: 50%;
    left: 50%;
    color: red;
    text-transform: uppercase;
    font-weight: 700;
    opacity: 1;
    
    /* rotate */
    -webkit-transform: translate(-50%, -50%) rotate(315deg);
    -moz-transform: translate(-50%, -50%) rotate(315deg);
    -ms-transform: translate(-50%, -50%) rotate(315deg);
    -o-transform: translate(-50%, -50%) rotate(315deg);
  }

  .club > div[data-pick]::before{
    content: attr(data-pick);
    position: absolute;
    top: 110%;
    left: 50%;
    color: green;
    font-weight: 900;
    font-size: large;
    opacity: 1;
    
    /* rotate */
    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
  }

  @media (max-width: 640px) {
    .club {
      grid-template-columns: 100px 100px;
      grid-template-rows: repeat(12, 100px);
      gap: 40px;
    }
  }
</style>