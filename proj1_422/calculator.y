%{
	//#define YYSTYPE double
	#include <math.h>
	#include <stdio.h>
	#include "calculator.tab.h"
%}

%union {
	double num;
};

%start program
%token <num> NUMBER
%left '-' '+'
%left '*' '/'
%left NEG
%type <num> expression

%%

program: /* nothing */
        | program answer
;
		
answer: '\n'
		| expression '\n' { printf ("\t%.10g\n", $1); }
;

expression: NUMBER							{$$ = $1;	  }
			| '-' expression %prec NEG		{$$ = -$2;	  }
			| expression '+' expression 	{$$ = $1 + $3;}
			| expression '-' expression		{$$ = $1 - $3;}
			| expression '*' expression		{$$ = $1 * $3;}
			| expression '/' expression		{$$ = $1 / $3;}
;
		 
%%

int main(void)
{
 yyparse();
 return 0;
}

int yyerror(void)
{
  printf("INVALID\n");
  return(1);
}