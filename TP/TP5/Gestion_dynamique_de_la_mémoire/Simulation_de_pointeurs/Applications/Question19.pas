// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Application de la simulation de pointeur

program Question19;
uses U_Pointeur;

var n : CARDINAL;
    p : POINTEUR;
    
function carre(p:POINTEUR): CARDINAL;
begin
  carre:= valeurPointee(p)*valeurPointee(p);
end{carré};

BEGIN
 write('Entrez un nombre pour calculer son carré : ');readln(n);
 allouer(p);
 attribuer(n,p);
 writeln('le carré de ',n,' vaut : ',carre(p));
 desallouer(p);
END.
