##
# Compiling Analysis Papers
#

PAPER ?=

all: $(PAPER).pdf

$(PAPER).pdf: $(PAPER).tex bibliography.bib
	pdflatex -interaction=nonstopmode $(PAPER).tex
	bibtex $(PAPER)
	pdflatex -interaction=nonstopmode $(PAPER).tex
	pdflatex -interaction=nonstopmode $(PAPER).tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc

distclean:
	rm -f *.pdf

# end
