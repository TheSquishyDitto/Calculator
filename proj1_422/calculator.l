%{

#include <stdio.h>
#include "y.tab.h"

%}

%%


[0-9]+													return NUMBER;  
\+ | "-" | "*" | "%" | "/"								return OPERATOR;
abs | sin | cos | sqrt | log | log10 | exp | pow 		return FUNCTION;
\n	  													;
[ \t]+ 													;

%%

int main(void)
{
 yyparse();
 return 0;
}

int yywrap(void)
{
 return 0;
}

int yyerror(void)
{
  printf("Error\n");
  exit(1);
}