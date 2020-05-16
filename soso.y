%{
void yyerror(char*);
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
int yylex(void);
%}

%token START END IF ELSE WHILE PRINT
%token DIGITS
%token CHAR
%token CRYPTOGRAPHY CRYPTO_KEY CRYPTO_INITIAL_VALUE CRYPTO_LAST_VALUE CREATE_RANDOM_NUMBER
%token exit_command
%left MULTIPLY ADD DIVIDE SUBTRACT
%left AND OR LE GE EQ NE
%start start

%%

start: START func END
        ;
func:func statement
        |statement  {printf("OK");}
        ;

statement: exp ';'{$$=$1;}
        |CHAR '=' exp ';'
        |print
        |cryptography
        |while
        |if
        |exit_command {exit(0);}
        ;
/* writing inside of functions seperately */
print:
        PRINT '(' exp ')' ';' {printf("printing : %d\n", $3);}
        ;

cryptography:
        CRYPTOGRAPHY '(' exp ')' ';' {printf("encrypted value : %d\n", $3);}
        ;

exp:
        exp ADD term {$$=$1+$3;}
        |exp SUBTRACT term {$$=$1-$3;}
        |term {$$=$1;}
        ;
term:
        term MULTIPLY factor{$$=$1*$3;}
        |term DIVIDE factor{$$=$1/$3;}
        |factor{$$=$1;}
        ;
factor:
        '(' exp ')' {$$=$2;}
        |CHAR {$$=$1;}
        |DIGITS
        ;

while:
        WHILE '(' conditions ')' '{' statement '}' {if($3==1)$$=$6;}
        ;
if:
        IF '(' conditions ')' '{' statement '}' {if($3==1)$$=$6;}
        |IF '(' conditions ')' '{' statement '}' ELSE'{' statement '}' {if($3==1)$$=$6; else $$=$10;}
        ;
conditions:
        condition
        |condition AND conditions
        |condition OR conditions
        ;
        condition:
                CHAR
                |CHAR EQ CHAR
                |CHAR NE CHAR
                |CHAR LE CHAR
                |CHAR GE CHAR
                ;

        %%

        void yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
        }
        int main()
        {       yyparse();
                yylex();
             return 0;
        }
