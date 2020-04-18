import Vue from 'vue/dist/vue.esm';
import router from '../routes.js';

import axios from 'axios'
import VueAxios from 'vue-axios'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

Vue.use(ElementUI)
Vue.use(VueAxios, axios)

const app = new Vue({
  router,
}).$mount('#app')
