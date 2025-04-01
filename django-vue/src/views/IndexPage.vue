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
import PopulationBarChart from '@/components/IndexCharts/PopulationBarChart.vue';
import * as echarts from 'echarts'; // 使用 npm 安装的 echarts
import '@/assets/css/index.css';
import '@/assets/js/bootstrap.js';
import '@/assets/js/jquery-3.7.0.min.js';
import '@/assets/js/flexible.js';


export default {
  components: { PopulationBarChart },
  mounted() {
    console.log('ECharts:', echarts); // 检查 echarts 是否加载成功
    if (document.querySelector('.showTime')) {
      this.initTime();
    } else {
      console.error('.showTime 元素未找到');
    }
    this.initCharts();
  },
  methods: {
    initCharts() {
      // 初始化散点图
      const scatterChart = echarts.init(document.getElementById('scatterChart'));
      scatterChart.setOption({
        title: {
          text: '散点图示例',
        },
        tooltip: {},
        xAxis: {},
        yAxis: {},
        series: [
          {
            name: '示例数据',
            type: 'scatter',
            data: [
              [10, 20],
              [20, 30],
              [30, 40],
              [40, 50],
              [50, 60],
            ],
          },
        ],
      });

      // // 初始化地图
      // const mapChart = echarts.init(document.getElementById('mapChart'));
      // echarts.registerMap('china', chinaMap); // 注册地图
      // mapChart.setOption({
      //   title: {
      //     text: '中国地图示例',
      //   },
      //   tooltip: {},
      //   series: [
      //     {
      //       name: '示例数据',
      //       type: 'map',
      //       map: 'china',
      //       data: [
      //         { name: '北京', value: 100 },
      //         { name: '上海', value: 200 },
      //         { name: '广州', value: 300 },
      //       ],
      //     },
      //   ],
      // });

      // 初始化折线图
      const lineChart = echarts.init(document.getElementById('lineChart'));
      lineChart.setOption({
        title: {
          text: '折线图示例',
        },
        tooltip: {},
        xAxis: {
          data: ['A', 'B', 'C', 'D', 'E'],
        },
        yAxis: {},
        series: [
          {
            name: '示例数据',
            type: 'line',
            data: [10, 20, 30, 40, 50],
          },
        ],
      });

      // 初始化饼图
      const pieChart = echarts.init(document.getElementById('pieChart'));
      pieChart.setOption({
        title: {
          text: '饼图示例',
        },
        tooltip: {},
        series: [
          {
            name: '示例数据',
            type: 'pie',
            data: [
              { name: 'A', value: 10 },
              { name: 'B', value: 20 },
              { name: 'C', value: 30 },
              { name: 'D', value: 40 },
            ],
          },
        ],
      });
    },
    initTime() {
      const showTime = document.querySelector('.showTime');
      const updateTime = () => {
        const now = new Date();
        const formattedTime = `当前时间：${now.getFullYear()}年${String(now.getMonth() + 1).padStart(2, '0')}月${String(now.getDate()).padStart(2, '0')}日 - ${String(now.getHours()).padStart(2, '0')}时${String(now.getMinutes()).padStart(2, '0')}分${String(now.getSeconds()).padStart(2, '0')}秒`;
        showTime.textContent = formattedTime;
      };
      setInterval(updateTime, 1000);
      updateTime();
    },
  },
};
</script>
