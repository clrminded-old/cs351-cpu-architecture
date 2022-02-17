all:array
array:array.o
	gcc -o array array.o
array.o: array1.s
	as -o array.o array1.s
clean:
	rm -vf *.o
