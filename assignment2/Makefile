all: nestedloop
nestedloop: nestedloop.o
	gcc -o nestedloop nestedloop.o
nestedloop.o: nestedloop.s
	as -o nestedloop.o nestedloop.s
clean:
	rm -vf *.o
