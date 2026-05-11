for n in *.md; do printf ""./${n%.md}"\n"; done > index3.txt
# The above creates a list of all md files prepended by ./ Unfortunately it also includes itself if index3.md so keep the filename as index3.txt; note that printf unlike echo does not automatically add a newline at end so it is explicitly added
while read -r line; do  printf "["$line"]""("$line")\n\n\n"; done < index3.txt > index4.txt
# The above creates a line with [./filename](./filename) format for each line of index3.txt in index4.txt
rm index3.txt
sed -iE "1s/^/#### Files:\n/" index4.txt
# Prepends the text Folders: to the beginning of the text
rm index4.txtE
# deletes the backup file created by the above sed command
echo "--------" >> index4.txt
# Appends a horizontal line to Index4.txt
find . -maxdepth 1 -type d -not -path '*/\.*' | sort > index1.txt
# The above creates a list of all subfolders prepended by ./ each on a new line
while read -r line; do  printf "| ["$line"]""("$line") | \n\n"; done < index1.txt > index2.txt
# The above creates a line with [./subfoldername](./subfoldername) format for each line of index2.txt
rm index1.txt
sed -iE '/(.)/d' index2.txt
# The above deletes the first line which would otherwise hold [.](.) andcreates an circular link going to the same folder
rm index2.txtE
# deletes the backup file created by the above sed command
sed -iE "1s/$/#### Folders:\n/" index2.txt
# Prepends the text Folders: to the beginning of the text
rm index2.txtE
# deletes the backup file created by the above sed command
echo "--------" >> index2.txt
# Appends a horizontal line to Index2.txt
cat index2.txt index4.txt >> index.md
# Joins the two files
sed -iE "/^$/d" index.md
# The above deletes all empty lines in index.md
sed -iE "1s/^/---\n/" index.md
# The above prepends "---" to the file so its recognized by Github pages; it also creates a backup of the input file which is removed by the next line
sed -iE 's/\[\.\//[/g' index.md
# The above removes the [. at the begining of each link in the index file; it also creates a backup of the input file which is removed by the next line
rm index.mdE
# deletes the backup file created by the above three sed commands
rm index2.txt
rm index4.txt

[<< Back to Navigation](../)