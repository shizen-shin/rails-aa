<template>
  <v-app id="app">
    <Header/>

    <p class="page-title">{{ message }}</p>
    <Mountain/>

    <v-alert
      type="success"
      width="400px"
      color="green"
      class="mx-auto"
    >Alert created by Vuetify</v-alert>

  </v-app>
</template>

<script>
import Mountain from "./components/Mountain"
import Header from "./components/Header"

export default {
  components: {
    Mountain,
    Header
  },
  data: function () {
    return {
      message: "Hello Vue!",
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.page-title{
  margin-top: 20px;
}
</style>
