%{
#include<stdio.h>
#include<stdlib.h>
#include"y.tab.h"
void yyerror(char *);
int crypto_initial_value;
int crypto_last_value;
int crypto_key;
static void cryptography();
%}

digits [0-9]+
alf [a-zA-Z]+


%%
"//".*			{/* consume //-comment */}

begin           return START;
end             return END;
"print"     return PRINT;

"cryptography"  return CRYPTOGRAPHY;

"crypto_key"            return CRYPTO_KEY;

"crypto_initial_value"  return CRYPTO_INITIAL_VALUE;

"crypto_last_value"     return CRYPTO_LAST_VALUE;

"createRandomNumber"    return CREATE_RANDOM_NUMBER;

"exit"  return exit_command;

{digits}        {
                yylval = atoi(yytext);
                return DIGITS;
                }

while           return WHILE;
if              return IF;


else            return ELSE;
{alf}           {
                yylval = yytext[0];
                return CHAR;
                }

\*              return MULTIPLY;
\+              return ADD;
\/              return DIVIDE;
\-              return SUBTRACT;

"<="            return LE;
">="            return GE;
"=="            return EQ;
"!="            return NE;

"&"             return AND;
"|"             return OR;
";"             return *yytext;
"="             return *yytext;
"("             return *yytext;
")"             return *yytext;
"{"             return *yytext;
"}"             return *yytext;

[ \t\n]         ;

%%

int yywrap()
{
return 1;
}
//.             {yyerror("syntax error");}

