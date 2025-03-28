import { createApp } from 'vue'
import App from './App.vue'
import axiosPlugin from './api/index' // 导入插件

const app = createApp(App)

// 注册插件
app.use(axiosPlugin)

// 挂载应用
app.mount('#app')