all: nestedloop sort
nestedloop: nestedloop.o
	gcc -o nestedloop nestedloop.o

sort: sort.o
	gcc -o sort sort.o

nestedloop.o: nestedloop.s
	as -o nestedloop.o nestedloop.s

sort.o: sort.s
	as -o sort.o sort.s


clean:
	rm -vf *.o
