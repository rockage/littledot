import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import VueRouter from 'vue-router'
import router from './router' //引入我们自己的路由定义表
Vue.use(VueRouter) //启用vue-router插件

Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  render: function (h) { return h(App) }
}).$mount('#app')
