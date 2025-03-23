%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER
%token PLUS MINUS TIMES DIVIDE
%token LPAREN RPAREN

%left PLUS MINUS
%left TIMES DIVIDE

%%

input:
    /* empty */
    | input line
    ;

line:
    expr '\n'    { printf("Result: %d\n", $1); }
    | '\n'       { /* Do nothing on empty line */ }
    ;

expr:
    expr PLUS expr     { $$ = $1 + $3; }
    | expr MINUS expr  { $$ = $1 - $3; }
    | expr TIMES expr  { $$ = $1 * $3; }
    | expr DIVIDE expr {
        if ($3 == 0) {
            printf("Error: Division by zero!\n");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
      }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER             { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Parse error: %s\n", s);
}

int main(void) {
    printf("Enter arithmetic expressions:\n");
    yyparse();
    return 0;
}
