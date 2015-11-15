#!/bin/bash
#USAGE : ./0xFFC4.sh picture.jpg

readonly PROGNAME=$(basename $0)

echo "--" $PROGNAME "--"

filename=$(echo $1 |  rev | cut -c 5- | rev)

cp $filename".jpg" $filename"0.jpg"

echo "-- COMPRESSION LINEAIRE --"

for i in {0..99}
do
        echo -ne "    Création de $filename$i.jpg"
        convert -quality $((100-$i))%  $filename"0.jpg" $filename$i".jpg"
done

echo "-- COMPRESSION EXPONENTIELLE --"

for i in {100..199}
do
        echo "    Création de $filename$i.jpg"
        convert -quality $((200-$i))%  $filename$(($i-1))\.jpg $filename$i\.jpg
done

echo "-- COMPRESSIONS TERMINEES --"
