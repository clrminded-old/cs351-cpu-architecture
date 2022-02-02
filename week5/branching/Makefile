all:branch
branch:branch.o
	gcc -o branch branch.o
branch.o:branch.s
	as -o branch.o branch.s
clean:
	rm -vf *.o
