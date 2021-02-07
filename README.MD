##Project description

Simple grammar written on flex and bison for pretty parsing the tag-structure (e.g. HTML, XML), 
without additional validation

## Compilation (works perfectly for Mac)

There are two files in "src" folder
"test.l" represents flex, while
"test.y" represents bison.

The "Makefile" is a special file that executes following code  
flex -l src/test.l  
bison -dv src/test.y  
gcc -o test test.tab.c lex.yy.c -ll   
./test
in order to compile executable test file.

## Execution
Just run Makefile in IntelliJ or execute commands above line by line.

## Further improvements
1. add more validation (open-close brackets are the same...)