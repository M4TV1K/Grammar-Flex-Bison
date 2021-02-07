%{

#include <stdio.h>
#include <string.h>
#include "test.tab.h"

%}

OPEN_START_TAG          "<"[a-z]+[1-6]?
OPEN_END_TAG            "</"[a-z]+[1-6]?
ATTRIBUTE               [a-z]+[=]["]
CONTENT                 [a-zA-Z0-9!?@#$%^&*()';,.:\/-]+

%%

{OPEN_START_TAG}        { sscanf(yytext, "%s", yylval.name); return (OPEN_START_TAG); }
{OPEN_END_TAG}          { sscanf(yytext, "%s", yylval.name); return (OPEN_END_TAG); }

"\""                    { return (QUOTE); }
"/>"                    { return (SINGULAR_TAG); }
">"                     { return (CLOSE_TAG); }

{ATTRIBUTE}	            { sscanf(yytext, "%s", yylval.name); return (ATTRIBUTE); }
{CONTENT}	            { sscanf(yytext, "%s", yylval.string); return (CONTENT); }
[ \t\n]+		        { /* empty */ }
.                       { printf("\nERROR"); return(EOF); }

%%
