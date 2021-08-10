<template>
  <div>
    <table>
      <tbody>
        <tr>
          <th>Project Name</th>
          <th>Client Nmae</th>
          <th>Status</th>
          <th>Details Link</th>
          <th>Delete</th>
        </tr>
        <tr v-for="(client, index) in clients" :key="index">
          <td>{{ client.client_name }}</td>
          <td>{{ client.pj_name }}</td>
          <td>{{ client.status }}</td>
          <td><router-link :to="{ name: 'client', params: { id: client.id }}">{{ client.id }}</router-link></td>
          <td>
            <button @click="deleteTarget = client.id; showModal = true">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
    <Modal v-if="showModal" @cancel="showModal = false" @ok="deleteClient(); showModal = false;">
      <div slot="body">本当に削除しますか？</div>
    </Modal>
  </div>
</template>

<script>
import Modal from '../Modal.vue'
import axios from 'axios';

export default {
  components:{
    Modal
  },
  data(){
    return{
      clients: [],
      showModal: false,
      deleteTarget: -1,
      errors: '',
    }
  },
  mounted(){
    this.getClients();
  },
  methods:{
    getClients(){
      axios
      .get('/api/pj1/clients')
      .then(response => (this.clients = response.data))
    },
    deleteClient: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/pj1/clients/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.getClients();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
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