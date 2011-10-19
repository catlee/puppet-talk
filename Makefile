index.html: index.html.in *.pp
	python buildpage.py $< $@
