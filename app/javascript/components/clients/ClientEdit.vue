<template>
<div>
  <ClientForm :errors="errors" :client="client" @submit="updateClient" />
</div>
</template>

<script>
import ClientForm from './ClientForm.vue';
import axios from 'axios';

export default {
  components: {
    ClientForm
  },
  data(){
    return {
      client: {},
      errors: ''
    }
  },
  mounted(){
    axios
      .get(`/api/pj1/clients/${this.$route.params.id}.json`)
      .then(response => (this.client = response.data))
  },
  methods: {
    updateClient(){
      axios
        .patch(`/api/pj1/clients/${this.client.id}`, {client: this.client})
        .then(response => {
          this.$router.push({ name: 'clients' });
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