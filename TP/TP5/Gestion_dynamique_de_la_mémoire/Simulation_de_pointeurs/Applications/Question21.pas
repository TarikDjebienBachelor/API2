// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Application de la simulation de pointeur

program Question21;
uses U_Pointeur;

var n : CARDINAL;
    p : POINTEUR;
    
function somme(p:POINTEUR): CARDINAL;
var res,i: CARDINAL;
begin
  res:= 0;
  for i:=1 to (valeurPointee(p)) do
    res:= res + i;
 
  somme:= res;
end{somme};

BEGIN
 write('Entrez un nombre : ');readln(n);
 allouer(p);
 attribuer(n,p);
 writeln('la somme des entiers de 1 à ',n,' vaut : ',somme(p));
 desallouer(p);
END.
