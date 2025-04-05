# population/admin.py
from django.contrib import admin
from population.models import Provinces, PopulationData, GDPData


# 省份（含全国）管理
class ProvincesAdmin(admin.ModelAdmin):
    list_display = ['id', 'province_name']
    list_per_page = 10  # 每页显示 10 条数据
    ordering = ['id']  # 按照id排序

# 省份（含全国）人口数据管理
class PopulationDataAdmin(admin.ModelAdmin):
    list_display = ['id', 'province', 'year', 'total', 'birth_rate', 'death_rate', 'nature_growth_rate', 'city', 'country', 'man', 'woman']
    ordering = ['id']  # 按照id排序
    list_per_page = 10  # 每页显示 10 条数据
    list_filter = ['province', 'year']  # 添加过滤器，方便按省份和年份筛选
    search_fields = ['province__province_name', 'year']  # 添加搜索功能，可搜索省份名称和年份

# 省份（含全国）生产总值数据管理
class GDPDataAdmin(admin.ModelAdmin):
    list_display = ['id', 'province', 'year', 'gdp']
    ordering = ['id']  # 按照id排序
    list_per_page = 10  # 每页显示 10 条数据
    list_filter = ['province', 'year']  # 添加过滤器，方便按省份和年份筛选
    search_fields = ['province__province_name', 'year']  # 添加搜索功能，可搜索省份名称和年份

admin.site.site_header = '数据管理后台'
admin.site.site_title = '数据管理后台'
admin.site.index_title = '数据管理后台'

# 注册模型到后台管理
admin.site.register(Provinces, ProvincesAdmin)
admin.site.register(PopulationData, PopulationDataAdmin)
admin.site.register(GDPData, GDPDataAdmin)