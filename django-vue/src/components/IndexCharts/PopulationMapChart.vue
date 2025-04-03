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

    // 加载地图数据
    const loadMapData = async () => {
      try {
        const response = await axios.get('https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json');
        echarts.registerMap('china', response.data); // 注册地图
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
            name: d.province,
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
      const { years, data } = processedData;

      const baseOption = {
        title: {
          text: '中国人口分布图',
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
          },
        ],
      };

      const options = data.map((item) => ({
        title: {
          text: `中国人口分布图 (${item.year}年)`,
        },
        series: [
          {
            data: item.data, // 动态更新数据
          },
        ],
      }));

      return {
        baseOption: {
          ...baseOption,
          timeline: {
            axisType: 'category',
            data: years, // 时间轴年份从小到大排列
            autoPlay: true,
            playInterval: 3000, // 播放间隔 3 秒
            orient: 'horizontal', // 水平方向
            left: '10%',
            right: '10%',
            bottom: '5%',
            label: {
              color: '#000', // 时间轴标签颜色
              fontSize: 12, // 时间轴标签字体大小
            },
            lineStyle: {
              width: 2, // 时间轴线条宽度
              color: '#ff6600', // 时间轴线条颜色（更明显）
            },
            controlStyle: {
              show: true, // 显示播放控制按钮
            },
          },
        },
        options,
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

    return {
      loading,
      error,
      chartOption,
    };
  },
};
</script>