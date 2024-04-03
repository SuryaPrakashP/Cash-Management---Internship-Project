# views.py
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .forms import CreateUserForm, ExpenseForm, AdminExpenseForm
from django.contrib import messages
from django.contrib.auth import authenticate, login
from .models import Expense, AdminExpense
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_protect
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout, Field, Submit
from django.forms.models import model_to_dict
from django.db.models import Q
from itertools import chain
from django.db.models import Sum
from django.db.models import Count
from django.shortcuts import get_object_or_404
from django.views.decorators.csrf import csrf_exempt
import json
from django.db import transaction
import datetime
from time import timezone
from django.contrib.auth import logout as django_logout



def home(request):
    return render(request, "home.html")

def logout(request):
    django_logout(request)
    return redirect('login') 

@csrf_protect
def login_page(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, 'Login successful!')
            return redirect('dash_view')  # Redirect to dash_view upon successful login
        else:
            messages.error(request, 'Invalid username or password. Please try again.')

    return render(request, "login.html")

@login_required(login_url='login')
def register(request):
    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Your account has been created! You are able to login')
            return redirect('login')
        else:
            messages.warning(request, 'Password mismatch or invalid form submission. Please check the details.')
    else:
        form = CreateUserForm()

    return render(request, 'register.html', {'form': form})


@login_required(login_url='login')
def dash_view(request):
    user = request.user

    if user.is_staff:
        # Admin user
        total_capital_amount = AdminExpense.objects.aggregate(Sum('capital'))['capital__sum'] or 0
        unique_branch_count = AdminExpense.objects.values('branch').distinct().count()

        admin_expense = AdminExpense.objects.filter(branch=user.username).first()

        # Calculate utilized and remaining amounts for admin user
        utilized_amount = Expense.objects.filter(user__is_staff=True).aggregate(Sum('ticket_amount'))['ticket_amount__sum'] or 0
        remaining_amount = admin_expense.capital - utilized_amount if admin_expense else 0

        # Retrieve allocated capital for each branch user
        branch_users = User.objects.filter(is_staff=False)
        branch_summary = []

        total_users = 0  # Variable to hold the total count of users

        for branch_user in branch_users:
            allocated_capital = AdminExpense.objects.filter(branch=branch_user.username).aggregate(Sum('capital'))['capital__sum'] or 0
            utilized_by_branch = Expense.objects.filter(user=branch_user).aggregate(Sum('ticket_amount'))['ticket_amount__sum'] or 0
            remaining_for_branch = allocated_capital - utilized_by_branch

            # Count the total number of users for each branch
            total_users += 1

            branch_summary.append({
                 'branch_username': branch_user.username,
                 'allocated_capital': allocated_capital,
                 'utilized_amount': utilized_by_branch,
                 'remaining_amount': remaining_for_branch,
             }) 
            updateRemAmount(branch_summary)

        context = {
            'username': user.username,
            'total_capital_amount': total_capital_amount,
            'allocated_capital': admin_expense.capital if admin_expense else 0,
            'unique_branch_count': unique_branch_count,
            'utilized_amount': utilized_amount,
            'remaining_amount': remaining_amount,
            'branch_summary': branch_summary,
            'total_users': total_users,  # Pass the total count of users to the template
        }
    else:
        allocated_capital = AdminExpense.objects.filter(branch=user.username).aggregate(Sum('capital'))['capital__sum'] or 0

        # Calculate the utilized amount by the user's branch
        utilized_by_branch = Expense.objects.filter(user=user).aggregate(Sum('ticket_amount'))['ticket_amount__sum'] or 0

        # Calculate the remaining amount
        remaining_amount = allocated_capital - utilized_by_branch

        context = {
            'username': user.username,
            'allocated_capital': allocated_capital,
            'utilized_by_branch': utilized_by_branch,
            'remaining_amount': max(remaining_amount, 0),  # Ensure remaining_amount is not negative
        }

    # Fetch latest expenses
    latest_expenses = Expense.objects.filter(user=user)[:5]
    context['latest_expenses'] = latest_expenses  # Add latest_expenses to the context

    if request.method == 'POST':
        # Handle POST request
        for branch_user in User.objects.filter(is_staff=False):
            deducted_amount = float(request.POST.get(f'deducted_amount_{branch_user.username}', 0))

            with transaction.atomic():
                # Ensure atomicity for database transactions
                # Subtract the entered amount from the remaining amount
                remaining_amount -= deducted_amount

                # Update the allocated capital for the user's branch
                admin_expense = AdminExpense.objects.filter(branch=branch_user.username).first()
                if admin_expense:
                    admin_expense.capital -= deducted_amount
                    admin_expense.save()

                # Save the deducted amount to the database or perform any necessary actions
                # (You may want to create a model to store deducted amounts and link it to users)

        # Update context after processing POST request
        context['remaining_amount'] = max(remaining_amount, 0)

    return render(request, 'Dash.html', context)

