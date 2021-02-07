
%{
#include <stdio.h>
#include <math.h>

int yylex();
int yyerror(char *s);
void tabulation();

int level = 0;

%}

%token OPEN_START_TAG
%token OPEN_END_TAG
%token CLOSE_TAG
%token SINGULAR_TAG
%token QUOTE
%token ATTRIBUTE
%token ASSIGNMENT
%token ATTRIBUTE_CONTENT
%token CONTENT

%start start_tag
%type <name> OPEN_START_TAG
%type <name> OPEN_END_TAG
%type <name> ATTRIBUTE
%type <string> CONTENT

%union {
	char name[20];
	char string[100];
}

%%

start_tag:
   	OPEN_START_TAG {
  		++level;
   	} tag_attribute
;

tag_attribute:
	ATTRIBUTE CONTENT
	attribute_content QUOTE tag_attribute
	| CLOSE_TAG tag_content
	| SINGULAR_TAG {
		--level;
	}
;

attribute_content:
	 | CONTENT attribute_content
;

tag_content:
	start_tag tag_content
	| CONTENT tag_content
	| tag_end
;

tag_end:
	OPEN_END_TAG CLOSE_TAG {
		--level;
	}
;

%%

void tabulation()
{
	for(int i = 0; i < level * 4; ++i) {
        	printf(" ");
        }
}
int yyerror(char *s)
{
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main()
{
    yyparse();
    return 0;
}
