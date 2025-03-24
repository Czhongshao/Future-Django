from django.db import models


class Populations(models.Model):
    proviences = models.CharField(db_column='Proviences', primary_key=True, max_length=50)  # Field name made lowercase.
    number_2023 = models.IntegerField(db_column='2023', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2022 = models.IntegerField(db_column='2022', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2021 = models.IntegerField(db_column='2021', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2020 = models.IntegerField(db_column='2020', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2019 = models.IntegerField(db_column='2019', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2018 = models.IntegerField(db_column='2018', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2017 = models.IntegerField(db_column='2017', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2016 = models.IntegerField(db_column='2016', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2015 = models.IntegerField(db_column='2015', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2014 = models.IntegerField(db_column='2014', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2013 = models.IntegerField(db_column='2013', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2012 = models.IntegerField(db_column='2012', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2011 = models.IntegerField(db_column='2011', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2010 = models.IntegerField(db_column='2010', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2009 = models.IntegerField(db_column='2009', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2008 = models.IntegerField(db_column='2008', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2007 = models.IntegerField(db_column='2007', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2006 = models.IntegerField(db_column='2006', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.
    number_2005 = models.IntegerField(db_column='2005', blank=True, null=True)  # Field renamed because it wasn't a valid Python identifier.

    class Meta:
        managed = False
        db_table = 'populations'
