<template>
  <ClientForm :errors='errors' :client="client" @submit="createClient" />
</template>

<script>
import ClientForm from './ClientForm.vue'
import axios from 'axios'

export default {
  components:{
    ClientForm: ClientForm,
  },
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
</style>