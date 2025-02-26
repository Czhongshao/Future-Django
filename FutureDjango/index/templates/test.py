import requests
from pyecharts.charts import Map, Timeline
from pyecharts import options as opts

# 地图绘图：人口全国分布地图
def MapCharts():
    # 获取阿里云地图GeoJSON数据
    url = "https://geo.datav.aliyun.com/areas_v3/bound/100000_full.json"
    response = requests.get(url)
    china_geo = response.json()

    data_list_map = {
        'province': ['北京市', '天津市', '上海市', '重庆市', '河北省', '山西省', '辽宁省', '吉林省', '黑龙江省', '江苏省',
                    '浙江省', '安徽省', '福建省', '江西省', '山东省', '河南省', '湖北省', '陕西省', '湖南省', '广东省',
                    '海南省', '四川省', '贵州省', '云南省', '甘肃省', '青海省', '内蒙古自治区', '广西壮族自治区',
                    '西藏自治区', '宁夏回族自治区', '新疆维吾尔自治区'],

        '2014年': [2171, 1429, 2467, 3043, 7323, 3528, 4358, 2642, 3608, 8281, 5890, 5997, 3945, 4480, 9808, 9645, 5816,
                3827, 6611, 11489, 936, 8139, 3677, 4653, 2531, 576, 2449, 4770, 325, 678, 2325],
        # 其他年份数据保持不变...
        'all_people': [137646, 138326, 139232, 140011, 140541, 141008, 141212, 141260, 141175],
    }

    def map_charts(year: str, subtitle_data: int) -> Map:
        map_1 = (
            Map()
            .add_geo_json(geo_json=china_geo)  # 注册自定义地图
            .add(
                "",
                [list(z) for z in zip(data_list_map['province'], data_list_map[year])],
                "china",  # 使用注册的地图名称
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
                    range_color=['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', 
                                '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026'],
                    pos_left="0%",
                    pos_top="20%",
                    split_number=10,
                    orient="vertical",
                    item_width=20,
                    item_height=200,
                )
            )
        )
        return map_1

    def create_timeline() -> Timeline:
        time_list = [year for year in data_list_map.keys() if isinstance(year, str) and year.endswith('年')]
        timeline = Timeline(init_opts=opts.InitOpts(width="100%", height="98vh"))
        for year in time_list:
            map_chart = map_charts(year, data_list_map['all_people'][time_list.index(year)])
            timeline.add(map_chart, "{}".format(year))
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

    return create_timeline()

# 使用示例
map_chart = MapCharts()
map_chart.render("population_distribution.html")