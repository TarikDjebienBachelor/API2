unit U_polynomes_exo2 ; //version plus compacte n'utilisant pas d'enregistrement

interface

const 
	DEG_MAX = 20; //degré maximale du polynome
	DEG_NUL =-10; //degré du polynome nul par convention

type POLY = array[-1..DEG_MAX] of integer;
//On convient que P[-1] contient le degré du polynôme P, 
//P[0] contient a0, et ainsi de suite.

procedure lirePolynome ( out  p : POLY);
//lirePolynome est chargée de la lecture du degré 
//et des coefficients d'un polynome p.
procedure ecrirePolynome ( const p : POLY);
//ecrirePolynome est chargée de l'écriture d'un polynome p
//avec l'affichage lineaire suivant : a0 + a1X + a2X² +...+ anX^n
function addPolynome ( const p1,p2 : POLY) : POLY ;
//addPolynome calcule la somme de deux polynomes.

implementation

procedure lirePolynome( out p :POLY);
var i: integer;
Begin
write('Degré : ');readln(p[-1]);
for i:= 0 to p[-1] do 
    begin 
        write ('coeff degré ',i,' : ');
        readln (p[i]);
    end;
end{lirePolynome};

procedure ecrirePolynome ( const p : POLY);
var j : integer ;
begin
     if p[0] <> 0 then
     begin 
       write (p[0]);
     end {if} ;
for j := 1 to p[-1] do
     begin
     	if p[j] <> 0 then 
     	  begin
     	     if p[j] > 0 then 
     	     	write (' + ', p[j] , 'x^',j)
     	     else
     	        write (' - ', ABS(p[j]) , 'x^',j);
     	  end{if};
     end{for}; 
end{ecrirePolynome};


function addPolynome ( const p1,p2 : POLY): POLY ;
var polyTemp : POLY; 
    k : integer ;
begin
	if (p1[-1] > p2[-1]) then 
	
		polyTemp[-1] := p1[-1]
	else
		polyTemp[-1] := p2[-1] ;
	
	for k := 0 to polyTemp[-1] do
	  polyTemp[k] := p1[k] + p2[k] ;

addPolynome := polyTemp;
	 
end{function addPolynome};




initialization

finalization

end .
