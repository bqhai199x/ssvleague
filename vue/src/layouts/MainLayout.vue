
<template>
  <q-layout view="hHh lpR fFf">

    <q-header elevated class="bg-primary text-white">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggleLeftDrawer" />

        <q-toolbar-title>
          <q-avatar>
            <img src="https://cdn.quasar.dev/logo-v2/svg/logo-mono-white.svg">
          </q-avatar>
          HaiBQ
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-drawer show-if-above v-model="leftDrawerOpen" side="left" bordered>
      <!-- drawer content -->
      <q-list>
        <q-item clickable v-ripple to="/ssv-league/rank" :active="$route.name == 'rank'">
          <q-item-section avatar>
            <q-icon name="sports_soccer" />
          </q-item-section>
          <q-item-section>
            Ranking
          </q-item-section>
        </q-item>
        <q-separator />

        <q-item clickable v-ripple to="/ssv-league/matching" :active="$route.name == 'matching'">
          <q-item-section avatar>
            <q-icon name="handshake" />
          </q-item-section>
          <q-item-section>
            Matching
          </q-item-section>
        </q-item>
        <q-separator />

        <q-item clickable v-ripple to="/ssv-league/history/all" :active="$route.name == 'history'">
          <q-item-section avatar>
            <q-icon name="history" />
          </q-item-section>
          <q-item-section>
            History
          </q-item-section>
        </q-item>
        <q-separator />

      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view :key="$route.fullPath"/>
    </q-page-container>

  </q-layout>
</template>

<script setup>
import { ref } from 'vue'

const leftDrawerOpen = ref(false)

const toggleLeftDrawer = () => {
  leftDrawerOpen.value = !leftDrawerOpen.value
}
</script>