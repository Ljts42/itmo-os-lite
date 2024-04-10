#!bin/bash
mkdir ~/test && echo 'catalog test was created successfully' >> ~/report && echo -n > ~/test/$(date +'%F_%R')

ping -c 1 'www.net_nikogo.ru' || echo "$(date +'%F_%R') not available" >> ~/report
