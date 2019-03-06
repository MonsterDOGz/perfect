<template>
  <div class="main">
    <index-banner></index-banner>
    <index-buying></index-buying>
    <index-floor></index-floor>
    <index-hotcomment></index-hotcomment>
  </div>
</template>

<script>
import IndexBanner from './components/banner.vue'
import IndexBuying from './components/buying.vue'
import IndexFloor from './components/floor.vue'
import IndexHotcomment from './components/hotComment.vue'

export default {
  components: {
    IndexBanner,
    IndexBuying,
    IndexFloor,
    IndexHotcomment
  }
}
</script>

<style>

</style>
