// auteur : DJEBIEN TARIK - MIMP 32 
// date   : 12/11/2009
// objet  : EXO 4   TP3-API2


//4. Toujours avec trois pièces mais quelconques
{
    PIECES = (1,2,5)
}

program appoint3;
uses crt; 
var i,j : integer;
type PIECES = (1,2,5);

function valeurPrecedente(P: PIECES):PIECES;
var 
  P : PIECES;
begin
  valeurPrecedente:= PREC(P);
end;//valeurPrecedente

function nbAppoint(n,p : integer) : integer;
begin
  if (n=0) then nbAppoint := 1;
  if (p=1) then nbAppoint := 1;
  if (((n>0) and (p<=5)) and (n < p)) then nbAppoint := nbAppoint(n,valeurPrecedente(p));
  if (((p>1) and (p<=5)) and (n >= p)) then 
    nbAppoint := nbAppoint(n-p,p) + nbAppoint(n,valeurPrecedente(p));	 

	
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
