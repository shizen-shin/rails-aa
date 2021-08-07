<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>Project Name</th>
          <th>Client Nmae</th>
          <th>Status</th>
        </tr>
        <tr v-for="(client, index) in clients" :key="index">
          <td>{{ client.client_name }}</td>
          <td>{{ client.pj_name }}</td>
          <td>{{ client.status }}</td>
        </tr>
      </tbody>
    </table>
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
      .then(response => (this.clients = response.data))
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>