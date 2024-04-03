from django.contrib import admin
from django.urls import path
from Petty_Cash import views
from django.conf import settings
from django.conf.urls.static import static
from Petty_Cash.views import dash_view, entry_view, history, save_expense,admin_entry,admin_history,branch_view,update_amount
from django.contrib.auth import views as auth_views





urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/', views.home, name='home'),
    path('', views.login_page, name='login'),
    path('', auth_views.LoginView.as_view(), name='login'), 
    path('register/', views.register, name='register'),
    path('profile.html/', views.profile, name='profile'),
    path('dash_page/', dash_view, name='dash_view'),  # Use 'dash_view' as the name
    path('Entry.html', entry_view, name='entry_page'),
    path('history/', views.history, name='history'),
    path('save_expense/', save_expense, name='save_expense'),
    path('logout/', views.logout, name='logout'),
    path('admin_entry/',views.admin_entry,name='admin_entry'),
    path('admin_history/',views.admin_history,name='admin_history'),
    path('branch_page/', views.branch_view, name='branch_view'),  # Use 'dash_view' as the name
    path('update_amount/', views.update_amount, name='update_amount'),
    path('get_branch_name/', views.get_branch_name, name='get_branch_name'),

    
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
