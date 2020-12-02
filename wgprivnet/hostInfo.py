#!/usr/bin/env python3
From Tkinter import *

class hostInfo(object):
	top = Login()
	Username = StringVar()
	Password = StringVar()
	L1 = Label(top, text = “Username:”)
	L1.pack(side = LEFT)
	E1 = Entry(top, textvariable = Username, bd = 5)
	E1.pack(side = RIGHT)
    	L2 = Label(top, text = “Password:”)
	L2.pack(side = LEFT)
	E2 = Entry(top, textvariable = Password, bd = 5)
	E2.pack(side = RIGHT)
	Bool = Verify(Username, Password)
	if(Bool)
		Login()
	top.mainloop()

	verify(Username, Password)
	Names = [‘default’]
	Passwords = [‘default’]
	if (Username in Names[0] and Password in Passwords[0]:
	    return true	
	else 
		return false
