# index/admin.py
from django.contrib import admin
# from index.models import Provinces, PopulationData


# # 省份（含全国）管理
# class ProvincesAdmin(admin.ModelAdmin):
#     # 指定后台网页的字段名称
#     list_display = ['id', 'province_name']
#     # 设置verbose_name属性
#     list_per_page = 10  # 每页显示 10 条数据
#     ordering = ['id'] # 按照id排序

# # 省份（含全国）人口数据管理
# class PopulationDataAdmin(admin.ModelAdmin):
#     list_display = ['id', 'province_id', 'year', 'total']
#     ordering = ['id'] # 按照id排序
#     list_per_page = 10  # 每页显示 10 条数据


# admin.site.site_header = '数据管理后台'
# admin.site.site_title = '数据管理后台'
# admin.site.index_title = '数据管理后台'
# # 注册模型到后台管理
# admin.site.register(Provinces, ProvincesAdmin)
# admin.site.register(PopulationData, PopulationDataAdmin)
