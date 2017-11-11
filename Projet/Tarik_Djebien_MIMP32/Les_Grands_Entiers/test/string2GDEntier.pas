// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Test de la fonction string2GDEntier
program test;
uses U_Grands_Entiers,
	 U_Liste,
	 U_Element,
	 SysUtils,
	 crt;

var S : string;

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
  write('string2GDEntier("',S,'") = ');
  AfficherListe(string2GDEntier(S));
  writeln;
end;

repeat until keypressed;
end.
