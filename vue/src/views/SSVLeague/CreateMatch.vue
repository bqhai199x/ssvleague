<template>
  <q-card class="tw-m-5 tw-w-[200px] tw-p-4">
    <div class="tw-space-y-3">
      <div>
        <q-select outlined v-model="home_player" dense :options="players" label="Home" />
      </div>
      <div>
        <q-select outlined v-model="away_player" dense :options="players" label="Away" />
      </div>
      <div>
        <q-btn color="secondary" label="Create" @click="create"/>
      </div>
    </div>
    <div v-if="match" class="tw-m-5 tw-space-y-3">
      <div><strong>Key:</strong> <a target="_blank" class="tw-text-blue-400" :href="`/ssv-league/ban-pick/${match.key}`"> {{ `${host}/ssv-league/ban-pick/${match.key}` }}</a></div>
      <div><strong>Home:</strong> <a target="_blank" class="tw-text-blue-400" :href="`/ssv-league/ban-pick/${match.home_key}`"> {{ `${host}/ssv-league/ban-pick/${match.home_key}` }}</a></div>
      <div><strong>Away:</strong> <a target="_blank" class="tw-text-blue-400" :href="`/ssv-league/ban-pick/${match.away_key}`"> {{ `${host}/ssv-league/ban-pick/${match.away_key}` }}</a></div>
    </div>
  </q-card>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { onMounted, ref } from 'vue';

const host = location.origin;
const players = ref([]);
const home_player = ref();
const away_player = ref();
const match = ref();

onMounted(async() => {
  const data = await ssvLeagueCaller.getPlayers();
  players.value = data.map(x => x.name);
})

const create = async () => {
  match.value = await ssvLeagueCaller.createMatch(home_player.value, away_player.value);
}
</script>