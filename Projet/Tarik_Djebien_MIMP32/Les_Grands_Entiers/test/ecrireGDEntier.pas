// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Test de la procedure ecrireGDEntier
program test;
uses U_Grands_Entiers,
	 U_Liste,
	 U_Element,
	 SysUtils,
	 crt;

var S : string;
	G : GDENTIER;

   // procedure de description de l'usage du programme
   // utilisee uniquement si usage incorrect
   procedure usage(const s : STRING);
   begin
      writeln('Nombre de parametres incorrect !');
      writeln('Usage : ');
      writeln( s + ' <n> ');
      writeln('avec <n> = votre grand entier');
      halt(1);
   end {usage};


BEGIN
   if paramcount() <> 1 then
      usage(paramstr(0));
   S := paramstr(1);  

if not(estChaineValide(S)) then
  writeln('Entrer une chaine composé uniquement de chiffres decimaux.')
else
begin
  G := string2GDEntier(S);
  write('ecrireGDEntier(');AfficherListe(G);writeln(') : ');
  ecrireGDEntier(G);
end;
writeln;
repeat until keypressed;
end.
