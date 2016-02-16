LATEX=latex
DVIPDF=dvipdf
FILE=Auxiliar1
all:
	$(LATEX) $(FILE).tex
	$(DVIPDF) $(FILE).dvi

clean:
	rm -rf *.log *.aux *.pdf *.dvi


