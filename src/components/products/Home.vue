<template>
  <div class="main">
    <product-detail></product-detail>
    <product-info></product-info>
  </div>
</template>

<script>
import ProductDetail from './components/detail.vue'
import ProductInfo from './components/info.vue'

export default {
  components: {
    ProductDetail,
    ProductInfo
  }
}
</script>

<style lang="stylus" scoped>

</style>
