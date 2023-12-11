
<template>
  <q-layout view="hHh lpR fFf">

    <q-header elevated class="bg-primary text-white">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggleLeftDrawer" />

        <q-toolbar-title>
          SSV League
        </q-toolbar-title>

        <q-btn-dropdown flat no-caps icon="person" :label="user?.username">
          <q-list class="tw-w-[150px]">
            <q-item clickable v-close-popup @click="login" v-if="!isLoggedIn">
              <q-item-section>
                <q-item-label>Login</q-item-label>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup @click="register" v-if="!isLoggedIn">
              <q-item-section>
                <q-item-label>Register</q-item-label>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup to="/ssv-league/match-management" v-if="isLoggedIn && [1, 99].includes(role)">
              <q-item-section>
                <q-item-label>Management</q-item-label>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup @click="logout" v-if="isLoggedIn">
              <q-item-section>
                <q-item-label>Logout</q-item-label>
              </q-item-section>
            </q-item>
          </q-list>
        </q-btn-dropdown>
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

        <q-item clickable v-ripple to="/ssv-league/statistics" :active="$route.name == 'statistics'">
          <q-item-section avatar>
            <q-icon name="query_stats" />
          </q-item-section>
          <q-item-section>
            Statistics
          </q-item-section>
        </q-item>
        <q-separator />

        <q-item clickable v-ripple target="_blank" href="https://docs.google.com/spreadsheets/d/1h89F41m7gNJ1cTgHijwt-4tFgiNJhc7USAmjXQIwB9A/">
          <q-item-section avatar>
            <q-icon name="schedule" />
          </q-item-section>
          <q-item-section>
            Schedule
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
import { ref, defineAsyncComponent } from 'vue'
import dialog from 'utilities/dialog';
import { useAuthStore } from 'stores/auth-store';
import { storeToRefs } from 'pinia';
import authCaller from 'callers/auth-caller'

const LoginModal = defineAsyncComponent(() => import('components/Login.vue'));
const RegisterModal = defineAsyncComponent(() => import('components/Register.vue'));

const auth = useAuthStore();
const { user, isLoggedIn, role } = storeToRefs(auth);

const leftDrawerOpen = ref(false);

const toggleLeftDrawer = () => {
  leftDrawerOpen.value = !leftDrawerOpen.value;
}

const register = async () => {
  await dialog.showContent('Register', RegisterModal, { width: '400px' });
}

const login = async () => {
  await dialog.showContent('Login', LoginModal, { width: '400px' });
}

const logout = () => {
  authCaller.logout();
  auth.logout();
}
</script>