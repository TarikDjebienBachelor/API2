// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : TP 9 - Manipulation d'arbres binaires : questions 11/12/13/14


program recherche_ABO;
uses U_Element,
     U_Arbre, 
     U_Exemples_Arbres;

VAR
  i,j: CARDINAL;
  
BEGIN
j:=0;

// voir U_Arbre pour les questions 11 et 12

writeln('Question 13');
if estABO(exemple[k]) then
  writeln('L''arbre situé à l''indice k est ordonné.')
else
  writeln('L''arbre situé à l''indice k n''est pas ordonné.');

writeln('Question 14');
for i:= 0 to N-1 do 
begin
if estABO(exemple[i]) then
 begin 
  writeln('exemple[',i,'] est un ABO.');
  inc(j);
 end;
end;

if j=0 then 
writeln('Il n''y a aucun ABO parmi tous les arbres en exemples.')
else
writeln('Il y a ',j,' ABO parmi tous les arbres en exemples.');

END.
