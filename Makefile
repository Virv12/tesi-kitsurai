SVGS := $(shell fd '.*\.svg')
PDFS := $(SVGS:%.svg=%.pdf)

.PHONY := all

all: #$(PDFS)
	cd src && latexmk -pdf -pdflatex='lualatex' -interaction=nonstopmode -output-directory=../out --shell-escape -f main.tex

%.pdf: %.svg
	python3 convert-svg.py $<
