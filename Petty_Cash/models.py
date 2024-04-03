# Petty_Cash/models.py
import os
import datetime
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


def get_file_name(instance, filename):
    now_time = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    new_filename = "%s%s" % (now_time, filename)
    return os.path.join('bill_images/', new_filename)
            
class Expense(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=255)
    category = models.CharField(max_length=100)
    bill = models.ImageField(upload_to=get_file_name, null=True, blank=True)
    created_at = models.DateTimeField(default=timezone.now, editable=False)
    status = models.CharField(max_length=100, null=True, blank=True)
    ticket_amount = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
   

    def _str_(self):
        return f"{self.user.username} - {self.amount} - {self.description}"

class AdminExpense(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    capital = models.DecimalField(max_digits=10, decimal_places=2)
    branch = models.CharField(max_length=255)
    date = models.DateField()
    description = models.TextField()
    remaining_amount = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    

    def __str__(self):
        return f"{self.user.username} - {self.date}"
