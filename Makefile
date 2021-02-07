default:
	flex -l src/test.l
	bison -dv src/test.y
	gcc -o test test.tab.c lex.yy.c -ll
	./test