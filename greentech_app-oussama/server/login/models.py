from django.db import models

# Create your models here.
class T_User(models.Model):
     U_Id = models.AutoField(primary_key=True)
     U_FirstName = models.CharField(max_length=150)
     U_LastName = models.CharField(max_length=150)
     U_Email = models.EmailField()
     U_Pwd = models.CharField(max_length=150)
     U_Admin = models.BooleanField()
     U_Client = models.BooleanField()