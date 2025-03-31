// django-vue/src/main.js
import { createApp } from 'vue'
import App from './App.vue'
 
 
const  app = createApp(App)
import router from './router/router'
app.use(router);  //注册路由
 
app.mount('#app')
 
 