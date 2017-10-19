list=$(find . -name "*.tex")


for i in  $list; do
	path_readme="$(echo $i | rev | cut -d '/' -f 1 --complement | rev)"
	path_readme="$path_readme/README.md"
	pandoc $i -o $path_readme

	cat $path_readme | tr -d '\\' > tmp.txt
	cat tmp.txt | sed -e '/image/d' > $path_readme
	cat $path_readme | sed -e 's/{[^\n]*}//g' > tmp.txt
	mv tmp.txt $path_readme
done
