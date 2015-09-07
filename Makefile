LATEX=pdflatex -shell-escape
FILE=Auxiliar1.tex
all:
	$(LATEX) $(FILE)

clean:
	rm -rf *.log *.aux _minted* *.pdf


