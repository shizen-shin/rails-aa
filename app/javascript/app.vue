<template>
  <div id="app">
    {{ clients }}
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data(){
    return{
      clients: []
    }
  },
  mounted(){
    axios
      .get('/api/pj1/clients')
      .then(res => (this.clients = res))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>