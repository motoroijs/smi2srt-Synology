#!/bin/sh

# convert smi to ko.srt
# if <body> include : smi2srt by "George Shuklin"
# if <body> doesn`t include : smi2srt by axfree npm
# sudo npm install smi2srt -g

targetdir='/volume1/video/해외영화'
targetdir2='/volume1/video/4K UHD (2160p)'
smidir='/volume1/homes/user/script/smi2srt'

find "$targetdir" "$targetdir2" -name "*.smi" | grep -v "@eaDir" | grep -v "#recycle" | while read filename
    do
		# sort <body> contain
		grep -i "<body>" "$filename"
		if [ $? -eq 0 ]
			then
				# include <body>
				echo "$filename" >> $smidir/grep_list
				# doesn`t include <body>
			else
				echo "$filename" >> $smidir/grep_notlist
		fi
	done

		# convert include <body> in subtitles
	while read oldfile
		do
			newfile=${oldfile%smi}ko.srt
			    if [ -f "$newfile" ]
			        then
				        echo "$oldfile" "Skip!!"
				    else
				        $smidir/smi2srt "$oldfile" "$newfile"
				        echo "$oldfile => $newfile" converted
						# remove origin file
				        rm -f "$oldfile"
			    fi
		done < $smidir/grep_list

       # convert doesn`t include <body> in subtitles
	while read oldfile2
		do
			newfile2=${oldfile2%smi}ko.srt
				if [ -f "$newfile2" ]
					then
						echo "$oldfile2" "Skip!!"
					else
						/usr/local/bin/smi2srt -n "$oldfile2"
						echo "$oldfile2 => $newfile2" converted
						# remove origin file
						rm -f "$oldfile2"
				fi
		done < $smidir/grep_notlist

sleep 1
# remove smi file list
rm -f $smidir/grep_*list
