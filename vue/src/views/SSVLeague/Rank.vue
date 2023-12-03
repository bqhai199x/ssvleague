<template>
  <div class="tw-flex tw-flex-col tw-items-center tw-justify-center tw-py-10">
    <!-- Component Start -->
    <h1 class="tw-text-xl tw-text-gray-400 tw-font-medium">SSV League 2023 - 2024</h1>
    <div class="tw-flex tw-flex-col tw-mt-6">
      <div class="-tw-my-2 tw-overflow-x-auto sm:-tw-mx-6 lg:-tw-mx-8">
        <div class="tw-py-2 tw-align-middle tw-inline-block tw-min-w-full sm:tw-px-6 lg:tw-px-8">
          <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
            <table class="tw-min-w-full tw-text-sm">
              <thead class="tw-bg-gray-800 tw-text-gray-400 tw-text-sm tw-uppercase tw-font-medium">
                <tr>
                  <th scope="col" colspan="2" class="tw-px-3 tw-py-3 tw-text-left tw-tracking-wider">
                    Người chơi
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Đối đầu
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Thắng
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Hoà
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Thua
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Bàn thắng
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Bàn thua
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Hiệu số
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    Điểm
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider">
                    5 trận gần nhất
                  </th>	
                </tr>
              </thead>
                <tbody class="tw-bg-white">
                  <tr v-for="(item, index) in rank" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border" @click="viewHistory(item.player)">
                    <td class="tw-pl-4">
                      {{ index + 1 }}
                    </td>
                    <td class="tw-flex tw-px-6 tw-py-2 tw-whitespace-nowrap tw-items-center">
                      <img class="tw-w-10 tw-rounded-md" :src="item.avatar" alt="">
                      <span class="tw-ml-5 tw-font-medium">{{ item.player }}</span>
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.matched }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.win }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.draw }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.lose }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.goal_win }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.goal_lose }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.difference }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.point }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap">
                      <div class="tw-flex">
                        <template v-for="item in item.nearest" :key="item">
                          <match-draw v-if="item == 1"/>
                          <match-win v-if="item == 2"/>
                          <match-lose v-if="item == 3"/>
                        </template>
                      </div>
                    </td>
                  </tr>
                </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- Component End  -->
  </div>
</template>

<script setup>
import MatchWin from 'components/icons/MatchWin.vue';
import MatchDraw from 'components/icons/MatchDraw.vue';
import MatchLose from 'components/icons/MatchLose.vue';

import { onMounted, ref } from 'vue';
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { useRouter } from 'vue-router';

const rank = ref([]);
const router = useRouter();

onMounted(async() => {
  rank.value = await ssvLeagueCaller.getRank();
})

const viewHistory = (player) => {
  router.push(`/ssv-league/history/${player}`);
}

</script>