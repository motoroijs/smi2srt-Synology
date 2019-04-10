#!/bin/sh

export LC_ALL=en_US.utf8
export LANG=en_US.utf8
targetdir='/volume1/video/애니'

find "$targetdir" -type f -name "*.ko.srt" | grep -v "@eaDir" | grep -v "#recycle" | while read oldfile
	do
		newfile=${oldfile}bk
		rm -f "$newfile"
		charset=`chardetect "$oldfile" | awk -F":" '{print $2}' | awk -F" " '{print $1}'`
		echo "$charset" | grep -i "no"
			if [ $? -eq 0 ]
				then
					echo "################"
					echo "$oldfile"
					echo "charset analysis fail. skip convert"
				else
					echo "$charset" | grep -i "utf"
						if [ $? -eq 0 ]
			                then
								echo "################"
								echo "$oldfile"
				                echo "charset is UTF-8. skip convert"
		                else
								echo "#################"
								echo "$oldfile"
								echo "converting $charset to UTF-8"
								mv "$oldfile" "$newfile"
								piconv -c -f "$charset" -t utf8 "$newfile" > "$oldfile"
								rm -f "$newfile"
						fi
			fi
	done
