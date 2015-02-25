%token NUMBER FUNCTION OPERATOR

%%

program: 
        operator number
        ;

number:     
        NUMBER     { printf("NUMBER\n");   }
        ;
operator:    
        OPERATOR    { printf("OPERATOR\n"); exit(0);}
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