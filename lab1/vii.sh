#!bin/bash
grep -aEhor "[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[a-z]+" /etc/* | sed -z "s/\n/, /g" > emails.lst
