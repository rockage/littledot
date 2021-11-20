import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import VueRouter from 'vue-router'
import router from './router' //引入我们自己的路由定义表
import axios from 'axios'


Vue.use(VueRouter) //启用vue-router插件

Vue.config.productionTip = false
Vue.config.productionTip = false
Vue.prototype.axios = axios
axios.defaults.withCredentials = true
// axios.defaults.baseURL = 'https://rockage.net/api/'
axios.defaults.baseURL = 'http://localhost:5050/'


new Vue({
  vuetify,
  router,
  render: function (h) { return h(App) }
}).$mount('#app')
