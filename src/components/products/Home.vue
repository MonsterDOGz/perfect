<template>
  <div class="main">
    <product-detail :getInfo="info"></product-detail>
    <product-info :getInfo="info"></product-info>
  </div>
</template>

<script>
import ProductDetail from './components/detail.vue'
import ProductInfo from './components/info.vue'

export default {
  data () {
    return {
      info: ''
    }
  },
  components: {
    ProductDetail,
    ProductInfo
  },
  watch: {
    '$route': function () {
      this.product(this.$route.params.pid)
    }
  },
  methods: {
    product (pid) {
      var url = `/api/product/product?pid=${pid}`
      this.axios.get(url).then(result => {
        this.info = result.data.data[0]
        // console.log(this.info)
        this.info.pic = this.info.pic.split(',')
        this.info.introduce = this.info.introduce.split(',')
        this.info.style = this.info.style.split(',')
        var url = `/api/product/productClass?cid=${this.info.cid}`
        this.axios.get(url).then(result => {
          this.info.cid = result.data.data[0].class
        })
      })
    }
  },
  mounted () {
    this.product(this.$route.params.pid)
  }
}
</script>

<style lang="stylus" scoped>

</style>
