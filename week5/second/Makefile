all:second
second:second.o
	gcc -o second second.o
second.o:second.s
	as -o second.o second.s
clean:
	rm -vf *.o
