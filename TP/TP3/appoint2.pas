// auteur : DJEBIEN TARIK - MIMP 32 
// date   : 12/11/2009
// objet  : EXO 3   TP3-API2

//3. On complique un peu avec trois pieces 
{
	PIECES = (1,2,3)

On a :

    ----------------------------------------------------------------------------
	|   n  ||  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10  |
	----------------------------------------------------------------------------
    | C(n) ||  1  |  1  |  2  |  3  |  4  |  5  |  7  |  8  |  10 |  12  |  14 |
    ----------------------------------------------------------------------------

   Il peut être utile d’introduire une fonction auxiliaire 
   avec un paramètre supplémentaire p qui donne le nombre d’appoints 
   avec des pièces de valeur p au maximum. 
   
   On désigne par c' cette fonction. 
   Ainsi, c'(n, p) = nbre de façons de faire l’appoint avec des pièces ≤ p,
   avec p compris entre 1 et 3, on a par exemple c(n) = c'(n, 3).


}
//3.1
{
 Il existe un unique C(n) tel que n = 0.
 En effet, la seule et unique maniere de payer la somme de 0 centimes
 est tout simplement de ne rien donner commes pieces.
 
 donc C'(0,p)=1 pour tout p appartenant à PIECES.
}

{
Remarque:
Fixons n appartenant à N(ensemble des entiers naturels),
on a alors pour tout n >= 1 ,  n-1 <= n <= n+1 :
    N = [0,1,2,3,...,n-1,n,n+1,....]
<=> N = [0,1,1+1,1+1+1,....,n,n+1,(n+1)+1,....]
donc pour tout n >= 1, n = somme (1) avec i variant de 1 à n
tout entier naturel superieur ou égal à 1 s'exprime donc 
comme la somme d'unité, ici le chiffre 1.


Soit n une somme arbitraire :
- pour p = 1 nous avons n = somme (n1 * 1)  (d'aprés la formule vu à l'exo 1) 
donc  n = somme (n1) pour tout n >= 1
Comme pour le chiffre 1 dans N, n1 est l'unité 
de notre ensemble Somme = ( n appartenan à N | n : somme a payer)

   Finalement, 
   pour tout n >= 1 et p = 1, on a :
   
       C'(n,1) = C(somme(n1)) = 1 
	   
En effet, il existe une seule maniere de payer une somme n avec des pieces
de 1 centime vu que l'ordre des pieces de 1centime distribué pour faire l'appoint ne modifie
pas le resultat de la somme final.
}
//3.2
{  
Soit : 0 < n < p avec 1 <= p <= 3

On a :
       (A)											(B)
C'(0,p) - C'(0,p-1) < C'(n,p) - C'(n,p-1) < C'(p,p) - C'(p,p-1)

(A)   1    -    1    (car pour tout p C'(0,p)=1 on pose par exemple p'=p-1 => C'(0,p')=1 )   
   
(B)	  0    -    0    (car 0 < n < p : il y a 0 possibilité de payer n centimes avec p pieces superieur à n) 

donc 	1 - 1 = 0 < C'(n,p) - C'(n,p-1) < 0 
     
	 =>   C'(n,p) - C'(n,p-1) = 0
	 
	 =>   C'(n,p)  =  C'(n,p-1)   (6) 
	 **CQFD** 
}
//3.3
{
	Soit : 1 < p <= n avec 1 <= p <= 3

On a :
       		(A)																   (B)
C'(n,1) - C'(n-1,1) - C'(n,0) < C'(n,p) - C'(n-p,p) - C'(n,p-1) <= C'(n,n) - C'(0,n) - C'(n,n-1)

(A)   1    -    1   -    0  (car pour tout n C'(n,1)=1 )   
   
(B)	  n    -    1   - (n-1) (car pour 1 <= p <= 3 : on a C'(p,p)=p et C'(p,p-1)=p-1 ) 

donc 	1 - 1 - 0 = 0 <  C'(n,p) - C'(n-p,p) - C'(n,p-1) < 0 = n - 1 - n + 1
     
	 =>    C'(n,p) - C'(n-p,p) - C'(n,p-1) = 0
	 
	 =>    C'(n,p) = C'(n-p,p) + C'(n,p-1)    (7)
	 **CQFD** 
}

program appoint2;
uses crt; 
var i,j : integer;

function nbAppoint(n,p : integer) : integer;
begin
  if (n=0) then nbAppoint := 1;
  if (p=1) then nbAppoint := 1;
  if (((n>0) and (p<=3)) and (n < p)) then nbAppoint := nbAppoint(n,p-1);
  if (((p>1) and (p<=3)) and (n >= p)) then 
    nbAppoint := nbAppoint(n-p,p) + nbAppoint(n,p-1);	 

	
end;//nbAppoint

begin
 clrscr;
 for j:=1 to 3 do
  begin
    for i:= 0 to 10 do
      writeln('n=',i,'=> C(n) = ', nbAppoint(i,j),' avec p = ',j);
    writeln;
  end;//for p
  repeat until keypressed;
end.
