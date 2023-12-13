<template>
  <q-card class="tw-m-5 tw-space-y-3 tw-p-4 md:tw-max-w-[800px]">
    <q-input v-model="key" dense outlined  />
    <q-btn color="secondary" label="Search" @click="searchMatch"/>
    <div v-if="match" class="tw-space-y-3 match-manager">
      <div class="tw-flex tw-space-x-4">
        <div class="tw-space-y-3 tw-w-1/2">
          <h6>Home</h6>
          <q-select outlined v-model="match.home_player" dense :options="players" label="Player" options-dense :option-disable="(opt) => match.away_player == opt" />
          <q-select outlined v-model="match.home_banned_1" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Ban 1" 
            :option-disable="(opt) => [match.home_banned_1, match.home_banned_2, match.away_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
          <q-select outlined v-model="match.home_banned_2" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Ban 2" 
            :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.away_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
          <q-select outlined v-model="match.home_club" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Club" 
            :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.away_banned_2, match.away_club].includes(opt.name)"/>
          <q-select outlined v-model="match.ban_pick_state" dense :options="states" label="State" options-dense map-options emit-value />
          <q-input type="number" label="Yellow card" v-model.number="match.home_yellow_card" dense outlined />
          <q-input type="number" label="Red card" v-model.number="match.home_red_card" dense outlined />
          <q-input type="number" label="Goal" v-model.number="match.home_goal" dense outlined />
        </div>
        <div class="tw-space-y-3 tw-w-1/2">
          <h6>Away</h6>
          <q-select outlined v-model="match.away_player" dense :options="players" label="Player" options-dense :option-disable="(opt) => match.home_player == opt"/>
          <q-select outlined v-model="match.away_banned_1" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Ban 1"
            :option-disable="(opt) => [match.home_banned_1, match.home_banned_2, match.away_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
          <q-select outlined v-model="match.away_banned_2" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Ban 2" 
            :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.home_club, match.away_club].includes(opt.name)"/>
          <q-select outlined v-model="match.away_club" dense :options="clubs" option-label="alias" options-dense option-value="name" map-options emit-value label="Club" 
            :option-disable="(opt) => [match.home_banned_1, match.away_banned_1, match.home_banned_2, match.away_banned_2, match.home_club].includes(opt.name)"/>
          <q-select outlined v-model="match.ban_pick_state" dense :options="states" label="State" options-dense map-options emit-value />
          <q-input type="number" label="Yellow card" v-model.number="match.away_yellow_card" dense outlined />
          <q-input type="number" label="Red card" v-model.number="match.away_red_card" dense outlined />
          <q-input type="number" label="Goal" v-model.number="match.away_goal" dense outlined />
        </div>
      </div>
      <div class="tw-space-x-3">
        <q-btn color="secondary" label="Update" @click="updateMatch"/>
        <q-btn color="red" label="Delete" @click="deleteMatch"/>
      </div>
    </div>
  </q-card>
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

<style>
.match-manager .q-field__native.row.items-center span {
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
</style>