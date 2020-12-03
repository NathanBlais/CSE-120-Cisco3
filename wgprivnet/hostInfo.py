#!/usr/bin/env python3
from tkinter import *

class hostInfo(object):
	
	def verify_login(self, Username, Password):
		f = open("username.txt", "r")
		h = open("password.txt", "r")
		if Username in f and Password in h:
			return True

	def call_back(self, Username, Password):
		with open("username.txt", "a+") as fh:
			isduplicate = open("username.txt").read().find(Username)
			if isduplicate != -1:
				print("Duplicate found")
				return
			fh.write(Username+("\n"))
		with open("password.txt", "a+") as fh:
			fh.write(Password+("\n"))

	def login(self):
		m = Tk()
		m.geometry("400x200")
		m.title("Create Administer User")

		Username = StringVar()
		Password = StringVar()
		L1 = Label(m, text= "Username:")
		L1.place(x = 15, y = 10)
		E1 = Entry(m, textvariable=Username, bd=5, width = "20")
		E1.pack(side=TOP)
		L2 = Label(m, text= "Password:")
		L2.place(x = 15, y = 50)
		E2 = Entry(m, textvariable=Password, bd=5, width = "20")
		E2.pack(side=TOP)
		B = Button(m, text="Create Administer", width="20", height="1", command=lambda:call_back(E1.get(), E2.get()))
		B.pack()

		Bool = verify_login(Username, Password)
		if (!Bool):
			login()
		m.mainloop()

