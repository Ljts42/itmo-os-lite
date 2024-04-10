@echo off
for /f "tokens=*" %%i in (%1) do (
    set line=%i:bitch=*****%
    echo %line% >> bitch.txt
)
for /f "tokens=*" %%i in (bitch.txt) do (
    echo %i:fuck=****% >> fuck.txt
)
for /f "tokens=*" %%i in (fuck.txt) do (
    echo %i:shit=****% >> shit.txt
)
rem move tmp good.txt