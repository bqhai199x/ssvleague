<template>
  <div>
    <div class="tw-m-5">
      <q-btn color="secondary" label="Create match" to="/ssv-league/create-match"/>
    </div>
    <q-table
      class="my-sticky-header-table tw-m-5"
      flat bordered
      title="Match list"
      :rows="matches"
      :columns="columns"
      row-key="name"
      :pagination="pagination"
      @row-dblclick="clickRow"
      separator="cell"
      table-header-class="tw-bg-gray-100"
    />
  </div>
</template>

<script setup>
import ssvLeagueCaller from 'callers/ssv-league.caller';
import { onMounted, ref } from 'vue';
import { states } from 'helper/constant';
import { useRouter } from 'vue-router';

const router = useRouter();

const matches = ref();

const columns = [
  {
    name: 'home_player',
    label: 'Home',
    align: 'left',
    field: row => row.home_player,
    sortable: true,
    headerStyle: 's'
  },
  {
    name: 'away_player',
    label: 'Away',
    align: 'left',
    field: row => row.away_player,
    sortable: true
  },
  {
    name: 'key',
    label: 'Key',
    align: 'left',
    field: row => row.key
  },
  {
    name: 'home_key',
    label: 'Home key',
    align: 'left',
    field: row => row.home_key
  },
  {
    name: 'away_key',
    label: 'Away key',
    align: 'left',
    field: row => row.away_key
  },
  {
    name: 'state',
    label: 'State',
    align: 'left',
    field: row => states.find(x => x.value == row.ban_pick_state)?.label
  },
  {
    name: 'date',
    label: 'Date',
    align: 'left',
    field: row => (new Date(row.date)).toDateString()
  },
]

const pagination = {
  rowsPerPage: 10
}

const clickRow = (evt, row) => {
  router.push('/ssv-league/update-match?key=' + row.key);
}

onMounted(async() => {
  matches.value = await ssvLeagueCaller.getAllMatch();
})
</script>