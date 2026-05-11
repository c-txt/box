#!/bin/bash
# Script to create tree:
find . -name index.html -type f -delete
# deletes all the index files in all the sub-foldersin the tree
find .  -path "./.git" -prune -o -execdir bash -c 'tree -H ./ > fulltree.cj' \;
# creates the full tree except in git
find .  -path "./.git" -prune -o -execdir bash -c 'tree -d -H ./ > folders1.cj' \;
# creates the tree of all folders -d except in git
find . -path "./.git" -prune -o -execdir bash -c 'echo "<html><body><h3>Back to Branch: </h3><a href="../">${PWD##*/}</a> | <p><hr></body></html>" > navheader.cj' \;
# appends curent folder and back folder path
find . -path "./.git" -prune -o -execdir bash -c 'cat navheader.cj folders1.cj > folders.cj' \;
# concatenates the folder1 and navheader trees
find . -name folders.cj -type f -execdir sed -iE 's/Directory Tree/Stems/' folders.cj \;
# Replaces the word Directory tree with folder in tree
find . -name fulltree.cj -type f -execdir sed -iE 's/Directory Tree/Leaves/' fulltree.cj \;
# Replaces the word Directory tree with Files in Branch
find . -path "./.git" -prune -o -execdir bash -c 'cat folders.cj fulltree.cj > index.html' \;
# concatenates the folder and file trees
rm index.html
# removes the multiple trees cocatenated in the root folder
tree -d -H ./ > index.html
sed -iE 's/Directory Tree/Branches/' index.html
# recreates the tree in the root folder
find . -name index.html -type f -execdir sed -iE 's/\.md/\.html/' index.html \;
# Replaces the word .md with .html in all the index files
# ***
find . -name index.html -type f -execdir sed -iE '/tree v2.3.2 © 1996 - 2026 by Steve Baker and Thomas Moore/d' index.html \;
find . -name index.html -type f -execdir sed -iE '/HTML output hacked and copyleft © 1998 by Francesc Rocher/d' index.html \;
find . -name index.html -type f -execdir sed -iE '/JSON output hacked and copyleft © 2014 by Florian Sesser/d' index.html \;
find . -name index.html -type f -execdir sed -iE '/2001 by Kyosuke Tokoro/d' index.html \;
# Replaces the tree program credits in all the index files
# ***
find . -name fulltree.cj -type f -delete
find . -name folders.cj -type f -delete
find . -name folders1.cj -type f -delete
find . -name navheader.cj -type f -delete
find . -name folders.cjE -type f -delete
find . -name fulltree.cjE -type f -delete
find . -name index.htmlE -type f -delete
# deletes all the temp files
find . -path "./.git" -prune -o -name "*.md"  -exec bash -c 'printf "\n\n[<< Back to Navigation](../)" >> "{}"' \;
# Appends a navigation link to every md file









