all:worksheet10
worksheet10:worksheet10.o
	gcc -o worksheet10 worksheet10.o
worksheet10.o:worksheet10.s
	as -o worksheet10.o worksheet10.s
clean:
	rm -vf *.o
