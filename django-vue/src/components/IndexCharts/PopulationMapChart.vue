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
import { ref, onMounted, onUnmounted } from 'vue';
import * as echarts from 'echarts';
import axios from 'axios';
import { getPopulationData } from '@/api/populationAPI';

export default {
  name: 'PopulationMapChart',
  setup() {
    const loading = ref(true);
    const error = ref(null);
    const chartOption = ref(null);
    const mapData = ref(null);

    // 加载地图数据
    const loadMapData = async () => {
      try {
        const response = await axios.get('https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json'); // 确保路径正确
        mapData.value = response.data;
        echarts.registerMap('china', mapData.value); // 注册地图
      } catch (e) {
        error.value = `地图数据加载失败：${e.message}`;
      }
    };

    // 处理原始数据
    const processData = (rawData) => {
      const years = [...new Set(rawData.map((d) => d.year))].sort(); // 获取所有年份并排序
      const dataMap = new Map();

      // 按年份分组并过滤全国数据
      rawData
        .filter((d) => d.province !== '全国')
        .forEach((d) => {
          const yearData = dataMap.get(d.year) || [];
          yearData.push({
            name: d.province, // 注意这里使用 name 而不是 province
            value: d.total_population,
          });
          dataMap.set(d.year, yearData);
        });

      // 构造最终数据结构
      return {
        years: Array.from(dataMap.keys()).sort(), // 年份从小到大排序
        data: Array.from(dataMap.entries()).map(([year, data]) => ({
          year,
          data,
        })),
      };
    };

    /**
     * 生成图表配置
     * @param {Object} processedData - 处理后的数据
     * @returns {Object} - ECharts 配置
     */
    const generateChartOption = (processedData) => {
      // const timeline = this.createTimeline(years); // 时间轴配置
      const { years, data } = processedData;
      const currentYearData = data.find((d) => d.year === years[0]); // 默认显示第一个年份的数据

      return {
        title: {
          text: `中国人口分布图 (${currentYearData.year}年)`,
          subtext: '数据来源：国家统计局',
          left: 'center',
        },
        tooltip: {
          trigger: 'item',
          formatter: '{b} : {c} 万人', // 显示省份名称和人口值
        },
        visualMap: {
          min: 0,
          max: 13000, // 根据实际数据调整最大值
          text: ['高', '低'],
          realtime: false,
          calculable: true,
          inRange: {
            color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026'],
          },
        },
        series: [
          {
            name: '人口',
            type: 'map',
            map: 'china',
            roam: true, // 允许缩放和平移
            label: {
              show: true, // 显示省份名称
              color: '#000', // 省份名称颜色
              fontSize: 12, // 省份名称字体大小
            },
            itemStyle: {
              areaColor: '#cce5df', // 地图区域默认颜色
              borderColor: '#111', // 边界颜色
            },
            emphasis: {
              label: {
                show: true, // 鼠标悬停时显示省份名称
                color: '#fff', // 鼠标悬停时省份名称颜色
              },
              itemStyle: {
                areaColor: '#ff6600', // 鼠标悬停时区域颜色
              },
            },
            data: currentYearData.data, // 确保数据格式为 [{ name: '省份名称', value: 人口值 }]
          },
        ],
      };
    };

    // 初始化图表
    onMounted(async () => {
      try {
        await loadMapData(); // 加载地图数据
        const { data } = await getPopulationData(); // 获取人口数据
        const processedData = processData(data); // 处理数据
        chartOption.value = generateChartOption(processedData); // 生成图表配置
      } catch (e) {
        error.value = `数据加载失败：${e.message}`;
      } finally {
        loading.value = false;
      }
    });

    onUnmounted(() => {
      if (chartOption.value) {
        echarts.dispose(chartOption.value);
      }
    });

    return {
      loading,
      error,
      chartOption,
    };
  },
};
</script>