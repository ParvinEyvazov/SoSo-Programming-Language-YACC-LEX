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


## BNF
Let`s see some examples.

```bash
<if then statement>::= if ( <expression> ) <statement>

<if then else statement>::= if ( <expression> ) <statement no short if> else <statement>

<switch statement> ::= switch ( <expression> ) <switch block>

<switch block> ::= { <switch block statement groups>? <switch labels>? }

<switch block statement groups> ::= <switch block statement group> | <switch block statement groups> <switch block statement group>

<switch block statement group> ::= <switch labels> <block statements>

<switch labels> ::= <switch label> | <switch labels> <switch label>

<switch label> ::= case <constant expression> : | default :

<while statement> ::= while ( <expression> ) <statement>

<while statement no short if> ::= while ( <expression> ) <statement no short if>.

<for statement> ::= for ( <for init>? ; <expression>? ; <for update>? ) <statement>

<for statement no short if> ::= for ( <for init>? ; <expression>? ; <for update>? ) <statement no short if>

<boolean literal> ::= true | false

<non zero digit> ::= 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

<string literal> ::= " <string characters>?"
```



