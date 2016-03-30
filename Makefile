TEXFILES=xenomai-howto.tex
TARGET=xenomai-howto.pdf

.PHONY : spellcheck show

all: $(TARGET)

$(TARGET): $(TEXFILES) $(IMAGES)
	pdflatex -shell-escape $<

force:
	pdflatex -shell-escape $(TEXFILES)

bibtex:
	pdflatex -shell-escape $(TEXFILES) && bibtex $(TEXFILES:.tex=.aux) && pdflatex -shell-escape $(TEXFILES) && pdflatex -shell-escape $(TEXFILES)

spellcheck:
	aspell -t check $(TEXFILES)

show:
	xdg-open $(TARGET)

clean:
	rm -f *.log *.aux *.bbl *.blg

cleanall: clean
	rm -f $(TARGET)
