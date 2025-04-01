# population/models.py
from django.db import models


# 获取省份（含全国）名称表
class Provinces(models.Model):
    province_name = models.CharField(verbose_name='省份', unique=True, max_length=50)

    class Meta:
        managed = False
        db_table = 'provinces'
        verbose_name = '省份'
        verbose_name_plural = '省份'

    def __str__(self):
        return self.province_name
    

# 获取省份（含全国）人口数据表
class PopulationData(models.Model):
    province = models.ForeignKey(Provinces, on_delete=models.CASCADE, verbose_name="省份")
    year = models.IntegerField(verbose_name="年份")
    total = models.IntegerField(verbose_name="年末总人口（万人）", blank=True, null=True)
    birth_rate = models.FloatField(verbose_name="出生率（‰）", blank=True, null=True)
    death_rate = models.FloatField(verbose_name="死亡率（‰）", blank=True, null=True)
    nature_growth_rate = models.FloatField(verbose_name="自然增长率（‰）", blank=True, null=True)
    man = models.IntegerField(verbose_name="男性人口（万人）", blank=True, null=True)
    woman = models.IntegerField(verbose_name="女性人口（万人）", blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'population_data'
        verbose_name = '中国人口数据'
        verbose_name_plural = '中国人口数据'


    def __str__(self):
        return f"{self.province.province_name} - {self.year}"

