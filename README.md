# Scripts Máquina Noter HTB 

En este repositorio, podemos encontrar trest scripts en Bash, PowerShell y python3, de forma que podemos encontrar usuarios potenciales para conectarnos. 

### Ejecución de script de Bash 
Le pasamos por parametro un dicionario de usuarios.
```bash
./BruteForce.sh users
```

### Ejecución de script de PowerShell
Le pasamos usando el parametro -w un dicionario de usuarios.
```powershell
./BruteForce.ps1 -w users
```

### Ejecución de script de Python
No pasamos ningun parametros el diccionario se llama users. 
```powershell
python3 BruteForce.py
```
