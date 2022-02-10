all:worksheet11
worksheet11:worksheet11.o
	gcc -o worksheet11 worksheet11.o
worksheet11.o:worksheet11.s
	as -o worksheet11.o worksheet11.s
clean:
	rm -vf *.o
