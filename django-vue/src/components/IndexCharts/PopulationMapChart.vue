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
import { ref, onMounted } from 'vue'; // 引入 Vue 的响应式和生命周期钩子
import * as echarts from 'echarts'; // 引入 ECharts 库，用于绘制图表
import axios from 'axios'; // 引入 Axios 库，用于发送 HTTP 请求
import { getPopulationData } from '@/api/populationAPI'; // 引入自定义接口方法，用于获取人口数据

export default {
  name: 'PopulationMapChart', // 组件名称
  setup() {
    const loading = ref(true); // 定义一个响应式变量，表示数据加载状态（初始为 true）
    const error = ref(null); // 定义一个响应式变量，用于存储错误信息（初始为 null）
    const chartOption = ref(null); // 定义一个响应式变量，用于存储 ECharts 配置项

    // 加载地图数据的异步函数
    const loadMapData = async () => {
      try {
        // 使用 Axios 发送 GET 请求，获取中国地图的 GeoJSON 数据
        const response = await axios.get('https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json');
        // 将获取到的地图数据注册到 ECharts 中，命名为 'china'
        echarts.registerMap('china', response.data);
      } catch (e) {
        // 如果请求失败，将错误信息存储到 error 变量中
        error.value = `地图数据加载失败：${e.message}`;
      }
    };

    // 处理原始数据的函数
    const processData = (rawData) => {
      const dataMap = new Map(); // 创建一个 Map 对象，用于按年份存储省份数据
      const nationalData = []; // 创建一个数组，用于存储全国总人口数据

      rawData.forEach(d => {
        if (d.province === '全国') {
          // 如果数据是全国范围的数据，将其添加到 nationalData 数组中
          nationalData.push({ year: d.year, total_population: d.total_population });
        } else {
          // 如果数据是省份范围的数据，按年份分类存储
          if (!dataMap.has(d.year)) {
            dataMap.set(d.year, []); // 如果该年份尚未在 dataMap 中，初始化为空数组
          }
          dataMap.get(d.year).push({ name: d.province, value: d.total_population }); // 添加省份数据
        }
      });

      return {
        years: [...dataMap.keys()].sort(), // 提取所有年份并排序
        data: [...dataMap.entries()] // 提取年份和对应数据，并排序
          .sort()
          .map(([year, data]) => ({ year, data })), // 转换为对象格式
        nationalData: nationalData.sort((a, b) => a.year - b.year), // 按年份对全国数据进行排序
      };
    };

    // 生成 ECharts 图表配置的函数
    const generateChartOption = ({ years, data, nationalData }) => ({
      baseOption: {
        // 基础配置项，适用于所有时间轴上的图表
        title: {
          text: '中国人口分布图', // 主标题
          subtext: '数据来源：国家统计局', // 副标题
          left: '50%', // 标题水平居中
          top: "0", // 标题垂直位置
          textAlign: 'center', // 文本对齐方式
          textStyle: {
            fontSize: 18, // 主标题字体大小
            fontWeight: 'bold', // 主标题字体加粗
            color: 'black', // 主标题字体颜色
          },
          subtextStyle: {
            fontSize: 14, // 副标题字体大小
            fontWeight: 'bold', // 副标题字体加粗
            color: "grey", // 副标题字体颜色
          }
        },
        tooltip: {
          trigger: 'item', // 触发类型为“item”，即鼠标悬停在地图上的某个区域时显示提示框
          formatter: '{b} : {c} 万人', // 提示框的内容格式，{b}表示区域名称，{c}表示对应的值
        },
        visualMap: {
          min: 0, // 最小值
          max: 13000, // 最大值
          text: ["分布程度(万人)", ""], // 显示的文字说明
          calculable: true, // 是否显示滑块
          inRange: {
            color: ['#ffaf78', '#d76d77', '#3a1c71'], // 颜色渐变范围
          },
          orient: 'vertical', // 垂直方向显示
          left: '0%', // 左侧位置
          top: '20%', // 顶部位置
        },
        series: [{
          name: '人口', // 系列名称
          type: 'map', // 图表类型为地图
          map: 'china', // 使用的地图名称
          roam: true, // 允许缩放和平移
          label: { show: false }, // 不显示地图上的标签
          emphasis: {
            label: { show: false }, // 鼠标悬停时不显示标签
            itemStyle: { areaColor: '#ff6600' } // 高亮时的区域颜色
          },
        }],
        timeline: {
          axisType: 'category', // 时间轴类型为“类目”
          data: years.map(year => `${year}年`), // 时间轴上的数据，添加“年”字
          autoPlay: true, // 自动播放
          playInterval: 3000, // 播放间隔时间（毫秒）
          orient: 'vertical', // 垂直方向显示
          right: '0%', // 靠右显示
          top: 'middle', // 垂直居中
          width: '75px', // 宽度
          height: '75%', // 高度
          label: {
            formatter: function (value) {
              return value; // 已经包含“年”字，无需额外处理
            },
            color: '#000', // 字体颜色
            position: -10, // 标签位置调整
          },
          lineStyle: { width: 2, color: '#000' }, // 时间轴线条样式
          tooltip: {
            trigger: 'item', // 触发类型为“item”
            formatter: function(params) {
              const year = parseInt(params.name); // 获取年份
              const nationalRecord = nationalData.find(item => item.year === year); // 查找对应年份的全国数据
              return `${params.name}：${nationalRecord ? nationalRecord.total_population : 'N/A'} 万人`; // 提示框内容
            }
          },
        },
      },
      options: data.map(({ year, data }) => ({
        title: { text: `${year}年中国人口分布图` }, // 动态设置每一年的标题
        series: [{ data }], // 动态设置每一年的系列数据
      })),
    });

    // 在组件挂载完成后执行的异步函数
    onMounted(async () => {
      try {
        await loadMapData(); // 加载地图数据
        const { data } = await getPopulationData(); // 获取人口数据

        // 处理数据
        const processedData = processData(data);

        // 将全国数据添加到时间轴
        chartOption.value = generateChartOption(processedData);
      } catch (e) {
        // 如果加载或处理数据失败，将错误信息存储到 error 变量中
        error.value = `数据加载失败：${e.message}`;
      } finally {
        // 无论成功还是失败，都将加载状态设置为 false
        loading.value = false;
      }
    });

    return { loading, error, chartOption }; // 返回响应式变量，供模板使用
  },
};
</script>