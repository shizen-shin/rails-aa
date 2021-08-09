<template>
  <div>
    <table>
      <tbody>
        <tr>
          <th>Project Name</th>
          <th>Client Nmae</th>
          <th>Status</th>
          <th>Details Link</th>
        </tr>
        <tr v-for="(client, index) in clients" :key="index">
          <td>{{ client.client_name }}</td>
          <td>{{ client.pj_name }}</td>
          <td>{{ client.status }}</td>
          <td><router-link :to="{ name: 'client', params: { id: client.id }}">{{ client.id }}</router-link></td>
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

<style lang="scss" scoped>
table{
  text-align: center;
  th{
    padding: 10px;
    color: #FF9800;
    background: #fff5e5;
  }
  td{
    padding: 10px;
    border: 1px solid lightgray;
  }
}
</style>