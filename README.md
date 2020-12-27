# CSE-120-Cisco3: Name Not Chosen

Description
-----------
This project was part of our university capstone through Inovate to Grow. 
We were given a goal from our Cisco sponsor to find a way to secure user's devices from malicious IOT devices. 
Our team's solution to this problem was hosting a local WireGuard VPN on a Raspberry Pi on our router to encrypt our data from all other devices on the network.

Installation
-----------
The project officialy only runs and has been tested for DietPi.

Check the PDF for intructions on how to install DietPi
  
-----------
To install the program

  1. Download the files using the command: `wget https://github.com/NathanBlais/CSE-120-Cisco3/archive/main.zip`
  2. Run the command `unzip main.zip`
  3. Run the command `chmod -R 755 CSE-120-Cisco3-main/`
  4. Run the command `cd CSE-120-Cisco3-main`
  5. Run the command `./install/install.sh`
  6. Quickly run through all the prompts, be sure to choose a **server** setup
  
  At the end the website should start.
  
  If you reboot or ever close the script, you need to start the site up again by
  runnig the command `python3 manage.py runserver 0.0.0.0:8080` in the CSE-120-Cisco3-main folder.


Project Status
-----------
The class is over and the project is officially done. There is still a chance of it being worked on if anyone form the offical team or otherwise submits code.
It is very unlikly to be worked on, but I'm writing a readme and still coding after the project finished so.. it is still posible that it won't be dropped.

Support
-----------
If you have a comment or need help, leave a new issue. It will be looked at and responded to eventualy. It all depends on how often I, the host, log on.

Authors
-----------
Team 03 - Smiling Friends

Nathan Blais  
Team Coordinator / Shell Programmer  
nblais@ucmerced.edu

Orion Johnson  
Code Designer / Python Programmer  
ojohnson2@ucmerced.edu

Guangyu (Darren) Li  
Ui Designer  
gli25@ucmerced.edu

Ivy Nguyen  
Python Programmer  
inguyen5@ucmerced.edu
