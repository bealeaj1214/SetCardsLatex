

all::

TEXBIN=/usr/texbin
PDFLATEX:=${TEXBIN}/xelatex


PATH:=${TEXBIN}:${PATH}
export PATH

BASE_DIR=.

TEXINPUTS:=.:${BASE_DIR}/tex:

export TEXINPUTS
export PDFLATEX

%.pdf :: %.tex
	texi2dvi -b -p --tidy --build-dir=generated $< 

generated/%.pdf : %.tex generated
	${TEXBIN}/xelatex -output-directory generated $< &&\
	${TEXBIN}/xelatex -output-directory generated $<


generated ::
	mkdir -p $@


MoycullenSet.pdf :: MoycullenSet.tex generated tex/panel1.tex tex/panel2.tex

NorthKerry.pdf :: NorthKerry.tex generated tex/northKerry1.tex tex/northKerry2.tex

all:: MoycullenSet.pdf
