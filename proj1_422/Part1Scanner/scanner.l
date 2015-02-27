%{

#include <stdio.h>
#include "y.tab.h"

%}

integer 	[0-9]+
number		{integer}|({integer})?"."{integer}|{integer}"."({integer})?
function	"abs"|"sin"|"cos"|"sqrt"|"log"|"log10"|"exp"|"pow"

%%
{number}																	{ printf("NUMBER\n");   	}; 
[+\-*/%]																	{ printf("OPERATOR\n"); 	};
{function}/"("{number}")"													{ printf("FUNCTION\n"); 	};
["("")"]																	{ /* ignore parentheses for this part */ ;};
[ \t\n]																		{ /* ignore space */ ;		};
.																	        { printf("INVALID\n");  	};

%%

int yywrap(void)
{
 return 0;
}

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
}

main(int argc, char **argv)
{
 yylex();
}