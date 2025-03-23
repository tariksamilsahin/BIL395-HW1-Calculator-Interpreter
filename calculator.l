%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
\n          { return '\n'; }
[ \t]+      { /* Ignore whitespace */ }
.           { printf("Invalid character: %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}
