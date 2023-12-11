<template>
  <div class="tw-space-y-4">
    <div class="tw-space-y-2">
      <q-input label="Username" dense v-model="username" @keyup.enter="register"></q-input>
      <q-input type="password" label="Password" dense v-model="password" @keyup.enter="register"></q-input>
    </div>
    <div class="tw-text-right">
      <q-btn label="Register" @click="register"></q-btn>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import authCaller from 'callers/auth-caller';
import dialog from 'utilities/dialog';

const username = ref();
const password = ref();

const register = async () => {
  const result = await authCaller.register(username.value, password.value);
  dialog.hide(result);
}
</script>