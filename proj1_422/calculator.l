%{

#include <stdio.h>
#include <stdlib.h>
#include "calculator.tab.h"

%}

integer 	[0-9]+
number		{integer}|({integer})?"."{integer}|{integer}"."({integer})?

%%

[0-9]+																		{yylval.num = atof(yytext); return NUMBER;}; 
[ \t\n] 																							;
.																	        { /*yyerror();*/  }

%%

int yywrap(void)
{
 return 0;
}

