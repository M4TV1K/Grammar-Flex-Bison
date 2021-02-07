##Project description

There are two files in "src" folder
"test.l" represents flex, while
"test.y" represents bison.

## Compilation (works perfectly for Mac)

The "Makefile" is a special file that executes following code  
flex -l src/test.l  
bison -dv src/test.y  
gcc -o test test.tab.c lex.yy.c -ll   
./test
in order to compile executable test file.

## Execution
Just run Makefile in IntelliJ or execute commands above line by line.

## Test Cases
<html lang="en"><head><title>AUG HTML VALIDATOR</title><meta charset="UTF-8"/></head><body><div content="full" height="fit-content">xoxoxo<h1 style="color: red" height="120px">Hello, World!</h1> Blablabla <img src="aug.jpg" alt="Me passing AUG" /> blablablA <h2>oxoxo</h2>xoxoxo</div><ul><li>banana</li><li>apple</li><li>pineapple</li></ul></body></html>

## Further improvements
1. add more validation (like which tag could be singular and which not)

## QUESTION
My CONTENT regex still accepts only one word while I want it to accept one or more?