<template>
  <div class="main">
    <index-banner></index-banner>
    <index-buying></index-buying>
    <index-floor></index-floor>
    <index-hotcomment></index-hotcomment>
    <login-box></login-box>
  </div>
</template>

<script>
import IndexBanner from './components/banner.vue'
import IndexBuying from './components/buying.vue'
import IndexFloor from './components/floor.vue'
import IndexHotcomment from './components/hotComment.vue'
import LoginBox from '../user/loginBox.vue'

export default {
  components: {
    IndexBanner,
    IndexBuying,
    IndexFloor,
    IndexHotcomment,
    LoginBox
  }
}
</script>

<style>

</style>
