<!-- django-vue/src/components/IndexCharts/PopulationPieChart.vue -->
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
  name: 'PopulationPieChart',
  data() {
    return {
      loading: true, // 控制加载状态的布尔值，初始为 true 表示正在加载
      error: null, // 用于存储错误信息，初始为 null 表示没有错误
      chartOption: null, // ECharts 图表的配置对象，初始为 null
    };
  },
  async mounted() {
    try {
      // 调用 API 获取人口数据
      const { data } = await getPopulationData();
      // 处理获取到的原始数据，并生成图表配置
      this.chartOption = this.generateChartOption(this.processData(data));
    } catch (e) {
      // 如果发生错误，将错误信息存储到 error 中
      this.error = `数据加载失败：${e.message}`;
    } finally {
      // 无论成功或失败，都将加载状态设置为 false
      this.loading = false;
    }
  },
  methods: {
    /**
     * 处理原始数据
     * @param {Array} rawData - 原始数据，是一个数组，每个元素包含年份、省份、男性人口、女性人口等信息
     * @returns {Object} - 处理后的数据，包含年份数组和每年的男女人口数据
     */
    processData(rawData) {
      // 获取所有年份并去重、排序
      const years = [...new Set(rawData.map((d) => d.year))].sort();
      // 遍历年份，提取每年的全国男女人口数据
      const data = years.map((year) => {
        // 找到当前年份的全国数据
        const yearData = rawData.find((d) => d.year === year && d.province === '全国');
        // 返回当前年份的男女人口数据，如果没有找到数据则默认为 0
        return {
          year,
          man: yearData.male_population,
          woman: yearData.female_population,
        };
      });
      // 返回处理后的数据
      return { years, data };
    },

    /**
     * 生成图表配置
     * @param {Object} processedData - 处理后的数据，包含年份数组和每年的男女人口数据
     * @returns {Object} - ECharts 配置对象
     */
    generateChartOption({ years, data }) {
      // 创建时间轴配置
      const timeline = this.createTimeline(years);
      // 创建基础配置
      const baseOption = this.createBaseOption();
      // 创建每年的图表配置
      const options = data.map((item) => this.createYearOption(item));
      // 返回最终的图表配置对象
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
     * @returns {Object} - 时间轴配置对象
     */
    createTimeline(years) {
      return {
        axisType: 'category', // 时间轴类型为分类轴
        data: years, // 时间轴数据为年份数组
        autoPlay: true, // 自动播放
        playInterval: 3000, // 播放间隔为 3 秒
        orient: 'vertical', // 时间轴方向为垂直
        right: '0%', // 时间轴位置在右侧
        top: 'middle', // 时间轴位置在中间
        width: 75, // 时间轴宽度
        height: '80%', // 时间轴高度
        label: {
          show: true, // 显示标签
          color: '#fff', // 标签颜色
          fontSize: 14, // 标签字体大小
          formatter: (year) => `${year}年`, // 标签格式化函数
        },
        lineStyle: {
          width: 2, // 线条宽度
          color: '#000', // 线条颜色
        },
        checkpointStyle: {
          color: '#87CEEB', // 检查点颜色
          borderColor: '#000', // 检查点边框颜色
        },
        controlStyle: {
          show: false, // 不显示控制按钮
        },
      };
    },

    /**
     * 创建基础配置
     * @returns {Object} - 基础配置对象
     */
    createBaseOption() {
      return {
        tooltip: {
          trigger: 'item', // 触发类型为数据项
          formatter: '{b}: {d}%', // 提示框格式化函数
        },
        series: [
          {
            type: 'pie', // 图表类型为饼图
            radius: ['0%', '75%'], // 饼图内外半径
            center: ['50%', '45%'], // 饼图中心位置
            label: {
              show: true, // 显示标签
              position: 'inside', // 标签位置为外部
              formatter: '{b}性\n{d}%', // 标签格式化函数
              color: '#666', // 标签颜色
              fontSize: 16, // 标签字体大小
              fontWeight: 'bold', // 标签字体加粗
            },
            emphasis: {
              label: {
                show: true, // 高亮时显示标签
                fontSize: 16, // 高亮时标签字体大小
              },
            },
          },
        ],
      };
    },

    /**
     * 创建单个年份的图表配置
     * @param {Object} yearData - 单个年份的数据，包含年份和男女人口
     * @returns {Object} - 图表配置对象
     */
    createYearOption({ year, man, woman }) {
      return {
        title: {
          text: `${year}年全国性别比例图`, // 图表标题
          subtext: '数据来源：国家统计局', // 图表副标题
          left: '50%', // 标题位置居中
          top: '0%', // 标题位置在顶部
          textAlign: 'center', // 标题对齐方式为居中
          textStyle: {
            fontSize: 18, // 标题字体大小
            fontWeight: 'bold', // 标题字体加粗
            color: 'black', // 标题颜色
          },
          subtextStyle: {
            fontSize: 14, // 副标题字体大小
            fontWeight: 'bold', // 副标题字体加粗
            color: 'grey', // 副标题颜色
          },
        },
        series: [
          {
            type: 'pie', // 图表类型为饼图
            data: [
              { value: man, name: '男' }, // 男性数据
              { value: woman, name: '女' }, // 女性数据
            ],
            itemStyle: {
              borderRadius: 6, // 数据项圆角
              borderWidth: 2, // 数据项边框宽度
              borderColor: '#fff', // 数据项边框颜色
              color: function (params) {
                // 数据项颜色函数
                const colors = ['#87CEEB', '#FF69B4']; // 男性和女性的颜色
                return colors[params.dataIndex]; // 根据索引返回对应颜色
              },
            },
          },
        ],
      };
    },
  },
};
</script>