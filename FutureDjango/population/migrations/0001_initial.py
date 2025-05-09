# Generated by Django 5.1.6 on 2025-04-05 06:11

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='GDPData',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.IntegerField(verbose_name='年份')),
                ('gdp', models.IntegerField(blank=True, null=True, verbose_name='生产总值（亿元）')),
            ],
            options={
                'verbose_name': '中国生产总值数据',
                'verbose_name_plural': '中国生产总值数据',
                'db_table': 'population_data',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PopulationData',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('year', models.IntegerField(verbose_name='年份')),
                ('total', models.IntegerField(blank=True, null=True, verbose_name='年末总人口（万人）')),
                ('birth_rate', models.FloatField(blank=True, null=True, verbose_name='出生率（‰）')),
                ('death_rate', models.FloatField(blank=True, null=True, verbose_name='死亡率（‰）')),
                ('nature_growth_rate', models.FloatField(blank=True, null=True, verbose_name='自然增长率（‰）')),
                ('man', models.IntegerField(blank=True, null=True, verbose_name='男性人口（万人）')),
                ('woman', models.IntegerField(blank=True, null=True, verbose_name='女性人口（万人）')),
            ],
            options={
                'verbose_name': '中国人口数据',
                'verbose_name_plural': '中国人口数据',
                'db_table': 'population_data',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Provinces',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('province_name', models.CharField(max_length=50, unique=True, verbose_name='省份')),
            ],
            options={
                'verbose_name': '省份',
                'verbose_name_plural': '省份',
                'db_table': 'provinces',
                'managed': False,
            },
        ),
    ]
