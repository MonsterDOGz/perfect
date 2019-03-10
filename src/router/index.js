import Vue from 'vue'
import Router from 'vue-router'
import IndexHome from '@/components/index/Home'
import ProductsHome from '@/components/products/Home'
import userRegister from '@/components/user/register'
import CartHome from '@/components/cart/Home'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'IndexHome',
      component: IndexHome
    },
    {
      path: '/products/:pid',
      name: 'ProductsHome',
      component: ProductsHome
    },
    {
      path: '/reg',
      name: 'userRegister',
      component: userRegister
    },
    {
      path: '/cart',
      name: 'CartHome',
      component: CartHome
    }
  ]
})
