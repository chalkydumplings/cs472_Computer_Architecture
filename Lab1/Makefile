TARGET 		= my_frexp
SRC_FILENAME	= my_frexp
TARGET2		= feature_extraction
SRC2_FILENAME	= feature_extraction

ASSIGNMENT_NAME	= cs472_LAB1_bridgewd_philliry

LATEX_FILENAME	= cs472_LAB1_bridgewd_philliry
FLAGS  		=
LIBS   		=

default: compile latex run

compile: $(SRC_FILENAME).c
	gcc $(FLAGS)  $(SRC_FILENAME).c $(LIBS) -o $(TARGET)
	gcc $(FLAGS) $(SRC2_FILENAME).c $(LIBS) -o $(TARGET2)

latex: $(LATEX_FILENAME).tex
	pdflatex $(LATEX_FILENAME).tex
	
run: 
	$(info ************************RUNNING********************************)
	./my_frexp 
	./feature_extraction t

tar:
	tar cvf $(ASSIGNMENT_NAME).tar.bz2 $(LATEX_FILENAME).tex  Makefile \
		$(SRC_FILENAME).c  $(SRC2_FILENAME).c 

clean:
	rm $(TARGET) *_results $(LATEX_FILENAME).aux $(LATEX_FILENAME).log \
		$(LATEX_FILENAME).out $(LATEX_FILENAME).toc \
		$(LATEX_FILENAME).synctex.gz $(LATEX_FILENAME).pdf
