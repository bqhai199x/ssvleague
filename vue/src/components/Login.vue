<template>
  <div class="tw-space-y-4">
    <div class="tw-space-y-2">
      <q-input label="Username" dense v-model="username"></q-input>
      <q-input type="password" label="Password" dense v-model="password"></q-input>
    </div>
    <div class="tw-text-right">
      <q-btn label="Login" @click="login"></q-btn>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import authCaller from 'callers/auth-caller';
import dialog from 'utilities/dialog';
import { useAuthStore } from 'stores/auth-store';

const username = ref();
const password = ref();
const auth = useAuthStore();

const login = async () => {
  const result = await authCaller.login(username.value, password.value);
  if (result) {
    auth.login(result);
    dialog.hide(result);
  }
}
</script>