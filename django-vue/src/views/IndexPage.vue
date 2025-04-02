<!-- django-vue/src/views/IndexPage.vue -->
<template>
  <div class="index-page">
    <video class="background" autoplay loop muted>
      <source src="@/assets/video/background01.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>

    <!-- 标题盒子设计 -->
    <header>
      <h1>人口与社会趋势可视化大屏</h1>
      <div class="showTime"></div>
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
          <h2>柱状图</h2>
          <PopulationBarChart class="chart" />
        </div>
      </div>

      <!-- 中间图表 -->
      <div class="column">
        <div class="panel1 map">
          <h2>中国地图</h2>
          <div id="mapChart" class="chart"></div>
          <p class="shentu">注：基于自然资源部标准地图服务网站GS京(2022)1061号的标准地图制作，底图边界无修改。</p>
        </div>
      </div>

      <!-- 右侧图表 -->
      <div class="column">
        <div class="panel line">
          <h2>折线图</h2>
          <div id="lineChart" class="chart"></div>
        </div>
        <div class="panel pie">
          <h2>饼图</h2>
          <div id="pieChart" class="chart"></div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import PopulationBarChart from '@/components/IndexCharts/PopulationBarChart.vue';
import '@/assets/js/bootstrap.js';
import '@/assets/js/jquery-3.7.0.min.js';
import '@/assets/js/flexible.js';

export default defineComponent({
  components: {
    PopulationBarChart,
  },
});
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
li {
  list-style: none;
}
body {
  background-color: #66bfbf;
  line-height: 1.15;
  overflow: hidden;
}
header {
  position: relative;
  height: 10vh; /* 使用视口高度单位 */
}
header h1 {
  font-size: 3vw; /* 使用视口宽度单位 */
  color: #f9f7f7;
  text-align: center;
  line-height: 10vh; /* 使用视口高度单位 */
}
header .showTime {
  position: absolute;
  right: 2vw; /* 使用视口宽度单位 */
  line-height: 9vh; /* 使用视口高度单位 */
  color: #90f2ff;
  font-size: 2vw; /* 使用视口宽度单位 */
  top: 0;
}
.mainbox {
  display: flex;
  width: 100%; /* 按比例分配宽度 */
  margin: 0 auto;
  padding: 1vw 1vw 0; /* 使用视口宽度单位 */
}
.mainbox .column {
  flex: 3; /* 按比例分配 */
}
.mainbox .column:nth-child(2) {
  flex: 5; /* 按比例分配 */
  margin: 0 1vw 1.5vw; /* 使用视口宽度单位 */
}
.mainbox .panel {
  position: relative;
  height: 35vh; /* 使用视口高度单位 */
  border: 1px solid #3dffff;
  margin-bottom: 1.5vw; /* 使用视口宽度单位 */
  background: url() rgba(0, 0, 139, 0.2);
}
.mainbox .panel::before {
  position: absolute;
  top: 0;
  left: 0;
  width: 5vw; /* 使用视口宽度单位 */
  height: 5vw; /* 使用视口宽度单位 */
  border-left: 2px solid #00d6d6;
  border-top: 2px solid #00d6d6;
  content: '';
}
.mainbox .panel::after {
  position: absolute;
  top: 0;
  right: 0;
  width: 5vw; /* 使用视口宽度单位 */
  height: 5vw; /* 使用视口宽度单位 */
  border-right: 2px solid #00d6d6;
  border-top: 2px solid #00d6d6;
  content: '';
}
.mainbox .panel .panel-footer {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
}
.mainbox .panel .panel-footer::before {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 5vw; /* 使用视口宽度单位 */
  height: 5vw; /* 使用视口宽度单位 */
  border-left: 2px solid #00d6d6;
  border-bottom: 2px solid #00d6d6;
  content: '';
}
.mainbox .panel .panel-footer::after {
  position: absolute;
  bottom: 0;
  right: 0;
  width: 5vw; /* 使用视口宽度单位 */
  height: 5vw; /* 使用视口宽度单位 */
  border-right: 2px solid #00d6d6;
  border-bottom: 2px solid #00d6d6;
  content: '';
}
.mainbox h2 {
  height: 5vh; /* 使用视口高度单位 */
  line-height: 5vh; /* 使用视口高度单位 */
  text-align: center;
  color: #f9f7f7;
  font-size: 2vw; /* 使用视口宽度单位 */
  font-weight: 400;
}
.mainbox .chart {
  height: 30vh; /* 使用视口高度单位 */
}
.map {
  height: 50vh; /* 使用视口高度单位 */
  background-color: #00d6d6;
}
.map .chart {
  height: 100%;
  width: 100%;
}
.panel1 {
  position: relative;
  height: 50vh; /* 使用视口高度单位 */
  border: 1px solid #00d6d6;
  margin-bottom: 1.5vw; /* 使用视口宽度单位 */
  background: url() rgba(0, 0, 139, 0.2);
}
.panel1::after {
  position: absolute;
  top: 0;
  right: 0;
  width: 20vw; /* 使用视口宽度单位 */
  height: 20vw; /* 使用视口宽度单位 */
  border-right: 3px solid #00d6d6;
  border-top: 3px solid #00d6d6;
  content: '';
}
.panel1 .panel-footer {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
}
.panel1 .panel-footer::before {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 40vw; /* 使用视口宽度单位 */
  height: 40vw; /* 使用视口宽度单位 */
  border-left: 3px solid #00d6d6;
  border-bottom: 3px solid #00d6d6;
  content: '';
}
.shentu {
  font-size: 1.5vw; /* 使用视口宽度单位 */
  position: absolute;
  color: #f9f7f7;
  text-align: center;
  left: 10%;
  bottom: 1%;
}
.background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0.8;
}

/* 媒体查询以适应不同屏幕尺寸 */
@media (max-width: 768px) {
  .mainbox .column {
    flex: 1; /* 在小屏幕上平均分配 */
  }
  .mainbox .column:nth-child(2) {
    flex: 1; /* 在小屏幕上平均分配 */
    margin: 0; /* 移除边距 */
  }
  .mainbox .panel, .panel1 {
    height: 40vh; /* 调整高度以适应小屏幕 */
  }
  .mainbox h2, header h1, header .showTime, .shentu {
    font-size: 3vw; /* 调整字体大小以适应小屏幕 */
  }
}
</style>