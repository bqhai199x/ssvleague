<template>
  <q-card class="tw-m-5 tw-p-3 tw-space-y-2 tw-max-w-[500px]">
    <h6 v-if="matches.length == 0">Không có trận nào đang diễn ra</h6>
    <div v-for="item in matches" :key="item">
      {{ item.home_player }} vs {{ item.away_player }}
      <br/>
      <a target="_blank" class="tw-text-blue-400" :href="`/ssv-league/ban-pick/${item.key}`"> {{ item.key }}</a>
    </div>
  </q-card>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { onMounted, ref } from 'vue';

const matches = ref([]);

onMounted(async () => {
  matches.value = await ssvLeagueCaller.getMatching();
})
</script>