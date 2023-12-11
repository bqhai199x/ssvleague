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
      <div class="tw-space-x-3">
        <q-btn color="secondary" label="Update" @click="updateMatch"/>
        <q-btn color="red" label="Delete" @click="deleteMatch"/>
      </div>
    </div>
  </div>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import toast from 'utilities/toast';
import { onMounted, ref } from 'vue';
import { states } from 'helper/constant';
import { useRoute } from 'vue-router';
import dialog from 'utilities/dialog';

const route = useRoute();

const key = ref(route.query.key);

const match = ref();
const players = ref([]);
const clubs = ref([]);

onMounted(async() => {
  const data = await ssvLeagueCaller.getPlayers();
  players.value = data.map(x => x.name);
  clubs.value = await ssvLeagueCaller.getClubs();
  await searchMatch();
})

const searchMatch = async () => {
  match.value = await ssvLeagueCaller.getMatchByKey(key.value);
}

const updateMatch = async () => {
  const result = await ssvLeagueCaller.updateMatch(match.value);
  if(result) toast.success('Thành công');
  else toast.error('Thất bại');
}

const deleteMatch = async () => {
  const confirm = await dialog.showConfirm('Warning', 'Delete this match?', {width: '500px'});
  if (confirm != 'OK') return;
  const result = await ssvLeagueCaller.deleteMatch(match.value.key);
  if(result) toast.success('Thành công');
  else toast.error('Thất bại');
  await searchMatch();
}
</script>