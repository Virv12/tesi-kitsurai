SVGS := $(shell find src -iname '*.svg')
TYPS := $(shell find src -iname '*.typ')
PDFS := $(TYPS:%.typ=%.pdf)

.PHONY := all typst

all: $(PDFS)
	cd src && latexmk -pdf -pdflatex='lualatex' -e '$$max_repeat=15' -interaction=nonstopmode -output-directory=../out --shell-escape -f main.tex

%.pdf: %.svg
	python3 convert-svg.py $<

%.pdf: %.typ
	typst compile $<
