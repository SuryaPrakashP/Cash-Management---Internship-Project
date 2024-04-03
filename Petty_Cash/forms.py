import datetime
from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import Expense, AdminExpense
from django.contrib.auth.models import User

class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

class ExpenseForm(forms.ModelForm):
    class Meta:
        model = Expense
        fields = ['amount', 'description', 'category', 'bill']

class AdminExpenseForm(forms.ModelForm):
    branch = forms.ChoiceField(choices=[], widget=forms.Select(attrs={'class': 'form-control'}))
    description = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control', 'rows': 3}))  # Adjust the rows attribute as needed

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Populate the branch choices with usernames of regular users
        regular_users = User.objects.filter(is_staff=False)
        choices = [('', 'Please select branch')]  # Add default option
        choices += [(user.username, user.username) for user in regular_users]
        self.fields['branch'].choices = choices
    
        # Set minimum and maximum date range for the date field
        today = datetime.date.today()
        first_day_of_month = today.replace(day=1)
        last_day_of_month = today.replace(day=1, month=today.month+1) - datetime.timedelta(days=1)
        self.fields['date'].widget.attrs['min'] = first_day_of_month.strftime('%Y-%m-%d')
        self.fields['date'].widget.attrs['max'] = last_day_of_month.strftime('%Y-%m-%d')

    class Meta:
        model = AdminExpense
        fields = ['capital', 'branch', 'date', 'description']
        widgets = {
            'date': forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}),
        }
        labels = {
            'capital': 'Amount',
        }