%{

#include <stdio.h>
#include "y.tab.h"

%}

%%

(-?"."?[0-9]+|-?[0-9]+"."[0-9])												{yylval = atof(yytext); return NUMBER;}; 
[+\-*/%]																	{return *yytext;};
("abs"|"sin"|"cos"|"sqrt"|"log"|"log10"|"exp"|"pow") 						{return FUNCTION;};
\n	  																								;
[ \t]+ 																								;
.																	        { yyerror();  }

%%

int yywrap(void)
{
 return 0;
}

