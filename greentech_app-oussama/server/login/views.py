from django.http import HttpResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse
from django.core.exceptions import ObjectDoesNotExist

from login.models import *
from login.serializers import *
from django.core.mail import send_mail
from django.core.files.storage import default_storage
from django.conf import settings
from django.views.decorators.csrf import csrf_protect
from django.utils.decorators import method_decorator
from django.contrib.auth.hashers import make_password, check_password

@csrf_exempt
def V_Crud_User(request, id=0):
    if request.method == 'GET':
        user = T_User.objects.all()
        serializer = S_User(user, many=True)
        return JsonResponse(serializer.data, safe=False)
    elif request.method == 'POST':
        user_data = JSONParser().parse(request)
        password = user_data['U_Pwd']
        try:
            T_User.objects.get(U_Email=user_data['U_Email'])
            return JsonResponse("The account already exists!", safe=False)
        except ObjectDoesNotExist:
            serializer = S_User(data=user_data)
            if serializer.is_valid():
                password = user_data.get('U_Pwd')
                hashed_password = make_password(password)
                user = serializer.save(U_Pwd=hashed_password)
                serializer_data = serializer.data
                serializer_data.pop('U_Pwd')
                return JsonResponse(serializer_data, safe=False)
            return JsonResponse(serializer.errors, status=400)
    elif request.method == 'PUT':
        user_data = JSONParser().parse(request)
        user = T_User.objects.get(U_Id=user_data['U_Id'])
        serializer = S_User(user, data=user_data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse("Updated", safe=False)
        return JsonResponse("Failed to Update")
    elif request.method == 'DELETE':
        user = T_User.objects.get(U_Id=id)
        user.delete()
        return JsonResponse("Deleted Successfully", safe=False)

@csrf_exempt
def get_User(request, Id):
    try:
        user = T_User.objects.filter(U_Id=Id)
        if request.method == 'GET':
            serializer = S_User(user, many=True)
            return JsonResponse(serializer.data, safe=False)
    except:
        return HttpResponse(status=404)

@csrf_exempt
def check_login(request):
    if request.method == 'POST':
        user_data = JSONParser().parse(request)
        email = user_data['U_Email']
        password = user_data['U_Pwd']
        try:
            user = T_User.objects.get(U_Email=email)
            if check_password(password, user.U_Pwd):
                serializer = S_User(user)
                print("yes !")
                return JsonResponse(serializer.data, status=200, safe=False)
            else:
                return JsonResponse("Incorrect password!", status=401, safe=False)
        except T_User.DoesNotExist:
            return JsonResponse("User not found!", status=404, safe=False)
    return HttpResponse(status=405)

