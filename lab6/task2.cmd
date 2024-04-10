echo ComputerName=%ComputerName%

md temp
net share temp=C:\LAB6\temp /grant:IEUser,full

set /a h=%time:~0,2%
set /a m=%time:~3,2%
set /a m=%m%+1
if %m% geq 60 set /a h=%h%+1 & set /a m=0
if %h% geq 24 set /a h=0
if %m% lss 10 set m=0%m%
if %h% lss 10 set h=0%h%

echo start copy_script.cmd
set name=copy_script_process
schtasks /create /tn %name% /tr C:\LAB6\copy_script.cmd /sc once /st %h%:%m%

@:check
@schtasks /nh /query /tn %name% | find "Running" && goto :exists
@goto :check

:exists
schtasks /end /tn %name%
echo process successfully killed
fc C:\Windows\very_big_file.txt \\%ComputerName%\temp\very_big_file.txt > big_file_difference.txt

copy_script.cmd
