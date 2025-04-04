<!-- django-vue/src/components/IndexCharts/PopulationMapChart.vue -->
<template>
  <div class="chart-container">
    <!-- 加载状态 -->
    <div v-if="loading" class="loading">数据加载中...</div>
    <!-- 错误提示 -->
    <div v-else-if="error" class="error">{{ error }}</div>
    <!-- 图表 -->
    <v-chart v-else class="chart" :option="chartOption" autoresize />
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import * as echarts from 'echarts';
import axios from 'axios';
import { getPopulationData } from '@/api/populationAPI';

export default {
  name: 'PopulationMapChart',
  setup() {
    const loading = ref(true);
    const error = ref(null);
    const chartOption = ref(null);

    // 加载地图数据
    const loadMapData = async () => {
      try {
        const response = await axios.get('https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json'); 
        echarts.registerMap('china', response.data);
      } catch (e) {
        error.value = `地图数据加载失败：${e.message}`;
      }
    };

    // 处理原始数据
    const processData = (rawData) => {
      const dataMap = new Map();
      rawData.filter(d => d.province !== '全国').forEach(d => {
        if (!dataMap.has(d.year)) {
          dataMap.set(d.year, []);
        }
        dataMap.get(d.year).push({ name: d.province, value: d.total_population });
      });

      return {
        years: [...dataMap.keys()].sort(),
        data: [...dataMap.entries()].sort().map(([year, data]) => ({ year, data })),
      };
    };

    // 生成图表配置
    const generateChartOption = ({ years, data }) => ({
      baseOption: {
        // 基础配置项，适用于所有时间轴上的图表
        title: {
          // 图表标题
          text: '中国人口分布图', // 主标题
          subtext: '数据来源：国家统计局', // 副标题
          left: '50%', // 标题水平居中
          top: "0", // 标题距离顶部的距离
          textAlign: 'center', // 文本对齐方式
          textStyle: {
            // 主标题的样式
            fontSize: 18, // 字体大小
            fontWeight: 'bold', // 字体加粗
            color: 'black', // 字体颜色
          },
          subtextStyle: {
            // 副标题的样式
            fontSize: 14, // 字体大小
            fontWeight: 'bold', // 字体加粗
            color: "grey", // 字体颜色
          }
        },
        tooltip: {
          // 提示框的配置
          trigger: 'item', // 触发类型为“item”，即鼠标悬停在地图上的某个区域时显示提示框
          formatter: '{b} : {c} 万人', // 提示框的内容格式，{b}表示区域名称，{c}表示对应的值
        },
        visualMap: {
          // 视觉映射组件，用于根据数据值映射颜色
          min: 0, // 数据值的最小范围
          max: 13000, // 数据值的最大范围
          text: ["分布程度(万人)", ""], // 视觉映射组件的文本内容
          calculable: false, // 显示热度条拖动分区手柄
          inRange: {
            // 数据值范围内的颜色映射
            color: ['#ffaf78', '#d76d77', '#3a1c71'], // 从浅到深的颜色渐变
          },
          orient: 'vertical', // 垂直方向布局
          left: '0%', // 距离左侧的距离
          top: '20%', // 距离顶部的距离
        },
        series: [{
          // 系列配置
          name: '人口', // 系列名称
          type: 'map', // 类型为地图
          map: 'china', // 使用中国地图
          roam: true, // 允许缩放和平移地图
          label: { show: false }, // 是否显示地图上的区域名称
          emphasis: { // 高亮样式
            label: { show: false }, // 高亮时不显示区域名称
            itemStyle: { areaColor: '#ff6600' } // 高亮时的区域颜色
          },
        }],
        timeline: {
          // 时间轴的配置
          axisType: 'category', // 类型为类别轴
          data: years, // 时间轴上的数据，即年份
          autoPlay: true, // 自动播放
          playInterval: 3000, // 自动播放的时间间隔（3秒）
          orient: 'vertical', // 垂直方向布局
          right: '0%', // 距离右侧的距离
          top: 'middle', // 垂直居中
          width: '75px', // 宽度
          height: '75%', // 高度
          label: {
            // 时间轴标签的样式
            formatter: function (value) {
              return value + '年'; // 在年份后面添加“年”字
            },
            color: '#000', // 字体颜色
            position: -10, // 标签的位置（稍微偏移）
          },
          lineStyle: { width: 2, color: '#000' }, // 时间轴线条的样式
        },
      },
      options: data.map(({ year, data }) => ({
        // 根据传入的数据生成各个时间点的配置项
        title: { text: `${year}年中国人口分布图` }, // 每个时间点的标题内容
        series: [{ data }], // 每个时间点的地图数据
      })),
    });

    // 初始化图表
    onMounted(async () => {
      try {
        await loadMapData();
        const { data } = await getPopulationData();
        chartOption.value = generateChartOption(processData(data));
      } catch (e) {
        error.value = `数据加载失败：${e.message}`;
      } finally {
        loading.value = false;
      }
    });

    return { loading, error, chartOption };
  },
};
</script>
