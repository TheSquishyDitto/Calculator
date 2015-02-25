%{

#include <stdio.h>
#include "y.tab.h"

%}

%%

[0-9]+																		{printf("NUMBER\n");};  
[+\-*/%]																	{printf("OPERATION\n");};
("abs"|"sin"|"cos"|"sqrt"|"log"|"log10"|"exp"|"pow")"\n" 					{printf("FUNCTION\n");};
\n	  																								;
[ \t]+ 																								;
.																	        { yyerror();  }

%%

int yywrap(void)
{
 return 0;
}

