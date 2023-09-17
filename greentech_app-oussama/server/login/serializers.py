from rest_framework import serializers
from login.models import T_User

class S_User(serializers.ModelSerializer):
    class Meta:
        model = T_User
        fields = ('U_Id','U_FirstName' ,
    'U_LastName' ,
    'U_Email',
    'U_Pwd' ,
    'U_Admin' ,
    'U_Client' )