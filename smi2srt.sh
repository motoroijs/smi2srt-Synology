#!/bin/sh

#convert smi to ko.srt
targetdir='/volume1/video/해외영화'
targetdir2='/volume1/video/해외시리즈'
smidir='/volume1/homes/yklovett/script/smi2srt'

find $targetdir $targetdir2 -name "*.smi" | grep -v @eaDir | while read oldfile
	do
	  newfile=${oldfile%smi}ko.srt
		if [ -f "$newfile" ]
			then
		        	echo "$oldfile" "Skip!!"
		else
        		echo "$oldfile => $newfile" converted
			$smidir/smi2srt "$oldfile" "$newfile"
			rm -f "$oldfile"
		fi
	done
