TEX_NAME=eselaw2008
BIB_NAME=biblio

TEX_FILE=$(TEX_NAME).tex
BIB_FILE=$(BIB_NAME).bib

all: view_pdf

push:
	@echo 'Pushing commits to repository'
	git pull origin master
	git push origin master
	
commit: generate_pdf
	@echo 'Commiting to git repository'
	git commit -a -m "$(COMMENT)"

view_pdf: generate_pdf
	@echo 'Opening generated PDF file'
	open $(TEX_NAME).pdf

generate_pdf: $(TEX_FILE) $(BIB_FILE)
	@echo 'Generating resulting PDF'
	pdflatex $(TEX_NAME)
	bibtex $(TEX_NAME)
	pdflatex $(TEX_NAME)
	pdflatex $(TEX_NAME)

clean:
	rm -Rf $(TEX_NAME).{aux,rel,log,out,blg,bbl,pdf} *~
    
