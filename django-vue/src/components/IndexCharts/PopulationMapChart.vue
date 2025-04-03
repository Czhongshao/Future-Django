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
        title: {
          text: '中国人口分布图',
          subtext: '数据来源：国家统计局',
          left: '50%',
          top: "0",
          textAlign: 'center',
          textStyle: {
            fontSize: 18,
            fontWeight: 'bold',
            color: 'black',
          },
          subtextStyle: {
            fontSize: 14,
            fontWeight: 'bold',
            color: "grey",
          }
        },
        tooltip: {
          trigger: 'item',
          formatter: '{b} : {c} 万人',
        },
        visualMap: {
          min: 0,
          max: 13000,
          text: ["分布程度(万人)", ""],
          calculable: true,
          inRange: {
            color: ['#ffaf78', '#d76d77', '#3a1c71'],
          },
          orient: 'vertical',
          left: '0%',
          top: '20%',
        },
        series: [{
          name: '人口',
          type: 'map',
          map: 'china',
          roam: true,
          label: { show: false },
          emphasis: { label: { show: true }, itemStyle: { areaColor: '#ff6600' } },
        }],
        timeline: {
          axisType: 'category',
          data: years,
          autoPlay: true,
          playInterval: 3000,
          orient: 'vertical',
          right: '0%',
          top: 'middle',
          width: '75px',
          height: '75%',
          label: {
            formatter: function (value) {
              return value + '年';
            },
             color: '#000',
             position: -10,
          },
          lineStyle: { width: 2, color: '#000' },
        },
      },
      options: data.map(({ year, data }) => ({
        title: { text: `${year}年中国人口分布图` },
        series: [{ data }],
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
