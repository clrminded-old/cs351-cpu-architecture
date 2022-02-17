all: function
function:function.o
	gcc -o function function.o
function.o:function.s
	as -o function.o function.s
clean:
	rm -rv *.o
