<!-- django-vue/src/components/IndexCharts/LeftTopChart.vue -->
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
    name: 'LeftTopChart',
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
            const { data } = await getGDPData();
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
                    average_revenue: yearData.average_revenue,
                    average_consume: yearData.average_consume,
                    city_revenue: yearData.city_revenue,
                    city_consume: yearData.city_consume,
                    country_revenue: yearData.country_revenue,
                    country_consume: yearData.country_consume,
                };
            });
            return { years, data };
        },

        generateChartOption({ years, data }) {
        // 创建基础配置
        const baseOption = {
            tooltip: {
                trigger: 'axis', // 触发类型为坐标轴触发
                axisPointer: {
                    type: 'cross', // 显示横向轴
                    label: {
                        backgroundColor: '#6a7985'
                    }
                },
                formatter: function (params) {
                    // 自定义提示框格式
                    let tip = `<div>${params[0].name} 年</div>`;
                    params.forEach((param) => {
                        tip += `<div>${param.seriesName}: ${param.value}元</div>`;
                    });
                    return tip;
                },
            },
            legend: {
                data: ['人均收入(元)','人均消费(元)','城镇人均收入(元)','城镇人均消费(元)','农村人均收入(元)','农村人均消费(元)',], // 图例数据
                orient: 'vertical', // 图例方向
                right: '0%', // 图例位置
                top: '0%', // 图例位置
                textStyle: {
                    fontSize: 12, // 图例字体大小
                    color: 'black', // 图例字体颜色
                },
            },
            title: {
                text: '全国xxxxxxxx', // 标题内容
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
                name: '金额(元)', // Y轴名称
                axisLabel: {
                    fontSize: 12, // Y轴标签字体大小
                },
            },
            // ['人均收入(元)','人均消费(元)','城镇人均收入(元)','城镇人均消费(元)','农村人均收入(元)','农村人均消费(元)',]
            series: [
                {
                    name: '人均收入(元)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.average_revenue), // 人均收入
                    color: '#93CE07', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: false, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                    areaStyle: {}, // 面积
                },
                {
                    name: '人均消费(元)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.average_consume), // 人均消费
                    color: '#FBDB0F', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: false, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                    areaStyle: {}, // 面积
                },
                {
                    name: '城镇人均收入(元)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.city_revenue), // 城镇人均收入
                    color: '#FC7D02', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: false, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                    areaStyle: {}, // 面积
                },
                {
                    name: '城镇人均消费(元)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.city_consume), // 城镇人均消费
                    color: '#FD0100', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: false, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                    areaStyle: {}, // 面积
                },
                {
                    name: '农村人均收入(元)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.country_revenue), // 农村人均收入
                    color: '#AA069F', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: false, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                    areaStyle: {}, // 面积
                },
                {
                    name: '农村人均消费(元)', // 系列名称
                    type: 'line', // 图表类型为折线图
                    data: data.map((item) => item.country_consume), // 农村人均消费
                    color: '#AC3B2A', // 线条颜色
                    symbol: 'circle', // 图标形状
                    symbolSize: 8, // 图标大小
                    label: {
                        show: false, // 显示标签
                        position: 'top', // 标签位置在顶部
                        fontSize: 14, // 标签字体大小
                        color: '#000', // 标签字体颜色
                    },
                    areaStyle: {}, // 面积
                },
            ],
        };
        return baseOption;
    },
    },
};
</script>