<template>
  <div>
      <dl>
          <dt>client_id</dt>
          <dd>{{ client.id }}</dd>
          <dt>client_name</dt>
          <dd>{{ client.client_name }}</dd>
          <dt>pj_name</dt>
          <dd>{{ client.pj_name }}</dd>
          <dt>status</dt>
          <dd>{{ client.status }}</dd>
          <dt>price</dt>
          <dd>{{ client.price }}</dd>
          <dt>order_date</dt>
          <dd>{{ client.order_date }}</dd>
          <dt>memo</dt>
          <dd>{{ client.memo }}</dd>
      </dl>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data(){
    return{
      client: []
    }
  },
  mounted(){
    axios
      .get(`/api/pj1/clients/${this.$route.params.id}.json`)
      .then(response => (this.client = response.data))
  }
}
</script>



<style lang="scss" scoped>
dl {
  display: flex;
  flex-wrap: wrap;
  padding: 10px;
  dt {
    width: 30%;
    border: 1px solid gray;
    padding: 10px;
  }
  dd {
    width: 50%;
    border: 1px solid gray;
    padding: 10px;
  }
}
</style>