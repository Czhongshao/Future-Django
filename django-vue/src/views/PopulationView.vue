<template>
  <div class="population-view">
    <!-- 视频背景 -->
    <video class="background" autoplay loop muted>
      <source src="@/assets/video/background01.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>

    <!-- 页面内容 -->
    <div class="content">
      <h1>人口数据可视化</h1>
      <!-- 图表组件 -->
      <div class="chart-container">
        <GDPBarChart />
      </div>
    </div>
  </div>
</template>

<script>

import { defineComponent } from 'vue';
import GDPBarChart from '@/components/IndexCharts/GDPBarChart.vue';
// import PopulationMapChart from '@/components/IndexCharts/PopulationMapChart.vue';
// import PopulationPieChart from '@/components/IndexCharts/PopulationPieChart.vue';
// import PopulationLineChart from '@/components/IndexCharts/PopulationLineChart.vue';


export default defineComponent({
  components: {
    GDPBarChart, // 注册柱状图组件
  },
});
</script>

<style scoped>
/* 页面容器样式 */
.population-view {
  position: relative; /* 设置为相对定位，方便视频背景绝对定位 */
  padding: 20px;
  max-width: 1400px;
  margin: 0 auto;
  overflow: hidden;
  height: 100vh;
}

/* 视频背景样式 */
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  object-fit: cover;
  z-index: -1;
}

/* 页面内容样式 */
.content {
  position: relative;
  z-index: 1;
}

/* 图表容器样式 */
.chart-container {
  width: 80vh;
  height: 80vh;
  margin-bottom: 20px;
}
</style>