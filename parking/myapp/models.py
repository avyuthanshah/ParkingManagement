from django.db import models

class Membership(models.Model):
    remaining_days = models.IntegerField()

class ParkingArea(models.Model):
    name = models.CharField(max_length=100)
    occupancy = models.IntegerField()
