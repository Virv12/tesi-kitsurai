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

ascii:
	find src -name '*.tex' -or -name '*.typ' | xargs grep --color --perl-regexp --line-number '[^\x00-\x7F]' || true

clean:
	rm -rf out
	find src -name '*.pdf' -delete
