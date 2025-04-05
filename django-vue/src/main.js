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

const app = createApp(App);
app.component('v-chart', ECharts);
app.use(router);
app.mount('#app');