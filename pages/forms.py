from django import forms

class UserForm(forms.Form):
        userinput = forms.CharField(label='userinput',max_length=100)



