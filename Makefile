

all:

TEXBIN=/usr/texbin

PATH:=${TEXBIN}:${PATH}


generated/%.pdf : %.tex generated
	${TEXBIN}/xelatex -output-directory generated $< &&\
	${TEXBIN}/xelatex -output-directory generated $<

generated ::
	mkdir -p $@
