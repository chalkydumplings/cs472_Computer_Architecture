CC = gcc
CXX = gcpc
CFLAGS = -Wall -std=gnu99 -openmp -O2 -g -I.
CFLAGS_DEBUG = -Wall -std=gnu99 -openmp -O0 -g -I.
CXXFLAGS = -Wall -openmp -O3 -g
#overkill on the flags, but that doesn't hurt anything
#add current dir to libs for libjsmn.a
LDFLAGS = -lrt -lpthread -L. 
#replace this if you want to change the output name
TEX_TARGET = writeup

ASSIGNMENT_NAME = cs472_LAB3_bridgewd_philliry

# LaTeX related constants
HTML=main_html
#SRC=mt.h
SRC=writeup.tex

#any headers go here
INCLUDES = 

#any .c or .cpp files go here
SOURCE = 

#default is to compile and pdf
default: pdf
both: pdf html
	
#depends on all of you source and header files
compile: ${SOURCE} ${INCLUDES}
#this assumes you actually are linking all of the source files together
	${CC} ${CFLAGS} ${SOURCE} -o ${CTARGET} ${LDFLAGS}

debug: ${SOURCE} ${INCLUDES}
	${CC} ${CFLAGS_DEBUG} ${SOURCE} -o ${CTARGET} ${LDFLAGS} -DDEBUG

dvi: ${TEX_TARGET}.tex
#	pygmentize the input source file -- THIS NAME SHOULD BE SAFE
	pygmentize -f latex -o __${SRC}.tex ${SRC}
#	run latex twice to get references correct
	latex ${TEX_TARGET}.tex
#	you can also have a bibtex line here
#	bibtex $(TEX_TARGET).tex
	latex $(TEX_TARGET).tex
#	remove the pygmentized output to avoid cluttering up the directory
	rm __${SRC}.tex

ps: dvi
	dvips -R -Poutline -t letter ${TEX_TARGET}.dvi -o ${TEX_TARGET}.ps

pdf: ps
	ps2pdf ${TEX_TARGET}.ps
	rm *.dvi *.log *.out *.ps *.aux


html:
	cp ${TEX_TARGET}.tex ${HTML}.tex
	latex ${HTML}.tex
	latex2html -split 0 -noshow_section_numbers -local_icons -no_navigation -noinfo -noaddress ${HTML}

	sed 's/<BR><HR>//g' < ${HTML}/index.html > ${HTML}/index2.html
	mv ${HTML}/index2.html ${TEX_TARGET}.html
	rm ${HTML}.*
	rm -rf ${HTML}
	
run: 
	$(info ************************RUNNING********************************)
	./$(TARGET) 
	
tar:
	tar cvzf $(ASSIGNMENT_NAME).tar.bz2 avg_vector/*.asm \
		block_move/*.asm endianness_testing/*.asm\
		quad_func/*.asm


clean:
	rm ${TEX_TARGET}.dvi ${TEX_TARGET}.log ${TEX_TARGET}.out ${TEX_TARGET}.ps ${TEX_TARGET}.aux ${TEX_TARGET}.pdf ${CTARGET}
