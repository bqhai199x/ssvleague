<template>
  <div class="tw-w-[400px] tw-m-5 tw-space-y-3">
    <q-input v-model="key" dense outlined  />
    <q-btn color="secondary" label="Search" @click="searchMatch"/>
    <div v-if="match" class="tw-space-y-3 tw-pt-5">
      <q-select outlined v-model="match.home_player" dense :options="players" label="Home player" options-dense :option-disable="(opt) => match.away_player == opt"/>
      <q-select outlined v-model="match.away_player" dense :options="players" label="Away player" options-dense :option-disable="(opt) => match.home_player == opt"/>
      <q-select outlined v-model="match.home_banned_1" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Home ban 1" 
        :option-disable="(opt) => [match.away_banned_1, match.home_banned_2, match.away_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
      <q-select outlined v-model="match.away_banned_1" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Away ban 1"
        :option-disable="(opt) => [match.home_banned_1, match.home_banned_2, match.away_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
      <q-select outlined v-model="match.home_banned_2" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Home ban 2" 
        :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.away_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
      <q-select outlined v-model="match.away_banned_2" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Away ban 2" 
        :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
      <q-select outlined v-model="match.home_club" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Home club" 
        :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.away_banned_2, match.away_club].includes(opt.name)"/>
      <q-select outlined v-model="match.away_club" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Away club" 
        :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.away_banned_2, match.home_club].includes(opt.name)"/>
      <q-select outlined v-model="match.ban_pick_state" dense :options="states" label="State" options-dense map-options emit-value />
      <q-input type="number" label="Home yellow card" v-model.number="match.home_yellow_card" dense outlined />
      <q-input type="number" label="Away yellow card" v-model.number="match.away_yellow_card" dense outlined />
      <q-input type="number" label="Home red card" v-model.number="match.home_red_card" dense outlined />
      <q-input type="number" label="Away red card" v-model.number="match.away_red_card" dense outlined />
      <q-input type="number" label="Home goal" v-model.number="match.home_goal" dense outlined />
      <q-input type="number" label="Away goal" v-model.number="match.away_goal" dense outlined />
      <q-btn color="secondary" label="Update" @click="updateMatch"/>
    </div>
  </div>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import toast from 'utilities/toast';
import { onMounted, ref } from 'vue';

const match = ref();
const key = ref();
const players = ref([]);
const clubs = ref([]);
const states = [
  { label: 'Home banning 1', value: 0 },
  { label: 'Away banning 1', value: 1 },
  { label: 'Home banning 2', value: 2 },
  { label: 'Away banning 2', value: 3 },
  { label: 'Home picking', value: 4 },
  { label: 'Away picking', value: 5 },
  { label: 'Matching', value: 6 },
  { label: 'Match end', value: 7 },
]

onMounted(async() => {
  const data = await ssvLeagueCaller.getPlayers();
  players.value = data.map(x => x.name);
  clubs.value = await ssvLeagueCaller.getClubs();
})

const searchMatch = async () => {
  match.value = await ssvLeagueCaller.getMatchByKey(key.value);
}

const updateMatch = async () => {
  const result = await ssvLeagueCaller.updateMatch(match.value);
  if(result) toast.success('Thành công');
  else toast.error('Thất bại');
}
</script>