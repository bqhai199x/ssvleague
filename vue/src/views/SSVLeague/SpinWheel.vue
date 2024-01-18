<template>
  <div class="wheel">
    <div class="tw-relative">
      <button id="spin" ref="btn" @click="spin">Spin</button>
      <div class="container" ref="container">
        <div v-for="(item, index) in clubs" :key="item" 
        :style="[
          `transform: rotate(${calcRotate(index)}deg)`,
          `background-color: ${getColor(index)}`,
          `z-index: ${100 - index}`,
          `width: ${media / clubs.length}px`,
          `left: calc(50% - ${media / clubs.length / 2}px)`
        ]">
          <img :src="`/logos/${item.name}-l.png`" :alt="item.alias"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import ssvLeagueCaller from 'callers/ssv-league.caller';

const container = ref();
const btn = ref();
const number = ref(Math.random() * (4000 - 2000) + 2000);
const clubs = ref([]);
const colors = [
  '#3f51b5',
  '#ff9800',
  '#e91e63',
  '#4caf50',
  '#009688',
  '#795548',
  '#9c27b0',
  '#f44336',
];
const media = window.innerWidth < 640 ? 1120 : 2560;
const isSpinning = ref(false);

const spin = () => {
  if (isSpinning.value) return;
  isSpinning.value = true;
  const rotate = Math.ceil(Math.random() * (4000 - 2000) + 2000);
  container.value.style.transform = "rotate(" + number.value + "deg)";
  number.value += rotate;
  setTimeout(() => isSpinning.value = false, 5000);
}

const calcRotate = (index) => {
  const step = Math.floor(360 / clubs.value.length - 1);
  return index * (step + 1);
};

const getColor = (index) => {
  if (index > colors.length - 1) return colors[(index % (colors.length - 1))];
  return colors[index];
};

onMounted(async () => {
  clubs.value = await ssvLeagueCaller.getClubs();
})
</script>

<style scoped>
.wheel {
  display: flex;
  align-items: center;
  justify-content: center;
  height: calc(100vh - 50px);
  overflow: hidden;
}

.container {
  width: 800px;
  height: 800px;
  background-color: #ccc;
  border-radius: 50%;
  border: 15px solid #dde;
  position: relative;
  overflow: hidden;
  transition: 5s;
}

.container div {
  height: 50%;
  position: absolute;
  clip-path: polygon(100% 0, 50% 100%, 0 0);
  transform: translateX(-50%);
  transform-origin: bottom;
  text-align: center;
  padding: 40px 20px 0 20px;
  font-size: 20px;
  font-weight: bold;
  font-family: sans-serif;
  color: #fff;
}

#spin {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 101;
  background-color: #e2e2e2;
  text-transform: uppercase;
  border: 8px solid #fff;
  font-weight: bold;
  font-size: 20px;
  color: #a2a2a2;
  width: 80px;
  height: 80px;
  font-family: sans-serif;
  border-radius: 50%;
  cursor: pointer;
  outline: none;
  letter-spacing: 1px;
}

#spin::after {
  content: "";
    position: absolute;
    width: 0;
    height: 0;
    border: solid;
    border-width: 0 10px 20px;
    border-color: transparent;
    border-bottom-color: #fff;
    top: -25px;
    left: 22.5px;
}

@media (max-width: 640px) {
  .container {
    width: 350px;
    height: 350px;
  }

  #spin {
    width: 40px;
    height: 40px;
    font-size: 6px;
  }

  #spin::after {
    border-width: 0 5px 10px;
    top: -15px;
    left: 8px;
  }
  .container div {
    padding: 20px 10px 0 10px;
  }
}
</style>