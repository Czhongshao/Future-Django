<!-- django-vue/src/components/IndexCharts/GDPBarChart.vue -->
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
import { getGDPData } from '@/api/gdpAPI';

export default {
  name: 'GDPBarChart',
  data() {
    return {
      loading: true, // 数据加载状态
      error: null, // 错误信息
      chartOption: null, // 图表配置
    };
  },
  async mounted() {
    try {
      const { data } = await getGDPData();
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
            value: d.gdp,
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
     * @param {Object} processData - 处理后的数据
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
        visualMap: {
          min: 7000, // 数据的最小值
          max: 136000, // 数据的最大值
          text: ['高', '低'], // 文本，默认为数值文本
          calculable: false, // 显示拖动用的手柄
          inRange: {
            color: ['#c6ffdd', '#fbd786', '#f7797d'], // 渐变色
          },
          orient: 'vertical', // 热度条方向
          right: '1%', // 放在右侧
          bottom: '20%', // 放在底部
          textStyle: {
            color: '#fff', // 文本颜色
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
          text: `${year}年中国top10省生产总值`,
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
          name: '总值(亿元)',
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
                color: this.getColor(d.value), // 根据数值获取颜色
              },
            })).reverse(),
            label: {
              show: true, // 显示标签
              position: 'insideRight', // 标签位置在右侧
              formatter: '{b}: {c}亿元', // 标签格式化显示
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
      const min = 7000;
      const max = 136000;
      const colors = ['#c6ffdd', '#fbd786', '#f7797d']; // 渐变色的起始和结束颜色

      // 计算颜色插值比例
      const ratio = (value - min) / (max - min);

      // 获取颜色的 RGB 值
      const startColor = this.hexToRgb(colors[0]);
      const endColor = this.hexToRgb(colors[1]);

      // 计算插值后的 RGB 值
      const r = Math.round(startColor.r + ratio * (endColor.r - startColor.r));
      const g = Math.round(startColor.g + ratio * (endColor.g - startColor.g));
      const b = Math.round(startColor.b + ratio * (endColor.b - startColor.b));

      // 返回插值后的颜色
      return `rgb(${r}, ${g}, ${b})`;
    },

    /**
     * 将十六进制颜色转换为 RGB 对象
     * @param {string} hex - 十六进制颜色值
     * @returns {Object} - RGB 对象
     */
    hexToRgb(hex) {
      const r = parseInt(hex.slice(1, 3), 16);
      const g = parseInt(hex.slice(3, 5), 16);
      const b = parseInt(hex.slice(5, 7), 16);
      return { r, g, b };
    },
  },
};
</script>