# Generated by Django 5.1.6 on 2025-03-28 10:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0002_populationdata_provinces'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Populations',
        ),
        migrations.AlterModelOptions(
            name='populationdata',
            options={'managed': False, 'verbose_name': '中国人口数据', 'verbose_name_plural': '中国人口数据'},
        ),
        migrations.AlterModelOptions(
            name='provinces',
            options={'managed': False, 'verbose_name': '省份', 'verbose_name_plural': '省份'},
        ),
    ]
