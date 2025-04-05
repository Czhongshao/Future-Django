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
import axios from 'axios';
import { registerMap } from 'echarts';
import { getPopulationData } from '@/api/populationAPI';

export default {
  name: 'PopulationMapChart',
  data() {
    return {
      loading: true, // 数据加载状态
      error: null, // 错误信息
      chartOption: null, // 图表配置
    };
  },
  async mounted() {
    try {
      await this.loadMapData(); // 加载地图数据
      const { data } = await getPopulationData(); // 获取人口数据
      const processedData = this.processData(data); // 处理数据
      this.chartOption = this.generateChartOption(processedData); // 生成图表配置
    } catch (e) {
      this.error = `数据加载失败：${e.message}`;
    } finally {
      this.loading = false;
    }
  },
  methods: {
    /**
     * 加载地图数据
     */
    async loadMapData() {
      try {
        const response = await axios.get('https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json'); // 获取地图数据
        registerMap('china', response.data); // 注册地图
      } catch (e) {
        this.error = `地图数据加载失败：${e.message}`;
      }
    },

    /**
     * 处理原始数据
     * @param {Array} rawData - 原始数据
     * @returns {Object} - 处理后的数据
     */
    processData(rawData) {
      const dataMap = new Map(); // 按年份存储省份数据
      const nationalData = []; // 全国总人口数据

      rawData.forEach((d) => {
        if (d.province === '全国') {
          nationalData.push({ year: d.year, total_population: d.total_population });
        } else {
          if (!dataMap.has(d.year)) {
            dataMap.set(d.year, []);
          }
          dataMap.get(d.year).push({ 
            name: d.province, 
            value: d.total_population || 0, 
          });
        }
      });

      return {
        years: [...dataMap.keys()].sort(),
        data: [...dataMap.entries()]
          .sort()
          .map(([year, data]) => ({ year, data })),
        nationalData: nationalData.sort((a, b) => a.year - b.year),
      };
    },

    /**
     * 生成图表配置
     * @param {Object} processedData - 处理后的数据
     * @returns {Object} - ECharts 配置
     */
    generateChartOption({ years, data, nationalData }) {
      const baseOption = this.createBaseOption();
      const timeline = this.createTimeline(years, nationalData);
      const options = data.map(({ year, data }) => this.createYearOption(year, data));

      return {
        baseOption,
        options,
        timeline,
      };
    },

    /**
     * 创建基础配置
     * @returns {Object} - 基础配置
     */
    createBaseOption() {
      return {
        title: {
          text: '中国人口分布图',
          subtext: '数据来源：国家统计局',
          left: '50%',
          top: '0',
          textAlign: 'center',
          textStyle: {
            fontSize: 18,
            fontWeight: 'bold',
            color: 'black',
          },
          subtextStyle: {
            fontSize: 14,
            fontWeight: 'bold',
            color: 'grey',
          },
        },
        tooltip: {
          trigger: 'item',
          formatter: '{b} : {c} 万人',
        },
        visualMap: {
          min: 0,
          max: 13000,
          text: ['分布程度\n(万人)', ''],
          calculable: true,
          inRange: {
            // color: ['#ffaf78', '#d76d77', '#3a1c71'],
            color: ['#C6FFDD', '#FBD786', '#F7797D'],
          },
          orient: 'vertical',
          left: '0%',
          top: '20%',
        },
        series: [
          {
            name: '人口',
            type: 'map',
            map: 'china',
            roam: true,
            label: { show: false },
            emphasis: {
              label: { show: false },
              itemStyle: { areaColor: '#ff6600' },
            },
          },
        ],
      };
    },

    /**
     * 创建时间轴配置
     * @param {Array} years - 年份数组
     * @param {Array} nationalData - 全国总人口数据
     * @returns {Object} - 时间轴配置
     */
    createTimeline(years, nationalData) {
      return {
        axisType: 'category',
        data: years.map((year) => `${year}年`),
        autoPlay: true,
        playInterval: 3000,
        orient: 'vertical',
        right: '0%',
        top: 'middle',
        width: '75px',
        height: '75%',
        label: {
          formatter: (value) => value,
          color: '#000',
          position: -10,
        },
        lineStyle: { width: 2, color: '#000' },
        tooltip: {
          trigger: 'item',
          formatter: (params) => {
            const year = parseInt(params.name);
            const nationalRecord = nationalData.find((item) => item.year === year);
            return `${params.name}：${nationalRecord ? nationalRecord.total_population : 'N/A'} 万人`;
          },
        },
      };
    },

    /**
     * 创建单个年份的图表配置
     * @param {number} year - 年份
     * @param {Array} data - 当年份的省份数据
     * @returns {Object} - 图表配置
     */
    createYearOption(year, data) {
      return {
        title: { text: `${year}年中国人口分布图` },
        series: [{ data }],
      };
    },
  },
};
</script>