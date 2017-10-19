list=$(find . -name "*.tex")


for i in  $list; do
	path_readme="$(echo $i | rev | cut -d '/' -f 1 --complement | rev)"
	path_readme="$path_readme/README.md"
	pandoc $i -o $path_readme

	cat $path_readme | tr -d '\\' > tmp
	cat tmp | sed -e '/image/d' > $path_readme
	rm -f tmp
done
