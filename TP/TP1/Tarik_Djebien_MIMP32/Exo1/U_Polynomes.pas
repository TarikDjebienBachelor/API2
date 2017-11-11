unit U_polynomes ;

interface

const 
	DEG_MAX = 20; //degré maximale du polynome modifiable

type 
	T_POLYNOME = record
	   degre : -1..DEG_MAX;
	   coeff : array[0..DEG_MAX] of integer;
	end {T_POLYNOME};

procedure lirePolynome ( out  p : T_POLYNOME);
//lirePolynome est chargée de la lecture du degré 
//et des coefficients d'un polynome p.
procedure ecrirePolynome ( const p : T_POLYNOME);
//ecrirePolynome est chargée de l'écriture d'un polynome p
//avec l'affichage lineaire suivant : a0 + a1X + a2X² +...+ anX^n
function addPolynome ( const p1,p2 : T_POLYNOME) : T_POLYNOME ;
//addPolynome calcule la somme de deux polynomes.

implementation

procedure lirePolynome( out p :T_POLYNOME);
var i: integer;
Begin
write('Degré : ');readln(p.degre);
for i:= 0 to p.degre do 
    begin 
        write ('coeff degré ',i,' : ');
        readln (p.coeff[i]);
    end;
end{lirePolynome};

procedure ecrirePolynome ( const p : T_POLYNOME);
var j : integer ;
begin
     if p.coeff[0] <> 0 then
     begin 
       write (p.coeff[0]);
     end {if} ;
for j := 1 to p.degre do
     begin
     	if p.coeff[j] <> 0 then 
     	  begin
     	     if p.coeff[j] > 0 then 
     	     	write (' + ', p.coeff[j] , 'x^',j)
     	     else
     	        write (' - ', ABS(p.coeff[j]) , 'x^',j);
     	  end{if};
     end{for}; 
end{ecrirePolynome};


function addPolynome ( const p1,p2 : T_POLYNOME): T_POLYNOME ;
var polyTemp : T_polynome; 
    k : integer ;
begin
	if (p1.degre > p2.degre) then 
	
		polyTemp.degre := p1.degre
	else
		polyTemp.degre := p2.degre ;
	
	for k := 0 to polyTemp.degre do
	  polyTemp.coeff[k] := p1.coeff[k] + p2.coeff[k] ;
addPolynome := polyTemp;
end{function addPolynome};




initialization

finalization

end .
