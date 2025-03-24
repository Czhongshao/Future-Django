from django.db import models

class Population(models.Model):
    province = models.CharField(db_column='Province', primary_key=True, max_length=10, db_comment='省份、自治区、以及全国')
    year_2023 = models.IntegerField(blank=True, null=True, db_comment='2023年末总人口数量')
    year_2022 = models.IntegerField(blank=True, null=True, db_comment='2022年末总人口数量')
    year_2021 = models.IntegerField(blank=True, null=True, db_comment='2021年末总人口数量')
    year_2020 = models.IntegerField(blank=True, null=True, db_comment='2020年末总人口数量')

    class Meta:
        managed = False
        db_table = 'population'

    