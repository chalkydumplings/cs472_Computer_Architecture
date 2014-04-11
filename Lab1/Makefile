TARGET = my_frexp
SRC    = my_frexp
TARGET2= feature_extraction
SRC2   = feature_extraction

LATEX  = cs472_LAB1_bridgewd_philliry
FLAGS  =  
LIBS   =

default: compile latex run

compile: $(SRC).c
	gcc $(FLAGS) $(SRC).c $(LIBS) -o $(TARGET)
	gcc $(FLAGS) $(SRC2).c $(LIBS) -o $(TARGET2)

latex: $(LATEX).tex
	pdflatex $(LATEX).tex
	pdflatex $(LATEX).tex
	
run: 
	./my_frexp 
	./feature_extraction

clean:
	rm $(TARGET) *_results $(LATEX).aux $(LATEX).log $(LATEX).out $(LATEX).toc $(LATEX).synctex.gz $(LATEX).pdf

