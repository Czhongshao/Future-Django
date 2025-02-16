# index.views.py

# Django 响应库
from django.shortcuts import render
from django.http import HttpResponse

# DRF 库
from rest_framework.views import APIView

# 标准库
import json

# 数据处理库
import pandas as pd
import numpy as np

# 可视化绘图库
from pyecharts.charts import Bar, Pie, Map, Line, Scatter, Timeline, Grid
from pyecharts.globals import ThemeType
from pyecharts import options as opts


# Create your views here.

# 柱状图绘图
def BarCharts():
    # 数据列表，包含省份和各年份的人口数据
    data_list_bar = {
        'province': ['广东省', '山东省', '河南省', '江苏省', '四川省', '河北省', '湖南省', '安徽省', '浙江省', '湖北省'],
        '2014年': [11489, 9808, 9645, 8281, 8139, 7323, 6611, 5997, 5890, 5816],
        '2015年': [11678, 9866, 9701, 8315, 8196, 7345, 6615, 6011, 5985, 5850],
        '2016年': [11908, 9973, 9778, 8381, 8251, 7375, 6625, 6033, 6072, 5885],
        '2017年': [12141, 10033, 9829, 8423, 8289, 7409, 6633, 6057, 6170, 5904],
        '2018年': [12348, 10077, 9864, 8446, 8321, 7426, 6635, 6076, 6273, 5917],
        '2019年': [12489, 10106, 9901, 8469, 8351, 7447, 6640, 6092, 6375, 5927],
        '2020年': [12624, 10165, 9941, 8477, 8371, 7464, 6645, 6468, 6105, 5745],
        '2021年': [12684, 10170, 9883, 8505, 8372, 7448, 6622, 6113, 6540, 5830],
        '2022年': [12657, 10163, 9872, 8515, 8374, 7420, 6604, 6127, 6577, 5844],
    }

    def bar_charts(year: str) -> Bar:
        bar_xdata = data_list_bar['province']  # X轴数据为省份名称
        bar_ydata = data_list_bar[year]  # Y轴数据为指定年份的人口数据

        bar = (
            Bar(init_opts=opts.InitOpts(width="100%", height="100%"))  # 初始化柱状图，设置宽度和高度
            .add_xaxis(bar_xdata)  # 添加X轴数据
            .add_yaxis(
                series_name="",  # 系列名称
                y_axis=bar_ydata,  # Y轴数据
                label_opts=opts.LabelOpts(  # 设置标签样式
                    is_show=True,  # 显示标签
                    position="insideRight",  # 标签位置在右侧
                    formatter="{b}: {c}万人",  # 标签格式化显示
                    font_size=12,  # 标签字体大小
                ),
                category_gap="20px",  # 类目间距
                bar_width="80%",  # 柱子宽度
                gap="20%",  # 柱子之间的间距
            )
            .reversal_axis()  # 轴反转，将柱状图变为横向
            .set_series_opts(  # 设置系列配置项
                itemstyle_opts={  # 设置柱子的样式
                    "normal": {
                        "barBorderRadius": [25, 25, 25, 25]  # 柱子的圆角
                    }
                }
            )
            .set_global_opts(  # 设置全局配置项
                xaxis_opts=opts.AxisOpts(  # X轴配置
                    axislabel_opts=opts.LabelOpts(is_show=False, font_size=10),  # 不显示X轴标签
                    axisline_opts=opts.AxisLineOpts(  # X轴轴线配置
                        is_show=False,  # 不显示X轴轴线
                        linestyle_opts=opts.LineStyleOpts(color="rgba(0,0,0,0)")  # X轴轴线颜色透明
                    ),
                    splitline_opts=opts.SplitLineOpts(is_show=False)  # 不显示X轴分割线
                ),
                yaxis_opts=opts.AxisOpts(  # Y轴配置
                    axislabel_opts=opts.LabelOpts(is_show=False, font_size=10),  # 不显示Y轴标签
                    axisline_opts=opts.AxisLineOpts(  # Y轴轴线配置
                        is_show=False,  # 不显示Y轴轴线
                        linestyle_opts=opts.LineStyleOpts(color="rgba(0,0,0,0)")  # Y轴轴线颜色透明
                    ),
                    splitline_opts=opts.SplitLineOpts(is_show=False)  # 不显示Y轴分割线
                ),
                tooltip_opts=opts.TooltipOpts(is_show=False),  # 不显示提示框
                title_opts=opts.TitleOpts(  # 标题配置
                    title="{}中国top10省人口".format(year),  # 标题内容
                    subtitle="数据来源：国家统计局",  # 副标题内容
                    pos_left="50%",  # 标题水平居中
                    pos_top="0%",  # 标题在顶部
                    text_align="center",  # 标题文本居中
                    title_textstyle_opts=opts.TextStyleOpts(  # 标题文本样式
                        font_size=16,  # 标题字体大小
                        font_weight="bold",  # 标题字体加粗
                        color="white"  # 标题字体颜色
                    ),
                    subtitle_textstyle_opts=opts.TextStyleOpts(  # 副标题文本样式
                        font_size=12,  # 副标题字体大小
                        font_weight="bold",  # 副标题字体加粗
                        color="grey"  # 副标题字体颜色
                    ),
                ),
                visualmap_opts=opts.VisualMapOpts(  # 视觉映射配置
                    min_=200,  # 最小值
                    max_=13000,  # 最大值
                    range_text=["分布程度(万人)", ""],  # 视觉映射范围文本
                    is_piecewise=False,  # 不分段
                    type_='color',  # 类型为颜色
                    range_color=['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026'],  # 颜色范围
                    pos_left="-5%",  # 视觉映射组件位置
                    pos_top="center",  # 视觉映射组件位置
                    split_number=10,  # 分段数
                    orient="vertical",  # 垂直方向
                    item_width=20,  # 图例宽度
                    item_height=300,  # 图例高度
                    dimension=0,  # 维度
                    is_show=False,  # 不显示视觉映射组件
                ),
            )
        )
        grid = Grid(init_opts=opts.InitOpts(width="100%", height="100%"))
        grid.add(
            bar,
            grid_opts=opts.GridOpts(
                pos_left="0",
                pos_bottom="0"
            )
        )
        return grid

    # 创建时间轴
    def create_timeline() -> Timeline:
        time_list = [year for year in data_list_bar.keys() if isinstance(year, str) and year.endswith('年')]  # 获取所有年份
        timeline = Timeline(init_opts=opts.InitOpts(width="100%", height="100vh"))  # 初始化时间轴，设置宽度和高度

        for year in time_list:
            bar_chart = bar_charts(year)  # 生成对应年份的柱状图
            timeline.add(bar_chart, "{}".format(year))  # 将柱状图添加到时间轴中

        timeline.add_schema(  # 设置时间轴配置
            orient="vertical",  # 垂直方向
            is_auto_play=True,  # 自动播放
            play_interval=3000,  # 播放间隔
            pos_right="0%",  # 时间轴位置
            pos_top="middle",  # 时间轴位置
            width="75px",  # 时间轴宽度
            height="500px",  # 时间轴高度
            label_opts=opts.LabelOpts(is_show=True, color="#fff"),  # 时间轴标签样式
            linestyle_opts=opts.LineStyleOpts(width=2, color="#000"),  # 时间轴线条样式
            is_timeline_show=False,  # 不显示时间轴
        )
        return timeline

    timeline_bars = create_timeline()  # 生成时间轴
    return timeline_bars  # 返回时间轴




# 响应请求
class BarChartView(APIView):
    def get(self, request):
        chart = BarCharts()
        return HttpResponse(
            chart.dump_options_with_quotes(),
            content_type="application/json"
            )

# content_type="application/json"

class IndexView(APIView):
    def get(self, request):
        return render(request, "index.html")
    # 默认索引至index/templates/index.html