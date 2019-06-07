sed 's/[/]/-/g' data.csv > out.1
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\);/20\3-\2-\1;/' out.1 > out.2
sed -e 's/,/./g' -e 's/\([0-9][0-9][0-9]\);\([0-9]\)/\1.\2/' out.2 > out.3
sed 's/;/,/g' out.3 > out.4
sed -e 's/,N/,\\N/g' -e 's/,,/,\\N,/g' -e 's/,n/,\\N/g' -e 's/n/N/g' out.4 > out.5
sed 'y/abc/ABC/' out.5 > out.6
sed -e  's/,.$/,\\N\r/' out.6 > sln.txt
rm out.*
cat sln.txt
