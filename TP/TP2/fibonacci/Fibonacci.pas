// auteur : etudiant Djebien Tarik
// date   : octobre 2009
// objet  : Suite de Fibonacci


{     La suite des nombres de Fibonacci est une suite de nombres entiers naturels que l'on definit en donnant
ses deux premiers termes
                                                    F0   =    0             (1)                             
                                                    F1   =    1             (2)
                                                   

et en définissant les termes d'indice n ≥ 2 par la relation de récurrence
	
													Fn  = Fn−1 + Fn−2		(3)
    
Vous allez programmer le calcul des termes de cette suite de deux façons diférentes.
                
Question 12 : Calculez  à la main  les termes de cette suite pour n compris entre 0 et 10.

n    | 0 | 1 | 2 | 3 | 4 | 5 | 6 |  7  |  8  |  9  |  10  |
-----------------------------------------------------------
F(n) | 0 | 1 | 1 | 2 | 3 | 5 | 8 | 13  |  21 |  34 |  55  |

} 

 

program fibonacci;
uses crt;
var i : integer;

//question 13
function fiborec(n:integer):integer;
begin
  case n of
    0 : fiborec := 0;
	1 : fiborec := 1;
  else 
    fiborec := fiborec(n-1) + fiborec(n-2)
  end;
end;//fiborec



//question 16
function fiboiter(n: integer):integer;
var 
    F0,F1,i,res : integer;

begin
  F0:=0;
  F1:=1;
  res:= 0;
  case n of
   0 : fiboiter := F0;
   1 : fiboiter := F1;
  else
    begin
      for i:= 2 to n do
        begin
          res:=(F0 + F1);
	      F0 := F1;
	      F1 := res;
        end;
    fiboiter:= res;
  end
  end; 
end;//fiboiter

 
begin
 clrscr;
 writeln('           EXERCICE API2 FIBONACCI            ');
 writeln;
 writeln;
 
 // question 14
 writeln('Utilisation de la fonction fiborec :');writeln;
 for i := 0 to 10 do
   writeln('F(',i,') = ',fiborec(i));
 
 //question 15
   writeln('F(20) = ',fiborec(20));
   writeln('F(30) = ',fiborec(30));
   writeln('F(40) = ',fiborec(40));
 //temp d'execution de F(40) relativement long.
 
  writeln;
  writeln('temp d''execution de F(40) relativement long.');
  writeln;
  writeln;
 
 //question 17
 writeln('Utilisation de la fonction fiboiter :');writeln;
 for i := 0 to 10 do
   writeln('F(',i,') = ',fiboiter(i));
 
 //question 18
   writeln('F(20) = ',fiboiter(20));
   writeln('F(30) = ',fiboiter(30));
   writeln('F(40) = ',fiboiter(40));
   writeln;
   writeln('temp d''execution de F(40) beaucoup plus rapide!');
   writeln;
   writeln;
   
   writeln('En effet on peut continuer avec :');
   writeln('F(41) = ',fiboiter(41));
   writeln('F(42) = ',fiboiter(42));
   writeln('F(43) = ',fiboiter(43));
   writeln('F(44) = ',fiboiter(44));
   writeln('F(45) = ',fiboiter(45));
   writeln('F(46) = ',fiboiter(46));
   writeln('F(47) = ',fiboiter(47));
   writeln('F(48) = ',fiboiter(48));
   writeln;
   writeln('On remarque que F47 <> F45 + F46 ');
   writeln;
   writeln('On aurait eu le meme default negatif dans le resultat avec fiborec');
   writeln('mais le temp d''execution serait encore plus long que F40 !');
   writeln('Pour l''explication, je pensais que cette anomalie etait due au fait');
   writeln('que fiboiter est de type integer et que les entiers de ce type en langage ');
   writeln('pascal sont limité et le depassement entrainerait le passage negatif mais');
   writeln('en modifiant integer en int64 qui augmente considerablement le nombre ');
   writeln('de chiffres possibles cela n''a pas changer au resultat final donc ');
   writeln('je ne sais pas je vous invite à me faire part de l''explication merci');
   write('Cordialement');
   
 repeat until keypressed;
 clrscr;
end.

{question 20 :

La recursivité est-elle réellement efficace en termes de temps de calcul?

Tout dépend de l'algorithme dans lequel cette récursivité est utilisée.
Pour estimer l'efficacité de cet usage, il est nécessaire d'évaluer la quantité
de calculs effectivement réalisés par une fonction ou une procedure récursive.

L'exemple de la suite de Fibonacci définie par :
Fn = Fn-1 + Fn-2 pour n >1 et F0 = 0, F1 = 1
illustre bien le paradoxe simplicité de programmation et efficacité de temps de calcul.

En effet, la definition de cette suite apparait bien sous forme recurrente,
 propice à une programmation utilisant le concept de récursivité. Il est donc
 tout à fait possible de transcrire immédiatement cette définition sous la forme
 d'une fonction récursive, comme cela a été fait durant cette partie du TP.
 
 Mais imaginons par exemple que le programme principal invoque le calcul de fiborec
 avec le parametre 5 et simulons les différentes opérations nécessaires au calcul.
 La premiere d'entre elles correspond à l'execution de F(5)= F(4)+F(3), qui invoque
 séparement le calcul de F(4)=F(3)+F(2) et de F(3)=F(2)+F(1).
 Le calcul de F(4) invoque alors celui de F(3) et de F(2) tandis que celui de
 F(3) invoque celui de F(2) et de F(1).
 Notons au passage que les mêmes termes sont parfois calculés deux fois.
 Au total, la fonction Fiborec est invoquée 15 FOIS!!!
 
 Il est sans doute beaucoup plus efficace de calculer ce terme F(5) et,
 d'une maniere encore plus générale, le terme F(n), pour n > 1, en 
 utilisant une simple iteration comme dans fiboiter.
 Dans cet algorithme, on appelle respectivement F0 et F1 les avant-dernier 
 et dernier termes précédents. A chaque passage dans la boucle, F est calculé
 comme la somme des deux termes précédents. Ensuite, le terme précédent devient
 l'avant dernier et le terme res qui vient d'etre calculé devient le précédent.
 
 Cet exemple montre bien qu'il existe des cas ou il vaut mieux se passer
 de la recursivité, notamment lorsque c'est la rapidité du calcul qui est
 recherchée.
	
}
