from django.db import models


# class Populations(models.Model):
#     proviences = models.CharField(db_column='Proviences', primary_key=True, max_length=50)
#     number_2023 = models.IntegerField(db_column='2023', blank=True, null=True)  
#     number_2022 = models.IntegerField(db_column='2022', blank=True, null=True)  
#     number_2021 = models.IntegerField(db_column='2021', blank=True, null=True)  
#     number_2020 = models.IntegerField(db_column='2020', blank=True, null=True)  
#     number_2019 = models.IntegerField(db_column='2019', blank=True, null=True)  
#     number_2018 = models.IntegerField(db_column='2018', blank=True, null=True)  
#     number_2017 = models.IntegerField(db_column='2017', blank=True, null=True)  
#     number_2016 = models.IntegerField(db_column='2016', blank=True, null=True)  
#     number_2015 = models.IntegerField(db_column='2015', blank=True, null=True)  
#     number_2014 = models.IntegerField(db_column='2014', blank=True, null=True)  
#     number_2013 = models.IntegerField(db_column='2013', blank=True, null=True)  
#     number_2012 = models.IntegerField(db_column='2012', blank=True, null=True)  
#     number_2011 = models.IntegerField(db_column='2011', blank=True, null=True)  
#     number_2010 = models.IntegerField(db_column='2010', blank=True, null=True)  
#     number_2009 = models.IntegerField(db_column='2009', blank=True, null=True)  
#     number_2008 = models.IntegerField(db_column='2008', blank=True, null=True)  
#     number_2007 = models.IntegerField(db_column='2007', blank=True, null=True)  
#     number_2006 = models.IntegerField(db_column='2006', blank=True, null=True)  
#     number_2005 = models.IntegerField(db_column='2005', blank=True, null=True)  

#     class Meta:
#         managed = False
#         db_table = 'populations'


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

