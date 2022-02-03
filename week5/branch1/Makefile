all:branch1
branch1:branch1.o
	gcc -o branch1 branch1.o
branch1.o:branch1.s
	as -o branch1.o branch1.s
clean:
	rm -vf *.o
