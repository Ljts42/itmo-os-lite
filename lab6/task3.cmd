net start > services_1.txt

net stop DnsCache

timeout /nobreak /t 3
net start > services_2.txt

fc services_1.txt services_2.txt > services_difference.txt

net start DnsCache
