<template>
  <form @submit.prevent="createClient">
    <div class="error-wrapper" v-if="errors.length != 0">
      <ul v-for="error in errors" :key="error">
        <li><font color="red">{{ error }}</font></li>
      </ul>
    </div>
    <div>
      <label>client_name</label>
      <input v-model="client.client_name" value="初期値" type="text">
    </div>
    <div>
      <label>pj_name</label>
      <input v-model="client.pj_name" type="text">
    </div>
    <div>
      <label>status</label>
      <select v-model="client.status">
        <option>契約前</option>
        <option>進行中</option>
        <option>完了</option>
      </select>
    </div>
    <div>
      <label>order_date</label>
      <input v-model="client.order_date" type="date">
    </div>
    <div>
      <label>price</label>
      <input v-model="client.price" type="number" min="0">
    </div>
    <div>
      <label>memo</label>
      <textarea v-model="client.memo"></textarea>
    </div>
    <button type="submit">送信</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data(){
    return {
      client: {
        client_name: '',
        pj_name: '',
        status: '',
        order_date: '',
        price: '',
        memo: '',
      },
      errors: ''
    }
  },
  methods: {
    createClient(){
      console.log(this.client)
      axios
        .post('/api/pj1/clients', this.client)
        .then(response => {
          let res = response.data;
          this.$router.push({ name: 'client', params: { id: res.id } });
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
div:not(.error-wrapper){
  display: flex;
}
label{
  width: 15%;
}
input, select, textarea{
  margin: 3px;
  width: 30%;
  border: 1px solid gray;
}
button{
  margin: 10px;
  display: inline-block;
  padding: 0.5em 1em;
  text-decoration: none;
  background: #668ad8;
  color: #FFF;
  border-bottom: solid 4px #627295;
  border-radius: 3px;
  &:active{
    -webkit-transform: translateY(4px);
    transform: translateY(4px);
    border-bottom: none;
  }
}
</style>