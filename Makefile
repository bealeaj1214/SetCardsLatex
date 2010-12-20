

all::

TEXBIN=/usr/texbin

PATH:=${TEXBIN}:${PATH}

BASE_DIR=.

TEXINPUTS:=.:${BASE_DIR}/tex:

export TEXINPUTS

generated/%.pdf : %.tex generated
	${TEXBIN}/xelatex -output-directory generated $< &&\
	${TEXBIN}/xelatex -output-directory generated $<


generated ::
	mkdir -p $@


generated/MoycullenSet.pdf :: MoycullenSet.tex generated tex/panel1.tex tex/panel2.tex


all:: generated/MoycullenSet.pdf