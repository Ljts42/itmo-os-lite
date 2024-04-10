md LAB6
cd LAB6

ver > ver.txt
wmic os get FreePhysicalMemory > "wmic os get FreePhysicalMemory.txt"
wmic ComputerSysten get TotalPhysicalMemory > "wmic ComputerSysten get TotalPhysicalMemory.txt"
wmic LogicalDisk get name,size > "wmic LogicalDisk get name,size.txt"

md TEST
xcopy . TEST
cd TEST

type * > all_files_content.txt

for /f "tokens=*" %i in ('dir /B /O:-D ^| more +1') do del "%i"