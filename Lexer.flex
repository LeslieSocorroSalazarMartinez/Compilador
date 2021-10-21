package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n,\m]+
%{
    public String lexeme;
%}
%%
MIENTRAS |
PARA |
LEER |
INICIO |
ESCRIBIR |
FIN {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return OperadorAsignacion;}
"+" {return OperadorAritmeticoSuma;}
"-" {return OperadorAritmeticoResta;}
"*" {return OperadorAritmeticoMultiplicacion;}
"/" {return OperadorAritmeticoDivision;}
"<" {return OperadorRelacionalMenorQue;}
">" {return OperadorRelacionalMayorQue;}
"==" {return OperadorRelacionalIgualA;}
">=" {return OperadorRelacionalMenorIgualQue;}
"<=" {return OperadorRelacionalMayorIgualQue;}
"!=" {return OperadorRelacionalNoIgual;}
O {return OperadorLogicoAlgunaVerdadera;}
Y {return OperadorLogicoTodosVerdaderos;}
NO {return OperadorLogicoCambioVerdaderoFalso;}
XOR {return OperadorLogicoUnaVerdadera;}
";" {return OperadorDelimitadorPuntoYComa;}
"()" {return OperadorDelimitadorParentesis;}
"," {return OperadorDelimitadorComa;}
VERDADERO {return  ValoresBooleanosV;}
FALSO {return  ValoresBooleanosF;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}

