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
    name: 'PopulationLineChart',
    data() {
        return {
            loading: true,
            error: null,
            chartOption: null,
        };
    },
    async mounted() {
        try {
            // 调用API获取人口数据
            const { data } = await getPopulationData();
            this.chartOption = this.generateChartOption(this.processData(data));
        } catch (e) {
            this.error = `数据加载失败：${e.message}`;
        } finally {
            this.loading = false;
        }
    },
    methods: {
        processData(rawData) {
            // 获取所有年份
            const years = [...new Set(rawData.map((d) => d.year))].sort();
            const data = years.map((year) => {
                const yearData = rawData.find((d) => d.year === year && d.province === '全国');
                return {
                    year,
                    birth: yearData.birth_rate,
                    // death: yearData.death_rate,
                    nature: yearData.natural_growth_rate,
                };
            });
            return { years, data };
        },

        generateChartOption({ years, data }) {
        // 创建基础配置
        const baseOption = {
            tooltip: {
                trigger: 'axis', // 触发类型为坐标轴触发
                formatter: function (params) {
                    // 自定义提示框格式
                    let tip = `<div>${params[0].name} 年</div>`;
                    params.forEach((param) => {
                        tip += `<div>${param.seriesName}: ${param.value}%</div>`;
                    });
                    return tip;
                },
            },
            legend: {
                data: ['出生率(‰)', '自然增长率(‰)'], // 图例数据
                orient: 'vertical', // 图例方向
                right: '0%', // 图例位置
                top: '0%', // 图例位置
                textStyle: {
                    fontSize: 12, // 图例字体大小
                    color: 'black', // 图例字体颜色
                },
            },
            title: {
                text: '全国出生率与自然增长率', // 标题内容
                subtext: '数据来源：国家统计局', // 副标题内容
                left: '50%', // 标题水平居中
                top: '0%', // 标题在顶部
                textAlign: 'center', // 标题文本居中
                textStyle: {
                    fontSize: 18, // 标题字体大小
                    fontWeight: 'bold', // 标题字体加粗
                    color: 'black', // 标题字体颜色
                },
                subtextStyle: {
                    fontSize: 14, // 副标题字体大小
                    fontWeight: 'bold', // 副标题字体加粗
                    color: 'grey', // 副标题字体颜色
                },
            },
            grid: {
                top: '12%',
                left: '1%',
                right: '2%',
                bottom: '20%',
                containLabel: true,
            },
            xAxis: {
                type: 'category', // X轴类型为分类轴
                data: years, // X轴数据为年份
                boundaryGap: false, // X轴两侧不留白
                axisLabel: {
                    fontSize: 12, // X轴标签字体大小
                },
                splitLine: {
                    show: false, // 不显示分割线
                },
            },
            yAxis: {
                type: 'value', // Y轴类型为数值轴
                name: '比率(‰)', // Y轴名称
                axisLabel: {
                    fontSize: 12, // Y轴标签字体大小
                },
            },
            series: [
                {
                    name: '出生率(‰)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.birth), // 出生率数据
                    color: '#87CEEB', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: true, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                },
                {
                    name: '自然增长率(‰)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.nature), // 自然增长率数据
                    color: '#FF69B4', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: true, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                },
            ],
        };
        return baseOption;
    },
    },
};
</script>