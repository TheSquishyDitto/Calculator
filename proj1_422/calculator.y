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