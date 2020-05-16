#  SoSo  Programming Language 

Project group members: Parvin Eyvazov
Name of your programming language : SoSo

## What is SoSo for?
This language is for Cryptography. 
There are 3 main Variable in the language:
```java
int crypto_initial_value;
int crypto_last_value;
int crypto_key;
```
and 1 main function:
```java
cryptography(INTEGER);
```
Program uses "cryptography()" function. This is a default function. (It called "CRYPTOGRAPHY" in lexical analyasis.)

## How It works?
I did not make any makefile. I wanted to show the steps one-by-one.

```bash
computer$  ls
soso.l   soso.l

computer$  lex soso.l
computer$  ls
lex.yy.c soso.l   soso.l

computer$  yacc -d soso.y
computer$  ls
lex.yy.c  soso.l  soso.l  y.tab.c  y.tab.h

computer$  gcc  lex.yy.c  y.tab.c -ll
computer$  ./a.out <myprogram.so

```
"begin" is a keyword of starting program.

Then a.out file has been created
We have "myfile.so" file that contains my language codes.

## Explaining ot the syntax of your language
Program is starting with "begin" and stop or exit with "end" command.
```bash
begin
.
.
.
.
end
```
There is some initial values like crypto_key, crypto_initial_value, crypto_last_value, createRandomNumber.
Function CRYPTOGRAPHY take the assigning value and showed "encrypted" value.

Also we can write comments using "//" and this written text is not going to readed by computer.
For example:
```bash
begin
a=97;
//this is comment part
print(a);
end
```
Output will be
```bash
printing : 97
```
## Conditional statements
As a conditional statement SoSo has "If" statement.
```bash
begin
//AND in if statement
a=true;
b=true;
if(a&b){
print(1);
}
end
```
Output will be
```bash
printing : 1
```

## OR

```bash
begin
//OR in if statement
a=false;
b=true;
if(a|b){
print(1);
}
end
```
Output will be
```bash
printing : 1
```
LEX part of IF statement.
```bash
if              return IF;
```

YACC part of IF statement.
```bash
if:
        IF '(' conditions ')' '{' statement '}' {if($3==1)$$=$6;}
        |IF '(' conditions ')' '{' statement '}' ELSE'{' statement '}' {if($3==1)$$=$6; else $$=$10;}
        ;
```

## Loops 
As loops, SoSo has while loop.

LEX part of WHILE statement.
```bash
while           return WHILE;
```

YACC part of WHILE statement.
```bash
while:
        WHILE '(' conditions ')' '{' statement '}' {if($3==1)$$=$6;}
        ;
statement: exp ';'{$$=$1;}
        |CHAR '=' exp ';'
        |print
        |cryptography
        |while
        |if
        |exit_command {exit(0);}
        ;
```
## Error
Using yyerror in the YACC, SoSo can handle the errors.
```bash
//show error
void yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
        }
        
        int main()
        {       yyparse();
                yylex();
             return 0;
        }
```
 
 ## YACC Design
Everything start from function. Function can be statement.
```bash
func:func statement
        |statement 
        ;
```

Statement can be :
```bash
statement: exp ';'
        |CHAR '=' exp ';'
        |print
        |cryptography
        |while
        |if
        |exit_command
        ;
```
Exp can be:
```bash
exp:
        exp ADD term 
        |exp SUBTRACT term 
        |term 
        ;
```

Term can be:
```bash
term:
        term MULTIPLY factor
        |term DIVIDE factor
        |factor
        ;
```

Factor can be
```bash
factor:
        '(' exp ')'
        |CHAR 
        |DIGITS
        ;
```

Also there are conditions. Conditions can be:
```bash
conditions:
        condition
        |condition AND conditions
        |condition OR conditions
        ;
```
and condition can be:
```bash
condition:
         CHAR
         |CHAR EQ CHAR
         |CHAR NE CHAR
         |CHAR LE CHAR
         |CHAR GE CHAR
         ;
```








## BNF
Let`s see some examples.

```bash
<if then statement>::= if ( <expression> ) <statement>

<if then else statement>::= if ( <expression> ) <statement no short if> else <statement>

<while statement> ::= while ( <expression> ) <statement>

<while statement no short if> ::= while ( <expression> ) <statement no short if>.

<non zero digit> ::= 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

<string literal> ::= " <string characters>?"
```



