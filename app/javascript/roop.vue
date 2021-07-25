<template>
  <div >
    <div v-for="(val, idx) in result" :key=idx>
      <div>{{ val }}</div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      arr: ['aaa', 'bbb', 'ccc', 'ddd'],
      isActive: false,
    }
  },
  watch:{
    arr:{
      immediate: true,
      handler(val){
        let res = []
        res = val.map( (elem, i) => {
          if ( i == 1 ){
            return  true
          } else if (i == 3){
            return false
          }
          return this.isActive
        })
        this.result = res
      }
    }
  }
}
</script>

<style>

</style>