@login_required(login_url='login')
def entry_view(request):
    if request.method == 'POST':
        is_admin = request.user.is_staff

        if is_admin:
            form = AdminExpenseForm(request.POST)
        else:
            form = ExpenseForm(request.POST, request.FILES)

        if form.is_valid():
            expense = form.save(commit=False)
            expense.user = request.user

            if is_admin:
                # Additional logic for AdminExpense fields
                # You may want to customize this based on your form fields
                expense.capital = form.cleaned_data.get('capital')
                expense.branch = [(user.username, user.username) for user in User.objects.filter(is_staff=False)]
                expense.date = form.cleaned_data.get('date')
                expense.description = form.cleaned_data.get('description')

            expense.save()
            messages.success(request, 'Expense details saved successfully!')
            return redirect('history')
        else:
            messages.error(request, 'Invalid form submission. Please check the details.')
    else:
        is_admin = request.user.is_staff

        if is_admin:
            form = AdminExpenseForm()
        else:
            form = ExpenseForm()

    if is_admin:
        return render(request, 'admin_entry.html', {'form': form})
    else:
        return render(request, 'Entry.html', {'form': form})



@login_required(login_url='login')
def history(request):
    if request.user.is_authenticated:
        if request.user.is_staff:
            # For admin users, provide only the necessary fields
            admin_expenses = AdminExpense.objects.filter(user=request.user)
            expenses = [
                {
                    'description': admin_expense.description,
                    'capital': admin_expense.capital,
                    'branch': admin_expense.branch,
                    'date': admin_expense.date,
                }
                for admin_expense in admin_expenses
            ]
        else:
            # For regular users, provide only the necessary fields
            user_expenses = Expense.objects.filter(user=request.user)
            expenses = [
                {
                    'amount': expense.amount,
                    'description': expense.description,
                    'category': expense.category,
                    'created_at': expense.created_at,
                    'allocated_accounts': expense.ticket_amount,
                    'ticket_amount':expense.ticket_amount,
                }
                for expense in user_expenses
            ]

            # Sort the combined list by 'created_at' attribute for regular users
            expenses = sorted(expenses, key=lambda x: x['created_at'], reverse=True)

        return render(request, 'history.html', {'expenses': expenses})
    else:
        return render(request, 'history.html', {'expenses': None})


@login_required(login_url='login')
def save_expense(request):
    # Determine which form to use based on the user type
    form = AdminExpenseForm(request.POST, request.FILES) if request.user.is_staff else ExpenseForm(request.POST,request.FILES)

    if form.is_valid():
        # Create an instance of the model with form data, but do not save it to the database yet
        expense = form.save(commit=False)

        # Set the user field to the current user
        expense.user = request.user

        # Additional logic for AdminExpense fields
        if request.user.is_staff:
            expense.capital = form.cleaned_data.get('capital')
            expense.branch = form.cleaned_data.get('branch')
            expense.date = form.cleaned_data.get('date')
            expense.description = form.cleaned_data.get('description')

        # Save the instance to the database
        expense.save()

        # Calculate deducted amount for regular users
        deducted_amount = 0
        if not request.user.is_staff:
            deducted_amount = float(request.POST.get('amount'))

        # Return a success JSON response
        return JsonResponse({'success': True, 'message': 'Expense details saved successfully!',
                             'deducted_amount': deducted_amount})
    else:
        # Return a JSON response with form errors and a status code of 400 (Bad Request)
        errors_dict = {field: form.errors.get(field)[0] for field in form.errors}
        return JsonResponse({'success': False, 'errors': errors_dict}, status=400)


def profile(request):
    return render(request, "profile.html")


