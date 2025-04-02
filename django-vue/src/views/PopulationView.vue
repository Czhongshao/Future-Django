<!-- django-vue/src/views/PopulationView.vue -->
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
        <PopulationBarChart />
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import PopulationBarChart from '@/components/IndexCharts/PopulationBarChart.vue';

export default defineComponent({
  components: {
    PopulationBarChart,
  },
});
</script>

<style scoped>
/* 页面容器 */
.population-view {
  position: relative; /* 设置为相对定位，以便视频背景绝对定位 */
  padding: 20px;
  max-width: 1400px; /* 增加最大宽度 */
  margin: 0 auto;
  overflow: hidden; /* 确保视频不会超出容器 */
  height: 100vh; /* 设置页面高度为视口高度 */
}

/* 视频背景 */
.background {
  position: fixed; /* 固定定位，使视频覆盖整个页面 */
  top: 0;
  left: 0;
  width: 100vw; /* 视口宽度 */
  height: 100vh; /* 视口高度 */
  object-fit: cover; /* 确保视频覆盖整个容器 */
  z-index: -1; /* 确保视频在其他内容的下方 */
}

/* 页面内容 */
.content {
  position: relative; /* 相对定位，确保内容在视频上方 */
  z-index: 1; /* 确保内容在视频上方 */
}

/* 图表容器 */
.chart-container {
  width: 80vh;
  height: 80vh; /* 图表容器高度调整为视口高度的80% */
  margin-bottom: 20px;
}
</style>