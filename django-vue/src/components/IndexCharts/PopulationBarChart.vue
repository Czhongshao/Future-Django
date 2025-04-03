<!-- django-vue/src/components/IndexCharts/PopulationBarChart.vue -->
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
import { getPopulationData } from '@/api/populationAPI';

export default {
  name: 'PopulationBarChart',
  data() {
    return {
      loading: true, // 数据加载状态
      error: null, // 错误信息
      chartOption: null, // 图表配置
    };
  },
  async mounted() {
    try {
      const { data } = await getPopulationData();
      this.chartOption = this.generateChartOption(this.processData(data));
    } catch (e) {
      this.error = `数据加载失败：${e.message}`;
    } finally {
      this.loading = false;
    }
  },
  methods: {
    /**
     * 处理原始数据
     * @param {Array} rawData - 原始数据
     * @returns {Object} - 处理后的数据
     */
    processData(rawData) {
      const years = [...new Set(rawData.map((d) => d.year))].sort(); // 获取所有年份并排序（从小到大）
      const dataMap = new Map();

      // 按年份分组并过滤全国数据
      rawData
        .filter((d) => d.province !== '全国')
        .forEach((d) => {
          const yearData = dataMap.get(d.year) || [];
          yearData.push({
            province: d.province,
            value: d.total_population,
          });
          dataMap.set(d.year, yearData);
        });

      // 构造最终数据结构
      return {
        years: Array.from(dataMap.keys()).sort(), // 年份从小到大排序
        data: Array.from(dataMap.entries()).map(([year, data]) => ({
          year,
          data: data.sort((a, b) => b.value - a.value).slice(0, 10), // 取前10个省份
        })).sort((a, b) => a.year - b.year), // 按年份升序排序
      };
    },

    /**
     * 生成图表配置
     * @param {Object} processedData - 处理后的数据
     * @returns {Object} - ECharts 配置
     */
    generateChartOption({ years, data }) {
      const timeline = this.createTimeline(years); // 时间轴配置
      const baseOption = this.createBaseOption(); // 基础配置
      const options = data.map((item) => this.createYearOption(item)); // 各年份配置

      return {
        baseOption: {
          ...baseOption,
          timeline: {
            ...timeline,
            show: false, // 隐藏时间轴控件
          },
        },
        options,
      };
    },

    /**
     * 创建时间轴配置
     * @param {Array} years - 年份数组
     * @returns {Object} - 时间轴配置
     */
    createTimeline(years) {
      return {
        axisType: 'category',
        data: years, // 时间轴年份从小到大排列
        autoPlay: true,
        playInterval: 3000, // 播放间隔 3 秒
        orient: 'vertical', // 垂直方向
        left: '95%', // 时间轴位置靠右
        top: 'center', // 时间轴垂直居中
        width: '75px', // 时间轴宽度
        height: '500px', // 时间轴高度
        label: {
          color: '#fff', // 时间轴标签颜色
          fontSize: 12, // 时间轴标签字体大小
        },
        lineStyle: {
          width: 2, // 时间轴线条宽度
          color: '#ff6600', // 时间轴线条颜色（更明显）
        },
        controlStyle: {
          show: false, // 不显示播放控制按钮
        },
      };
    },

    /**
     * 创建基础配置
     * @returns {Object} - 基础配置
     */
    createBaseOption() {
      return {
        grid: {
          top: '12%', // 上边距
          bottom: '20%', // 下边距
          left: '1%',
          right: '1%',
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow',
          },
        },
      };
    },

    /**
     * 创建单个年份的图表配置
     * @param {Object} yearData - 单个年份的数据
     * @returns {Object} - 图表配置
     */
    createYearOption({ year, data }) {
      return {
        title: {
          text: `${year}年中国top10省人口`,
          subtext: '数据来源：国家统计局',
          left: '50%',
          top: '0%',
          textAlign: 'center',
          textStyle: {
            fontSize: 18,
            fontWeight: 'bold',
            color: 'black', // 标题字体颜色
          },
          subtextStyle: {
            fontSize: 14,
            fontWeight: 'bold',
            color: 'grey', // 副标题字体颜色
          },
        },
        xAxis: {
          type: 'value',
          name: '人口(万人)',
          axisLabel: {
            show: false, // 不显示 X 轴标签
            fontSize: 10,
          },
          axisLine: {
            show: false, // 不显示 X 轴轴线
            lineStyle: {
              color: 'rgba(0,0,0,0)', // 透明色
            },
          },
          splitLine: {
            show: false, // 不显示 X 轴分割线
          },
        },
        yAxis: {
          type: 'category',
          data: data.map((d) => d.province).reverse(),
          axisLabel: {
            show: false, // 不显示 Y 轴标签
            fontSize: 10,
          },
          axisLine: {
            show: false, // 不显示 Y 轴轴线
            lineStyle: {
              color: 'rgba(0,0,0,0)', // 透明色
            },
          },
          splitLine: {
            show: false, // 不显示 Y 轴分割线
          },
        },
        series: [
          {
            type: 'bar',
            data: data.map((d) => ({
              value: d.value,
              itemStyle: {
                borderRadius: [25, 25, 25, 25], // 柱子圆角
                color: this.getColor(d.value), // 动态设置颜色
              },
            })).reverse(),
            label: {
              show: true, // 显示标签
              position: 'insideRight', // 标签位置在右侧
              formatter: '{b}: {c}万人', // 标签格式化显示
              fontSize: 12, // 标签字体大小
              color: '#000', // 标签字体颜色
            },
            barWidth: '80%', // 柱子宽度
            categoryGap: '20px', // 类目间距
          },
        ],
      };
    },

    /**
     * 根据数值获取对应的颜色
     * @param {number} value - 当前数值
     * @returns {string} - 对应的颜色
     */
     getColor(value) {
      const min = 4500;
      const max = 13000;
      const colors = [
        '#ffaf78', '#d76d77', '#3a1c71'
      ]; // 修改为渐变色的起始和结束颜色
      const index = Math.floor(((value - min) / (max - min)) * (colors.length - 1));
      return colors[index];
    },
  },
};
</script>