<!-- src/views/IndexPage.vue -->
<template>
  <div class="index-page">
    <!-- 使用图片作为背景 -->
    <img class="background" src="@/assets/img/background01.png" alt="背景图1">

    <!-- 标题与导航区块 -->
    <header>
      <div class="header-content">
        <div class="actions">
          <router-link to="/" class="button">主页</router-link>
          <a href="https://github.com/Czhongshao/Future-Django" class="button" target="_blank">我的项目地址</a>
          <router-link to="/about" class="button">关于我</router-link>
        </div>
        <h1>人口与社会趋势可视化大屏</h1>
      </div>
    </header>

    <!-- 主要内容区：三栏布局，分别放置不同类型的图表 -->
    <section class="mainbox">
      <!-- 左侧图表区 -->
      <div class="column">
        <div class="panel scatter">
          <LeftTopChart class="chart" />
        </div>
        <div class="panel bar">
          <GDPBarChart class="chart" />
        </div>
      </div>

      <!-- 中间地图区 -->
      <div class="column">
        <div class="panel1 map">
          <PopulationMapChart class="chart" />
          <p class="shentu">注：基于自然资源部标准地图服务网站GS京(2022)1061号的标准地图制作，底图边界无修改。</p>
        </div>
      </div>

      <!-- 右侧图表区 -->
      <div class="column">
        <div class="panel line">
          <PopulationLineChart class="chart" />
        </div>
        <div class="panel pie">
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
import LeftTopChart from '@/components/IndexCharts/LeftTopChart.vue';


import '@/assets/js/flexible.js';
import '@/assets/css/index.css';

export default defineComponent({
  components: {
    GDPBarChart,
    PopulationMapChart,
    PopulationPieChart,
    PopulationLineChart,
    LeftTopChart,
  },
});
</script>