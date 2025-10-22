SVGS := $(shell find src -iname '*.svg')
TYPS := $(shell find src -iname '*.typ')
PDFS := $(TYPS:%.typ=%.pdf)

.PHONY := all clean

all: $(PDFS)
	cd src && latexmk -pdf -pdflatex='pdflatex' -interaction=nonstopmode -output-directory=../out main.tex

%.pdf: %.svg
	python3 convert-svg.py $<

%.pdf: %.typ
	typst compile $<

clean:
	rm -rf out
	find src -name '*.pdf' -delete
