<template>
  <q-scroll-area>
    <div class="tw-m-5 tw-gap-3 tw-grid tw-grid-cols-2">
      <!-- code here -->
      <div class="match" v-for="item in matches" :key="item">
        <div class="match-header">
          <div class="match-date">
            {{ (new Date(item.date)).toDateString() }}
          </div>
        </div>
        <div class="match-content">
          <div class="column">
            <div class="team team--home">
              <div class="team-logo">
                <img :src="`/logos/${item.home_club}.svg`" :alt="item.home_club" />
              </div>
              <h2 class="team-name tw-flex" :class="{'tw-text-green-500': item.winner == item.home_player, 'tw-text-red-400' : item.winner == item.away_player}">
                {{ item.home_player }}
								<img v-if="item.home_yellow_card" src="/icons/yellow-card-right.svg" alt="Red card" class="tw-inline" :title="item.home_yellow_card"/>
								<img v-if="item.home_red_card" src="/icons/red-card-right.svg" alt="Red card" class="tw-inline" :title="item.home_red_card"/>
              </h2>
            </div>
          </div>
          <div class="column">
            <div class="match-details">
              <div class="match-score">
                <span class="match-score-number" :class="{'match-score-number--leading' : item.winner == item.home_player}">{{ item.home_goal }}</span>
                <span class="match-score-divider">:</span>
                <span class="match-score-number" :class="{'match-score-number--leading' : item.winner == item.away_player}">{{ item.away_goal }}</span>
              </div>
							<div class="tw-flex tw-space-x-1 tw-mt-2 tw-bg-red-50 tw-p-2 tw-rounded-lg">
								<img :src="`/logos/${item.home_banned_1}.svg`" :alt="item.home_banned_1" width="30"/>
								<img :src="`/logos/${item.away_banned_1}.svg`" :alt="item.away_banned_1" width="30"/>
								<img :src="`/logos/${item.home_banned_2}.svg`" :alt="item.home_banned_2" width="30"/>
								<img :src="`/logos/${item.away_banned_2}.svg`" :alt="item.away_banned_2" width="30"/>
							</div>
            </div>
          </div>
          <div class="column">
            <div class="team team--away">
              <div class="team-logo">
                <img :src="`/logos/${item.away_club}.svg`" :alt="item.away_club"/>
              </div>
              <h2 class="team-name tw-flex" :class="{'tw-text-green-500': item.winner == item.away_player, 'tw-text-red-400' : item.winner == item.home_player}">
                {{ item.away_player }}
								<img v-if="item.away_yellow_card" src="/icons/yellow-card-right.svg" alt="Yellow card" class="tw-inline" :title="item.away_yellow_card"/>
								<img v-if="item.away_red_card" src="/icons/red-card-right.svg" alt="Red card" class="tw-inline" :title="item.away_red_card"/>
              </h2>
            </div>
          </div>
        </div>
      </div>
    </div>
  </q-scroll-area>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute();
const player = route.params.player;
const matches = ref([]);

onMounted(async () => {
  matches.value = await ssvLeagueCaller.getHistory(player);
})
</script>

<style lang="scss" scoped>
.q-scrollarea {
  height: calc(100vh - 50px);
}

.match {
	background-color: var(--color-bg-primary);
	display: flex;
	flex-direction: column;
	border-radius: 10px;
	box-shadow: 0 0 2px 0 rgba(#303030, 0.1), 0 4px 4px 0 rgba(#303030, 0.1);
}

.match-header {
	display: flex;
	border-bottom: 2px solid rgba(#303030, 0.1);
	padding: 16px;
}

.match-content {
	display: flex;
	position: relative;
}

.column {
	padding-top: 32px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: calc(100% / 3);
}

.team {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.team-logo {
	width: 100px;
	height: 100px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	background-color: var(--color-bg-primary);
	box-shadow: 0 4px 4px 0 rgba(#303030, 0.15),
		0 0 0 15px var(--color-bg-secondary);
	img {
		width: 80px;
	}
}

.team-name {
	text-align: center;
	margin-top: 10px;
	font-size: 20px;
	font-weight: 600;
}

.match-details {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.match-date, .match-referee {
	font-size: 14px;
	color: var(--color-text-secondary);
	strong {
		color: var(--color-text-primary);
	}
}

.match-score {
	margin-top: 12px;
	display: flex;
	align-items: center;
}

.match-score-number {
	font-size: 48px;
	font-weight: 600;
	line-height: 1;
	&--leading {
		color: var(--color-theme-primary);
	}
}

.match-score-divider {
	font-size: 28px;
	font-weight: 700;
	line-height: 1;
	color: var(--color-text-icon);
	margin-left: 10px;
	margin-right: 10px;
}

.match-referee {
	margin-top: 32px;
}
</style>