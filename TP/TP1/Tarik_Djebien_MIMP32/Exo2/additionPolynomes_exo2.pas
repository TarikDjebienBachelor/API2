//auteur : DJEBIEN TARIK
//date : septembre 2009
//objet : additionner deux polynomes

program additionPolynomes;
uses U_Polynomes_exo2;
var 
	p1,p2 : POLY;
begin
   lirePolynome(p1);
   lirePolynome(p2);
   ecrirePolynome (addPolynome (p1,p2));
   writeln;
end.
