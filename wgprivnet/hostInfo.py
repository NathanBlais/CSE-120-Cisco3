#!/usr/bin/env python3


class hostInfo(object):
    
    __slots__ = (
        "publicKey",
        "privateKey",
        "IP",     
        "port"
    )

    def __init__(self, connections):
        self.publicKey = connections[0].getAttr('PUBLIC_KEY')
        self.privateKey = connections[0].getAttr('PRIVATE_KEY')
        self.ip = connections[0].getAttr('IP')
        self.port = connections[0].getAttr('PORT')
  

    def __repr__(self):
        return repr({
            'publicKey': self.publicKey,
            'privateKey': self.privateKey,
            'IP': self.ip,
            'port': self.port,
        })
    
  From Tkinter import *
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
