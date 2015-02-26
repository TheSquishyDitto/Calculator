%token NUMBER FUNCTION OPERATOR
%left '+' '-'
%left '*' '/'

%%

program: /* nothing */
        | program answer '\n'
        ;
		
answer: expression {printf("%f\n", $1);}
		;

expression: NUMBER
		| '-' expression 				{$$ = -$2;}
        | expression '+' expression 	{$$ = $1 + $3;}
		| expression '-' expression		{$$ = $1 - $3;}
		| expression '*' expression		{$$ = $1 * $3;}
		| expression '/' expression		{$$ = $1 / $3;}
		| expression '%' expression		{$$ = $1 % $3;}
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