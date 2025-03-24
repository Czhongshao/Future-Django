# index.views.py

# Django 响应库
from django.shortcuts import render
from django.http import HttpResponse

# DRF 库
import requests
from rest_framework.views import APIView

# 标准库
import json

# 数据处理库
import pandas as pd
import numpy as np
from index.models import Populations

# 可视化绘图库
from pyecharts.charts import Bar, Pie, Map, Line, Scatter, Timeline, Grid
from pyecharts.globals import ThemeType
from pyecharts import options as opts


# 柱状图绘图：各年份人口前十省份
# Django 响应库
from django.shortcuts import render
from django.http import HttpResponse

# DRF 库
from rest_framework.views import APIView

# 数据库模型
from .models import Populations

# 可视化绘图库
from pyecharts.charts import Bar, Timeline
from pyecharts import options as opts

# 从数据库中获取各省份含全国数据
populations = Populations.objects.all()

# 提取所有年份标签
years = [
        "2005", "2006", "2007", "2008", "2009",
        "2010", "2011", "2012", "2013", "2014",
        "2015", "2016", "2017", "2018", "2019",
        "2020", "2021", "2022", "2023",
    ]

# 柱状图绘图：各年份人口前十省份
def BarCharts(populations, years):
    # 初始化数据字典
    data_list_bar = {"province": []}
    for year in years:
        data_list_bar[year] = []

    # 遍历数据库中的每一行数据
    for population in populations:
        # 排除省份名称为“全国”的数据
        if population.proviences != "全国":
            data_list_bar["province"].append(population.proviences)  # 使用模型中的字段名
            for year in years:
                # 动态获取字段值
                field_name = f"number_{year}"
                data_list_bar[year].append(getattr(population, field_name))

    # 定义生成柱状图的函数
    def bar_charts(year: str) -> Bar:
        # 获取当前年份的人口数据
        year_data = list(zip(data_list_bar['province'], data_list_bar[year]))
        
        # 过滤掉人口数量为 None 的记录
        valid_data = [(province, population) for province, population in year_data if population is not None]
        
        # 按人口数量升序排序并取前十
        top_10_data = sorted(valid_data, key=lambda x: x[1], reverse=False)[-10:]
        # 分离省份名称和人口数据
        bar_xdata, bar_ydata = zip(*top_10_data)

        bar = (
            Bar(init_opts=opts.InitOpts(width="100%", height="100%"))  # 初始化柱状图，设置宽度和高度
            .add_xaxis(list(bar_xdata))  # 添加X轴数据
            .add_yaxis(
                series_name="",  # 系列名称
                y_axis=list(bar_ydata),  # Y轴数据
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
                    title="{}年中国top10省人口".format(year),  # 标题内容
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
        timeline = Timeline(init_opts=opts.InitOpts(width="100%", height="100vh"))  # 初始化时间轴，设置宽度和高度

        for year in years:
            bar_chart = bar_charts(year)  # 生成对应年份的柱状图
            timeline.add(bar_chart, "{}年".format(year))  # 将柱状图添加到时间轴中

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

# 饼图绘图：全国男女比
def PieCharts():
    data_list_pie = {
        'gender': ['男', '女'],
        '2014年': [70522, 67124],
        '2015年': [70857, 67469],
        '2016年': [71307, 67925],
        '2017年': [71650, 68361],
        '2018年': [71864, 68677],
        '2019年': [72039, 68969],
        '2020年': [72357, 68855],
        '2021年': [72311, 68949],
        '2022年': [72206, 68969],
    }

    def pie_charts(year: str) -> Pie:
        data = data_list_pie[year]
        gender = data_list_pie['gender']
        colors = ["#87CEEB", "#FF69B4"]  # 男性浅蓝色，女性粉色
        pie_1 = (
            Pie(init_opts=opts.InitOpts(theme=ThemeType.LIGHT))
            .add(
                "",
                [list(z) for z in zip(gender, data)],
                radius=["0%", "75%"],  # 内圆0,外圆200px
                center=['50%', '60%'],
                rosetype="radius",
                label_opts=opts.LabelOpts(
                    position="outside",
                    font_size=14,
                    font_weight="bold",
                    formatter="{b}性\n{d}%"
                ),
            )
            .set_global_opts(
                title_opts=opts.TitleOpts(
                    title="{}性别比例图".format(year),
                    subtitle="数据来源：国家统计局",
                    pos_left="50%",
                    pos_top="0%",
                    text_align="center",
                    title_textstyle_opts=opts.TextStyleOpts(
                        font_size=16,
                        font_weight="bold",
                        color="white",
                    ),
                    subtitle_textstyle_opts=opts.TextStyleOpts(
                        font_size=12,
                        font_weight="bold",
                        color="grey",
                    ),
                ),

                legend_opts=opts.LegendOpts(
                    is_show=False,
                    orient="vertical",
                    pos_left="left",
                    pos_top="middle",
                    textstyle_opts=opts.TextStyleOpts(font_size=14),
                ),
                tooltip_opts=opts.TooltipOpts(formatter="{b}: {d}%")
            )
            .set_colors(colors)  # 使用自定义颜色列表
        )
        return pie_1

    def create_timeline() -> Timeline:
        time_list = [year for year in data_list_pie.keys() if isinstance(year, str) and year.endswith('年')]
        timeline = Timeline(init_opts=opts.InitOpts(width="100%", height="100vh"))
        for year in time_list:
            pie_chart = pie_charts(year)
            timeline.add(pie_chart, year)
        timeline.add_schema(
            orient="vertical",
            is_auto_play=True,
            play_interval=3000,
            pos_right="0%",
            pos_top="middle",
            width="75px",
            label_opts=opts.LabelOpts(is_show=True, color="#fff"),
            linestyle_opts=opts.LineStyleOpts(width=2, color="#000"),
            is_timeline_show=False,
        )
        return timeline
    
    timeline_chart = create_timeline()
    return timeline_chart

# 折线图绘图：全国各年份出生率
def LineCharts():
    c = (
        Line()
        .add_xaxis
            (["2013年", "2014年",  "2015年", "2016年", "2017年", "2018年", "2019年", "2020年", "2021年", "2022年"])
        .add_yaxis(
            series_name='出生率(‰)',
            y_axis=[13.03, 13.83, 11.99, 13.57, 12.64, 10.86, 10.41, 8.52, 7.52, 6.77],
            label_opts=opts.LabelOpts(
                is_show=True,
                position="top",
                font_size=14,
                color="#33FFFF",
            ),
            symbol_size=8,
            symbol="circle",
            color="#33FFFF",
        )
        .add_yaxis(
            series_name='自然增长率(‰)',
            y_axis=[5.90, 6.71, 4.93, 6.53, 5.58, 3.78, 3.32, 1.45, 0.34, -0.60],
            label_opts=opts.LabelOpts(
                is_show=True,
                position="top",
                font_size=14,
                color="#33FF99",
            ),
            symbol_size=8,
            symbol="circle",
            color="#33FF99",
        )
        .set_global_opts(
            title_opts=opts.TitleOpts(
                title="全国出生率与生育率",
                subtitle="2013-2022年 数据来源：国家统计局",
                pos_left="45%",
                pos_top="0%",
                text_align="center",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=16,
                    font_weight="bold",
                    color="white",
                ),
                subtitle_textstyle_opts=opts.TextStyleOpts(
                    font_size=12,
                    font_weight="bold",
                    color="grey",
                ),
            ),
            xaxis_opts=opts.AxisOpts(
                axislabel_opts=opts.LabelOpts(
                    font_size=10,
                    is_show=False,
                ),
                splitline_opts=opts.SplitLineOpts(is_show=False),
            ),
            yaxis_opts=opts.AxisOpts(
                axislabel_opts=opts.LabelOpts(
                    font_size=13,
                ),
            ),
            legend_opts=opts.LegendOpts(
                orient="vertical",
                pos_top="0%",
                pos_right="0%",
                textstyle_opts=opts.TextStyleOpts(
                    font_size=10,
                    color="white",
                )
            ),
        )
    )
    return c

# 散点图绘图：各个行业各年份工资散点图
def ScatterCharts():
    data_list_scatter = {
        'work': [
            '城镇单位就业人员', '农业', '采矿业', '制造业', '能源供应业', '建筑业', '交通运输业', '信息传输业', '批发零售业', '住宿餐饮业',
            '金融业', '房地产业', '租赁商务服务业', '科研勘查业', '水利环保业', '居民服务业', '教育', '卫生福利业', '文体娱乐业', '公共管理业'],
        "2014年": [100251, 57514, 114879, 79795, 143613, 73620, 88929, 170174, 107673, 49418, 195718, 72185, 135268, 152258, 63973, 59289, 96165, 113142, 96303, 95569],
        "2015年": [109174, 62828, 122414, 86536, 153467, 80941, 98996, 183365, 117396, 52999, 208658, 82274, 145659, 158906, 73137, 62576, 100865, 117092, 117099, 100767],
        "2016年": [119935, 67322, 142716, 96813, 163212, 88034, 108905, 200657, 127489, 56933, 226500, 91814, 151937, 163297, 78432, 66280, 106941, 125181, 129644, 107325],
        "2017年": [129795, 69903, 144454, 105733, 174252, 96580, 116763, 212063, 139627, 60153, 247568, 98474, 156621, 176383, 86441, 67013, 111090, 138074, 145257, 118964],
        "2018年": [140400, 71879, 129162, 115888, 182129, 110117, 125216, 232522, 153932, 57848, 257723, 103812, 163418, 191018, 92165, 74539, 114749, 150648, 165573, 129492],
        "2019年": [149377, 60642, 271188, 125664, 204287, 114798, 134369, 237405, 157242, 60022, 258161, 109697, 161663, 184920, 95860, 71832, 136449, 178711, 161284, 150631],
        "2020年": [171884, 81858, 306826, 137441, 233016, 128461, 143897, 270619, 182212, 59260, 330125, 117532, 182869, 217700, 104121, 75979, 173073, 193028, 174370, 188371],
        "2021年": [191844, 86572, 326402, 152248, 246387, 137248, 157455, 303573, 203844, 63409, 397655, 126648, 191329, 236279, 85779, 82271, 199498, 208717, 180734, 224799],
        "2022年": [212476, 95435, 328480, 164495, 256124, 148462, 169815, 330126, 223922, 62826, 437183, 132946, 212126, 262216, 92591, 84146, 222409, 227317, 191524, 262401],
    }


    def scatter_charts(year: str) -> Scatter:
        scatter_xdata = data_list_scatter['work']
        scatter_chart = (
            Scatter(init_opts=opts.InitOpts(width="100%", height="160vh"))
            .add_xaxis(scatter_xdata)
            .add_yaxis(
                "",
                data_list_scatter[year],
                label_opts=opts.LabelOpts(
                    is_show=False,
                    position="top",
                    font_size=12,
                    color="white",
                ),
                tooltip_opts=opts.TooltipOpts(is_show=False),
                symbol_size=8,
                itemstyle_opts=opts.ItemStyleOpts(
                    color="rgba(0, 214, 214,1)",
                ),
            )
            .set_global_opts(
                title_opts=opts.TitleOpts (
                    title="各行业{}平均工资".format(year),
                    subtitle="单位:元  数据来源：国家统计局",
                    pos_left="50%",
                    pos_top="0%",
                    text_align="center",
                    title_textstyle_opts=opts.TextStyleOpts(
                        font_size=16,
                        font_weight="bold",
                        color="white",
                    ),
                    subtitle_textstyle_opts=opts.TextStyleOpts(
                        font_size=12,
                        font_weight="bold",
                        color="grey",
                    ),
                ),
                xaxis_opts=opts.AxisOpts(
                    axislabel_opts=opts.LabelOpts(is_show=False, font_size=10),
                    axisline_opts=opts.AxisLineOpts(
                        is_show=False,
                        linestyle_opts=opts.LineStyleOpts(color="rgba(0,0,0,0)")
                    ),
                    splitline_opts=opts.SplitLineOpts(is_show=False),  # 隐藏分隔线
                ),
                yaxis_opts=opts.AxisOpts(
                    min_=49418,
                    axislabel_opts=opts.LabelOpts(is_show=False, font_size=12),  # 修改y轴标签字体大小
                    splitline_opts=opts.SplitLineOpts(
                        is_show=False,
                        linestyle_opts=opts.LineStyleOpts(color="rgba(0,0,0,0)"),
                    ),
                ),
                tooltip_opts=opts.TooltipOpts(is_show=False),
            )
            .set_series_opts(
                is_show=True,
                label_opts=opts.LabelOpts(
                    formatter="{c}",
                    color="white",
                    position="top",
                ),
            )
        )
        grid = Grid(init_opts=opts.InitOpts(width="100%", height="100%"))
        grid.add(
            scatter_chart,
            grid_opts=opts.GridOpts(
                # pos_left="0",
                pos_bottom="5px"
            )
        )
        return grid


    def create_timeline() -> Timeline:
        time_list = [year for year in data_list_scatter.keys() if isinstance(year, str) and year.endswith('年')]
        timeline = Timeline(init_opts=opts.InitOpts(width="100%", height="110vh"))
        for year in time_list:
            scatter_chart = scatter_charts(year)
            timeline.add(scatter_chart, "{}".format(year))
        timeline.add_schema(
            orient="vertical",
            is_auto_play=True,
            play_interval=3000,
            pos_right="10%",
            pos_top="middle",
            width="80px",
            height="500px",
            label_opts=opts.LabelOpts(is_show=True, color="#000", font_size=14),
            linestyle_opts=opts.LineStyleOpts(width=2, color="#000"),
            is_timeline_show=False,
        )
        return timeline


    timeline_chart = create_timeline()
    return timeline_chart

# 地图绘图：人口全国分布地图
def MapCharts(populations, years):
    url = "https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json"
    response = requests.get(url)
    china_geo = response.json()

    # 初始化数据字典
    data_list_map = {"province": []}
    for year in years:
        data_list_map[year] = []

    # 遍历数据库中的每一行数据
    for population in populations:
        data_list_map["province"].append(population.proviences)  # 使用模型中的字段名
        for year in years:
            # 动态获取字段值
            field_name = f"number_{year}"
            data_list_map[year].append(getattr(population, field_name))

    # 获取全国数据索引
    national_index = data_list_map['province'].index('全国')
    def map_charts(year: str, subtitle_data: int) -> Map:
        map_1 = (
            Map()
            .add_geo_json(geo_json=china_geo)
            .add(
                "",
                [list(z) for z in zip(data_list_map['province'], data_list_map[year])],
                "china",
                is_map_symbol_show=False,
                label_opts=opts.LabelOpts(is_show=True),
                tooltip_opts=opts.TooltipOpts(trigger='item', formatter='{b} : {c} 万人'),
            )
            .set_global_opts(
                title_opts=opts.TitleOpts(
                    title="{}中国各省人口分布图".format(year),
                    subtitle="人口总数: {} 万人".format(subtitle_data),
                    pos_left="50%",
                    pos_top="10%",
                    text_align="center",
                    title_textstyle_opts=opts.TextStyleOpts(font_size=20, font_weight="bold")
                ),
                tooltip_opts=opts.TooltipOpts(
                    is_show=True,
                    formatter='{b} : {c} 万人'
                ),
            )
            .set_series_opts(
                label_opts=opts.LabelOpts(is_show=False),
                show_legend=True,
            )
        )
        map_1.set_global_opts(
            title_opts=opts.TitleOpts(
                title="{}中国各省人口分布图".format(year),
                subtitle="人口总数: {} 万人   数据来源：国家统计局".format(subtitle_data),
                pos_left="50%",
                pos_top="0%",
                text_align="center",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_size=20,
                    font_weight="bold",
                    color="white",
                ),
                subtitle_textstyle_opts=opts.TextStyleOpts(
                    font_size=16,
                    font_weight="bold",
                    color="grey",
                )
            ),
            visualmap_opts=opts.VisualMapOpts(
                min_=200,
                max_=13000,
                range_text=["分布程度(万人)", ""],
                textstyle_opts=opts.TextStyleOpts(
                    color="grey",
                    font_size=12,
                    font_weight="bold",
                ),
                is_piecewise=False,
                type_='color',
                range_color=['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026'],
                pos_left="0%",
                pos_top="20%",
                split_number=10,
                orient="vertical",
                item_width=20,
                item_height=200,
            ))
        return map_1
    
    def create_timeline() -> Timeline:
        timeline = Timeline(init_opts=opts.InitOpts(width="100%", height="98vh"))
        for year in years:
            national_data = data_list_map[year][national_index]
            map_chart = map_charts(year, national_data)
            timeline.add(map_chart, "{}年".format(year))

        timeline.add_schema(
            orient="vertical",
            is_auto_play=True,
            play_interval=3000,
            pos_right="0%",
            pos_top="middle",
            width="75px",
            height="400px",
            label_opts=opts.LabelOpts(is_show=True, color="#fff"),
            linestyle_opts=opts.LineStyleOpts(width=2, color="#000"),
        )
        return timeline

    timeline_chart = create_timeline()
    return timeline_chart


# 响应请求
class BarChartView(APIView):
    def get(self, request):
        chart = BarCharts(populations=populations, years=years)
        return HttpResponse(
            chart.dump_options_with_quotes(),
            content_type="application/json"
            )
    
class PieChartView(APIView):
    def get(self, request):
        chart = PieCharts()
        return HttpResponse(
            chart.dump_options_with_quotes(),
            content_type='application/json'
        )
    
class LineChartView(APIView):
    def get(self, request):
        chart = LineCharts()
        return HttpResponse(
            chart.dump_options_with_quotes(),
            content_type='application/json'
        )
    
class ScatterChartView(APIView):
    def get(self, request):
        chart = ScatterCharts()
        return HttpResponse(
            chart.dump_options_with_quotes(),
            content_type='application/json'
        )
    
class MapChartView(APIView):
    def get(self, request):
        chart = MapCharts(populations=populations, years=years)
        return HttpResponse(
            chart.dump_options_with_quotes(),
            content_type ='application/json'
        )

class IndexView(APIView):
    def get(self, request):
        return render(request, "index.html")
    # 默认索引至index/templates/index.html