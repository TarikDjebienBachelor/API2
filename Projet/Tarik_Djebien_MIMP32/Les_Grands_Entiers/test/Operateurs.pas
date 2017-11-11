// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : octobre 2009
// objet  : Test des operateurs add, Mult, puissance
program test;
uses U_Element,
	 U_Liste,
	 U_Grands_Entiers,
	 SysUtils;

var i : INTEGER;
	N : CARDINAL;
	S1,S2 : STRING;
    G1,G2: GDENTIER;

begin
   writeln;
   writeln(' TEST: operateurs add / Mult / puissance ');
   writeln;
   
   write('G1 = ');lireGDEntier(G1);
   write('vous avez choisi G1 = ');AfficherListe(G1);
   writeln;
   write('G2 = ');lireGDEntier(G2);
   write('vous avez choisi G2 = ');AfficherListe(G2);
   writeln;
   // test de validité
   S1:= GDEntier2String(G1);
   S2:= GDEntier2String(G2);
   if (estChaineValide(S1) AND estChaineValide(S2)) then
   begin
   //ADDITION
   writeln;
   write('  ');
   
   if tailleGDEntier(G1) >= tailleGDEntier(G2) then 
   ecrireGDEntier(G1) 
   else 
   ecrireGDEntier(G2);
   
   writeln;
   write('+ ');
   
   if tailleGDEntier(G1) >= tailleGDEntier(G2) then
    begin
     for i:=1 to tailleGDEntier(G1) - tailleGDEntier(G2) do
     write(' ');
    ecrireGDEntier(G2);
    end
   else
    begin
     for i:=1 to tailleGDEntier(G2) - tailleGDEntier(G1) do
     write(' '); 
    ecrireGDEntier(G1);
    end;
   writeln;
   
   write('  ');
   for i:= 1 to tailleGDEntier(add(G1,G2)) do
   begin
   write('-');
   end;
   writeln;
   write('= ');
   
   ecrireGDEntier(add(G1,G2));
   writeln;
   writeln;
   
   
   //MULTIPLICATION
   writeln;
   write('  ');
   
   if tailleGDEntier(G1) >= tailleGDEntier(G2) then 
   ecrireGDEntier(G1) 
   else 
   ecrireGDEntier(G2);
   
   writeln;
   write('x ');
   
   if tailleGDEntier(G1) >= tailleGDEntier(G2) then
    begin
     for i:=1 to tailleGDEntier(G1) - tailleGDEntier(G2) do
     write(' ');
    ecrireGDEntier(G2);
    end
   else
    begin
     for i:=1 to tailleGDEntier(G2) - tailleGDEntier(G1) do
     write(' '); 
    ecrireGDEntier(G1);
    end;
   writeln;
   
   write('  ');
   for i:= 1 to tailleGDEntier(mult(G1,G2)) do
   begin
   write('-');
   end;
   writeln;
   write('= ');
     
   ecrireGDEntier(mult(G1,G2));
   writeln;
   writeln;
   
   //PUISSANCE
   write('G1 ^ N : ');
   write('entrez votre exposant N : ');readln(N);
   ecrireGDEntier(G1);write(' ^ ');write(N);writeln(' = ');
   ecrireGDEntier(puissance(G1,N));
   writeln;
   writeln;
   
   
   writeln('compare(G1,G2) : ');
   i := compare(G1,G2);
   case i of
     0 : writeln('G1 = G2');
     1 : writeln('G1 > G2');
    -1 : writeln('G1 < G2');
   end;
   
   end
   else
    writeln('Entrer des chaines composées uniquement de chiffres decimaux.');

writeln;
end.
