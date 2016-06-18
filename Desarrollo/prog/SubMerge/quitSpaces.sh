

#$1 carpeta donde debe quitar espacios

for FILE in $1* ; do NEWFILE=`echo $FILE | sed 's/ /_/g'` ; mv "$FILE" $NEWFILE ; done

