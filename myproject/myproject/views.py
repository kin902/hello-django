from django.http import HttpResponse


def homepage(request):
    return HttpResponse('Hello World!. Home page')


def about(request):
    return HttpResponse('About page')
