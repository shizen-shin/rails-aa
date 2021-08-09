<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import Top from './components/Top'
import Client from './components/clients/Client'
import Clients from './components/clients/Clients'
import ClientNew from './components/clients/ClientNew'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: Top,
      name: 'top',
    },
    {
      path: '/clients',
      component: Clients,
      name: 'clients',
    },
    {
      path: '/clients/:id(\\d+)',
      component: Client,
      name: 'client',
    },
    {
      path: '/clients/new',
      component: ClientNew,
      name: 'clientNew'
    }
  ]
})

export default {
  router
}
</script>

<style lang="scss" scoped>
</style>