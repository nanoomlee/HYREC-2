# Makefile for building CAMB with HYREC-2
# By Antony Lewis

CC = gcc
AR = ar rvs
CCFLAG = -g -DCAMB -fPIC -DHYRECPATH=\"$(PWD)/\"
LDFLAG = -O2

%.o: %.c 
	$(CC) $(CCFLAG) -c $*.c -o $*.o

HYREC_SRC = hyrectools.o helium.o hydrogen.o history.o energy_injection.o 
HYREC_EXE = hyrec.o 

HYREC_SRC2 = hyrectools.c helium.c hydrogen.c history.c energy_injection.c hyrec.c

default: libhyrec.a

clean: 
	rm *.o

hyrec: $(HYREC_SRC2) 
	$(CC) $(LDFLAG) -o hyrec  $(HYREC_SRC2) -lm


libhyrec.a: $(HYREC_SRC)
	$(AR) $@ $(HYREC_SRC)
