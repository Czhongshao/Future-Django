// django-vue/src/main.js
import { createApp } from 'vue';
import App from './App.vue';
import router from './router/router';
import ECharts from 'vue-echarts';

import { use } from 'echarts/core';
import { CanvasRenderer } from 'echarts/renderers';

import { 
  BarChart,
  MapChart,
  PieChart,
  ScatterChart,
  LineChart,
 } from 'echarts/charts';

import {
  GridComponent,
  TitleComponent,
  TooltipComponent,
  TimelineComponent,
  LegendComponent,
  VisualMapComponent,
} from 'echarts/components';

use([
  CanvasRenderer,
  
  BarChart,
  MapChart,
  PieChart,
  ScatterChart,
  LineChart,

  GridComponent,
  TitleComponent,
  TooltipComponent,
  TimelineComponent,
  LegendComponent,
  VisualMapComponent,
]);

// 创建Vue应用实例
const app = createApp(App);
// 注册全局ECharts组件
app.component('v-chart', ECharts);
// 挂载路由
app.use(router);
// 挂载到页面根节点
app.mount('#app');