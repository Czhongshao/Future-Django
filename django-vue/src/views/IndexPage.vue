<!-- django-vue/src/views/IndexPage.vue -->
<template>
  <div class="index-page">
    <!-- 使用视频作为背景 -->
    <!-- <video class="background" autoplay loop muted>
      <source src="@/assets/video/background01.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video> -->

    <!-- 使用图片作为背景 -->
    <img class="background" src="@/assets/img/background01.png" alt="背景图1">

    <!-- 标题盒子设计 -->
    <header>
      <img class="background-header" src="@/assets/img/background02.png" alt="背景图2">
      <div class="header-content">
        <h1>人口与社会趋势可视化大屏</h1>
        <div class="showTime"></div>
      </div>
    </header>

    <!-- 主要内容区域 -->
    <section class="mainbox">
      <!-- 左侧图表 -->
      <div class="column">
        <div class="panel scatter">
          <h2>散点图</h2>
          <div id="scatterChart" class="chart"></div>
        </div>
        <div class="panel bar">
          <!-- <h2>柱状图</h2> -->
          <GDPBarChart class="chart" />
        </div>
      </div>

      <!-- 中间图表 -->
      <div class="column">
        <div class="panel1 map">
          <!-- <h2>中国地图</h2> -->
          <PopulationMapChart class="chart" />
          <p class="shentu">注：基于自然资源部标准地图服务网站GS京(2022)1061号的标准地图制作，底图边界无修改。</p>
        </div>
      </div>

      <!-- 右侧图表 -->
      <div class="column">
        <div class="panel line">
          <!-- <h2>折线图</h2> -->
          <PopulationLineChart class="chart" />
        </div>
        <div class="panel pie">
          <!-- <h2>饼图</h2> -->
          <PopulationPieChart class="chart" />
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import GDPBarChart from '@/components/IndexCharts/GDPBarChart.vue';
import PopulationMapChart from '@/components/IndexCharts/PopulationMapChart.vue';
import PopulationPieChart from '@/components/IndexCharts/PopulationPieChart.vue';
import PopulationLineChart from '@/components/IndexCharts/PopulationLineChart.vue';

import '@/assets/js/bootstrap.js';
import '@/assets/js/jquery-3.7.0.min.js';
import '@/assets/js/flexible.js';
import '@/assets/css/index.css';

export default defineComponent({
  components: {
    GDPBarChart,
    PopulationMapChart,
    PopulationPieChart,
    PopulationLineChart,
  },
});
</script>
