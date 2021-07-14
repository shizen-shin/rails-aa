<template>
  <v-app id="app">
    <p>{{ message }}</p>
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

export default {
  components: {
    Mountain
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
</style>
