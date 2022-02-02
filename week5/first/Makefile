all:first
first:first.o
	gcc -o first first.o
first.o:first.s
	as -o first.o first.s
clean:
	rm -vf first *.o