@login_required(login_url='login')
def admin_entry(request):
    if request.method == 'POST':
        form = AdminExpenseForm(request.POST)
        if form.is_valid():
            # Get the entered username from the form
            username = form.cleaned_data['branch']

            # Verify if the username exists
            user = get_object_or_404(User, username=username)

            # Allocate the capital to the user
            admin_expense = form.save(commit=False)
            admin_expense.user = user
            admin_expense.save()

            messages.success(request, f'Admin Expense details saved successfully for {username}!')
            return redirect('history')  # Redirect to history page after saving admin expense
        else:
            errors_dict = {field: form.errors.get(field)[0] for field in form.errors}
            return JsonResponse({'success': False, 'errors': errors_dict}, status=400)
    else:
        form = AdminExpenseForm()

    return render(request, 'admin_entry.html', {'form': form})

@login_required(login_url='')
def admin_history(request):
    current_date = datetime.datetime.now()    
    
    admin_expenses = AdminExpense.objects.filter(date__month=current_date.month, date__year=current_date.year)

    # Pass the admin_expenses queryset to the template
    return render(request, 'admin_history.html', {'admin_expenses': admin_expenses})


@login_required(login_url='login')
def branch_view(request):
    if request.user.is_authenticated and request.user.is_staff:
        # Retrieve all regular users
        regular_users = User.objects.filter(is_staff=False)

        # Retrieve all entries from regular users
        user_expenses = Expense.objects.filter(user__is_staff=False)

        return render(request, 'branch.html', {'regular_users': regular_users, 'user_expenses': user_expenses})
    else:
        return render(request, 'branch.html', {'regular_users': None, 'user_expenses': None})


def delete_expense(request):
    if request.method == 'POST' and request.is_ajax():
        expense_id = request.POST.get('expense_id')

        try:
            expense = AdminExpense.objects.get(pk=expense_id)
            expense.delete()
            return JsonResponse({'success': True})
        except AdminExpense.DoesNotExist:
            return JsonResponse({'success': False, 'error': 'Expense not found'}, status=404)
    else:
        return JsonResponse({'success': False, 'error': 'Invalid request'}, status=400)


@csrf_exempt
def update_amount(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            expense_id = data['expense_id']
            ticket_amount = data['ticket_amount']

            # Update the ticket amount for the user expense
            expense = Expense.objects.get(pk=expense_id)
            expense.ticket_amount = ticket_amount
            expense.save()

            return JsonResponse({'success': True})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})

    return JsonResponse({'success': False, 'error': 'Invalid request method'})

csrf_exempt
def update_remaining_amount(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            branch_username = data['branch_username']
            deducted_amount = data['deducted_amount']

            # Update the remaining amount for the branch user in the backend
            admin_expense = AdminExpense.objects.filter(branch=branch_username).first()
            if admin_expense:
                admin_expense.capital -= deducted_amount
                admin_expense.save()

                return JsonResponse({'success': True, 'remaining_amount': admin_expense.capital})
            else:
                return JsonResponse({'success': False, 'error': 'Admin expense not found'})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})

    return JsonResponse({'success': False, 'error': 'Invalid request method'})

def filter_data(request):
    if request.method == 'GET':
        # Get the parameters from the request
        status = request.GET.get('status')
        branch = request.GET.get('branch')
        start_date = request.GET.get('start_date')
        end_date = request.GET.get('end_date')

        # Perform filtering based on the parameters
        queryset = Expense.objects.all()  # Replace 'YourModel' with your actual model name

        # Apply filters
        if status != '0':  # '0' indicates the default option
            queryset = queryset.filter(status=status)
        if branch != '0':
            queryset = queryset.filter(branch=branch)
        if start_date:
            queryset = queryset.filter(date__gte=start_date)
        if end_date:
            queryset = queryset.filter(date__lte=end_date)

        # Serialize queryset to JSON
        data = list(queryset.values())  # Convert queryset to list of dictionaries

        # Return filtered data as JSON response
        return JsonResponse(data, safe=False)
    
def get_branch_name(request):
    # Fetch usernames from the database
    regular_users = User.objects.filter(is_staff=False)

    return render(request, 'branch.html', {'regular_users': regular_users,})

def updateRemAmount(branch_summary):
    for branch_info in branch_summary:
        branch_username = branch_info['branch_username'] 
        remaining_amount = branch_info['remaining_amount'] 
        current_date = datetime.datetime.now() 
        # Update AdminExpense table with remaining_amount 
        admin_expense_obj = AdminExpense.objects.filter(branch=branch_username,date__month=current_date.month, date__year=current_date.year).first() 
        if admin_expense_obj: 
            admin_expense_obj.remaining_amount = remaining_amount 
            admin_expense_obj.save()
