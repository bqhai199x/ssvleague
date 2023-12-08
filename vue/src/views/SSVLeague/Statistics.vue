<template>
  <div class="tw-flex">
    <q-card class="tw-m-5 tw-p-3 tw-w-[500px]">
      <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
        <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
          <thead class="tw-text-sm">
            <tr>
              <th scope="col" colspan="2" class="tw-py-3 tw-text-left tw-tracking-wider">
                Vua hành gà
              </th>
              <th scope="col" class=" tw-py-3 tw-text-right tw-tracking-wider">
                Ghi bàn
              </th>
            </tr>
          </thead>
            <tbody class="tw-bg-white">
              <tr v-for="(item, index) in topGoalScore" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border">
                <td class="tw-pl-4">
                  <div class="tw-underline tw-text-blue-500 tw-font-bold">{{ index + 1 }}</div>
                </td>
                <td class="tw-flex tw-py-2 tw-whitespace-nowrap tw-items-center">
                  <img class="tw-w-10 tw-rounded-md" :src="item.avatar" alt="">
                  <span class="tw-ml-4 tw-font-medium">{{ item.player }}</span>
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.goal }}
                </td>
              </tr>
            </tbody>
        </table>
      </div>
    </q-card>

    <q-card class="tw-m-5 tw-p-3 tw-space-y-10 tw-w-[500px]">
      <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
        <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
          <thead class="tw-text-sm">
            <tr>
              <th scope="col" colspan="2" class="tw-py-3 tw-text-left tw-tracking-wider">
                Gà bị farm
              </th>
              <th scope="col" class=" tw-py-3 tw-text-right tw-tracking-wider">
                Thủng lưới
              </th>
            </tr>
          </thead>
            <tbody class="tw-bg-white">
              <tr v-for="(item, index) in topConceded" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border">
                <td class="tw-pl-4">
                  <div class="tw-underline tw-text-blue-500 tw-font-bold">{{ index + 1 }}</div>
                </td>
                <td class="tw-flex tw-py-2 tw-whitespace-nowrap tw-items-center">
                  <img class="tw-w-10 tw-rounded-md" :src="item.avatar" alt="">
                  <span class="tw-ml-4 tw-font-medium">{{ item.player }}</span>
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.goal }}
                </td>
              </tr>
            </tbody>
        </table>
      </div>
    </q-card>

    <q-card class="tw-m-5 tw-p-3 tw-space-y-10 tw-w-[500px]">
      <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
        <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
          <thead class="tw-text-sm">
            <tr>
              <th scope="col" colspan="2" class="tw-py-3 tw-text-left tw-tracking-wider">
                Top chơi bẩn
              </th>
              <th scope="col" class=" tw-py-3 tw-text-right tw-tracking-wider">
                Thẻ vàng
              </th>
              <th scope="col" class=" tw-py-3 tw-text-right tw-tracking-wider">
                Thẻ đỏ
              </th>
            </tr>
          </thead>
            <tbody class="tw-bg-white">
              <tr v-for="(item, index) in botFairPlay" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border">
                <td class="tw-pl-4">
                  <div class="tw-underline tw-text-blue-500 tw-font-bold">{{ index + 1 }}</div>
                </td>
                <td class="tw-flex tw-py-2 tw-whitespace-nowrap tw-items-center">
                  <img class="tw-w-10 tw-rounded-md" :src="item.avatar" alt="">
                  <span class="tw-ml-4 tw-font-medium">{{ item.player }}</span>
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.yellow_card }}
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.red_card }}
                </td>
              </tr>
            </tbody>
        </table>
      </div>
    </q-card>
  </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';
import ssvLeagueCaller from 'callers/ssv-league.caller';

const topGoalScore = ref([]);
const topConceded = ref([]);
const botFairPlay= ref([]);

onMounted(async() => {
  topGoalScore.value = await ssvLeagueCaller.getTopGoalScore();
  topConceded.value = await ssvLeagueCaller.getTopConceded();
  botFairPlay.value = await ssvLeagueCaller.getBotFairPlay();
})
</script>