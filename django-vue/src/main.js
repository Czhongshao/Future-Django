// django-vue/src/main.js
import { createApp } from 'vue';
import App from './App.vue';
import router from './router/router';
import ECharts from 'vue-echarts';

import { use } from 'echarts/core';
import { CanvasRenderer } from 'echarts/renderers';
import { BarChart } from 'echarts/charts';
import {
  GridComponent,
  TitleComponent,
  TooltipComponent,
  TimelineComponent
} from 'echarts/components';

use([
  CanvasRenderer,
  BarChart,
  GridComponent,
  TitleComponent,
  TooltipComponent,
  TimelineComponent
]);

const app = createApp(App);
app.component('v-chart', ECharts);
app.use(router);
app.mount('#app');