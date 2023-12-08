<template>
  <div class="tw-grid md:tw-grid-cols-3 sm:tw-grid-cols-1">
    <q-card class="tw-m-5 tw-p-3 md:tw-w-[500px]">
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
                <td class="tw-pl-4 tw-w-[50px]">
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

    <q-card class="tw-m-5 tw-p-3 tw-space-y-10 md:tw-w-[500px]">
      <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
        <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
          <thead class="tw-text-sm">
            <tr>
              <th scope="col" colspan="2" class="tw-py-3 tw-text-left tw-tracking-wider">
                Vua lì đòn
              </th>
              <th scope="col" class="tw-py-3 tw-text-right tw-tracking-wider">
                Thủng lưới
              </th>
            </tr>
          </thead>
            <tbody class="tw-bg-white">
              <tr v-for="(item, index) in topConceded" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border">
                <td class="tw-pl-4 tw-w-[50px]">
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

    <q-card class="tw-m-5 tw-p-3 tw-space-y-10 md:tw-w-[500px]">
      <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
        <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
          <thead class="tw-text-sm">
            <tr>
              <th scope="col" colspan="2" class="tw-py-3 tw-text-left tw-tracking-wider">
                Top chơi bẩn
              </th>
              <th scope="col" class="tw-py-3 tw-text-right tw-tracking-wider">
                Thẻ vàng
              </th>
              <th scope="col" class="tw-py-3 tw-text-right tw-tracking-wider" v-if="showRedCard">
                Thẻ đỏ
              </th>
            </tr>
          </thead>
            <tbody class="tw-bg-white">
              <tr v-for="(item, index) in topBadPlay" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border">
                <td class="tw-pl-4 tw-w-[50px]">
                  <div class="tw-underline tw-text-blue-500 tw-font-bold">{{ index + 1 }}</div>
                </td>
                <td class="tw-flex tw-py-2 tw-whitespace-nowrap tw-items-center">
                  <img class="tw-w-10 tw-rounded-md" :src="item.avatar" alt="">
                  <span class="tw-ml-4 tw-font-medium">{{ item.player }}</span>
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.yellow_card }}
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right" v-if="showRedCard">
                  {{ item.red_card }}
                </td>
              </tr>
            </tbody>
        </table>
      </div>
    </q-card>

    <q-card class="tw-m-5 tw-p-3 tw-space-y-10 md:tw-w-[500px]">
      <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
        <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
          <thead class="tw-text-sm">
            <tr>
              <th scope="col" colspan="2" class="tw-py-3 tw-text-left tw-tracking-wider">
                Câu lạc bộ yêu thích
              </th>
              <th scope="col" class="tw-py-3 tw-text-right tw-tracking-wider">
                Số trận
              </th>
              <th scope="col" class="tw-py-3 tw-text-right tw-tracking-wider">
                Tỉ lệ thắng
              </th>
            </tr>
          </thead>
            <tbody class="tw-bg-white">
              <tr v-for="(item, index) in favoriteClub" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border">
                <td class="tw-pl-4 tw-w-[50px]">
                  <div class="tw-underline tw-text-blue-500 tw-font-bold">{{ index + 1 }}</div>
                </td>
                <td colspan="2" class="tw-flex tw-py-2 tw-whitespace-nowrap tw-items-center">
                  <img class="tw-w-10 tw-rounded-md" :src="`/logos/${item.name}-s.png`" :alt="item.alias">
                  <span class="tw-ml-4 tw-font-medium">{{ item.alias }}</span>
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.match }}
                </td>
                <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-right">
                  {{ item.rate }}
                </td>
              </tr>
            </tbody>
        </table>
      </div>
    </q-card>
  </div>
</template>

<script setup>
import { computed, onMounted, ref } from 'vue';
import ssvLeagueCaller from 'callers/ssv-league.caller';

const topGoalScore = ref([]);
const topConceded = ref([]);
const topBadPlay = ref([]);
const favoriteClub = ref([]);

const showRedCard = computed(() => topBadPlay.value.some(x => x.red_card > 0));

onMounted(async() => {
  topGoalScore.value = await ssvLeagueCaller.getTopGoalScore();
  topConceded.value = await ssvLeagueCaller.getTopConceded();
  topBadPlay.value = await ssvLeagueCaller.getTopBadPlay();
  favoriteClub.value = await ssvLeagueCaller.getFavoriteClub();
})
</script>