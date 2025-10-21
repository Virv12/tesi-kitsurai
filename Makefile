SVGS := $(shell find src -iname '*.svg')
TYPS := $(shell find src -iname '*.typ')
PDFS := $(TYPS:%.typ=%.pdf)

.PHONY := all clean

all: $(PDFS)
	cd src && latexmk -pdf -pdflatex='pdflatex' -e '$$max_repeat=15' -interaction=nonstopmode -output-directory=../out --shell-escape -f main.tex

%.pdf: %.svg
	python3 convert-svg.py $<

%.pdf: %.typ
	typst compile $<

clean:
	rm -rf out
	find src -name '*.pdf' -delete
