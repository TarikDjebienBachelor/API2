// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Application de la simulation de pointeur

program Question20;
uses U_Pointeur;

var n,p : CARDINAL;
    p1,p2 : POINTEUR;
    
procedure swap(var p1:POINTEUR;var p2:POINTEUR);
var temp1, temp2 : CARDINAL;
begin
  temp1:= valeurPointee(p1); // temp1 <-- p1^
  temp2:= valeurPointee(p2); // temp2 <-- p2^
  attribuer(temp2,p1);       // p1^ <-- temp2
  attribuer(temp1,p2);       // p2^ <-- temp1
end{swap};

BEGIN
 writeln('Entrez les deux nombres : ');readln(n);readln(p);
 
 //allocation memoire
 allouer(p1);
 allouer(p2);
 
 //p1 --> n
 attribuer(n,p1);
 //p2 --> p
 attribuer(p,p2);
 
 writeln('Avant le swap n vaut : ',valeurPointee(p1),' et p vaut : ',valeurPointee(p2));
 swap(p1,p2);
 writeln('Aprés le swap n vaut : ',valeurPointee(p1),' et p vaut : ',valeurPointee(p2));
 
 //desallocation
 desallouer(p1);
 desallouer(p2);
END.
