<template>
  <div class="container tw-flex tw-flex-col tw-items-center tw-justify-center tw-py-10">
    <!-- Component Start -->
    <h1 class="tw-text-xl tw-text-gray-400 tw-font-medium">SSV League 2023 - 2024</h1>
    <div class="tw-flex tw-flex-col tw-mt-6">
      <div class="-tw-my-2 tw-overflow-x-auto sm:-tw-mx-6 lg:-tw-mx-8">
        <div class="tw-py-2 tw-align-middle tw-inline-block tw-min-w-full sm:tw-px-6 lg:tw-px-8">
          <div class="tw-shadow tw-overflow-hidden sm:tw-rounded-lg">
            <table class="tw-min-w-full tw-text-sm tw-overflow-auto">
              <thead class="tw-bg-gray-800 tw-text-gray-400 tw-text-sm tw-uppercase tw-font-medium">
                <tr>
                  <th scope="col" colspan="2" class="tw-px-3 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Người chơi" data-title-sp="Người chơi">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Đối đầu" data-title-sp="ĐĐ">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Thắng" data-title-sp="Thắng">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Hoà" data-title-sp="Hoà">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Thua" data-title-sp="Thua">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Bàn thắng" data-title-sp="BT">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Bàn thua" data-title-sp="SBT">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Hiệu số" data-title-sp="HS">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Thẻ vàng" data-title-sp="TV">
                    <img src="/icons/yellow-card-right.svg" alt="Yellow card" class="tw-inline"/>
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Thẻ đỏ" data-title-sp="TD">
                    <img src="/icons/red-card-right.svg" alt="Red card" class="tw-inline"/>
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="Điểm" data-title-sp="Điểm">
                  </th>
                  <th scope="col" class="tw-px-6 tw-py-3 tw-text-left tw-tracking-wider" data-title-pc="5 trận gần nhất" data-title-sp="5TGN">
                  </th>	
                </tr>
              </thead>
                <tbody class="tw-bg-white">
                  <tr v-for="(item, index) in rank" :key="item" class="hover:tw-opacity-70 hover:tw-bg-slate-50 tw-cursor-pointer tw-border" @click="viewHistory(item.player)">
                    <td class="tw-pl-4">
                      <div :class="{'tw-underline tw-text-blue-500 tw-font-bold' : index < 4 }">{{ index + 1 }}</div>
                    </td>
                    <td class="tw-flex tw-px-6 tw-py-2 tw-whitespace-nowrap tw-items-center">
                      <img class="tw-w-10 tw-rounded-md" :src="item.avatar" alt="">
                      <span class="tw-ml-4 tw-font-medium">{{ item.player }}</span>
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
                      {{ item.yellow_card }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.red_card }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap tw-text-center">
                      {{ item.point }}
                    </td>
                    <td class="tw-px-6 tw-py-4 tw-whitespace-nowrap">
                      <div class="tw-flex tw-space-x-1">
                        <div v-for="item in item.nearest" :key="item">
                          <img src="/icons/match-draw.svg" alt="draw" v-if="item == MATCH_HISTORY.DRAW"/>
                          <img src="/icons/match-win.svg" alt="win" v-if="item == MATCH_HISTORY.WIN"/>
                          <img src="/icons/match-lose.svg" alt="lose" v-if="item == MATCH_HISTORY.LOSE"/>
                        </div>
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
import { onMounted, ref } from 'vue';
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { useRouter } from 'vue-router';
import { MATCH_HISTORY } from 'helper/constant';

const rank = ref([]);
const router = useRouter();

onMounted(async() => {
  rank.value = await ssvLeagueCaller.getRank();
})

const viewHistory = (player) => {
  router.push(`/ssv-league/history/${player}`);
}
</script>

<style scoped lang="scss">
th::before {
  content: attr(data-title-pc);
}

@media (max-width: 640px) {
 .container {
    display: block;
    padding: 10px;

    th {
      &::before {
        content: attr(data-title-sp);
      }

      img {
        display: none;
      }
    }

    td {
      &:last-child div div {
        width: 14px;
      }
    }
  }
}
</style>