#!/bin/bash

#  By:Sizus
#  Usage
# ./uascanner.sh <url> <UA file>
#

filename=$2
echo "================== UA Scanner ======================"
echo " "
echo "Starting scan...."
sum=0
while read -r line
do
	wget -U "$line" $1 -O file.tmp >/dev/null 2>&1 		
	echo $(md5sum file.tmp) $(echo $line) >> file2.tmp
	let "sum=sum+1"
	echo "User agent number $sum : $line"

done < "$filename"
echo "===================================================="
echo "+++++++++++++++++++++++ RESULTS ++++++++++++++++++++"
echo "===================================================="

cat file2.tmp
rm file.tmp
rm file2.tmp
