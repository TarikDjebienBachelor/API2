// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : TP 9 - Manipulation d'arbres binaires : questions 8/9/10

program recherche_arbre_extreme;
uses U_Element,
     U_Arbre, 
     U_Exemples_Arbres;

VAR
  i,rangmax,rangmin,
  tmax,tmin : CARDINAL;
  hauteurmax,hauteurmin : INTEGER;
  nbmax,nbmin : CARDINAL;
  
BEGIN

rangmax:=0;
rangmin:=0;
tmax:= 0 ;
tmin:= 50;

writeln('Question 8');
for i:= 0 to N-1 do 
begin
if (tmax < taille(exemple[i])) then 
 begin
  rangmax:= i;
  tmax:= taille(exemple[i]);
 end;
end;

for i:= 0 to N-1 do 
begin
if (tmin > taille(exemple[i])) then 
 begin
  rangmin:= i;
  tmin:= taille(exemple[i]);
 end;
end;


tmax:= taille(exemple[rangmax]);
writeln('la taille maximale d''un arbre du tableau exemple est de ',tmax);
tmin:= taille(exemple[rangmin]);
writeln('la taille minimale d''un arbre du tableau exemple est de ',tmin);

writeln; 

rangmax:=0;
rangmin:=0;
hauteurmax:=0;
hauteurmin:=50;

writeln('Question 9');
for i:= 0 to N-1 do 
begin
if ( hauteurmax < hauteur(exemple[i])) then 
 begin
  rangmax:= i;
  hauteurmax:= hauteur(exemple[i]);
 end;
end;

for i:= 0 to N-1 do 
begin
if (hauteurmin > hauteur(exemple[i])) then 
 begin
  rangmin:= i;
  hauteurmin:= hauteur(exemple[i]);
 end;
end;


hauteurmax:= hauteur(exemple[rangmax]);
writeln('la hauteur maximale d''un arbre du tableau exemple est de ',hauteurmax);
hauteurmin:= hauteur(exemple[rangmin]);
writeln('la hauteur minimale d''un arbre du tableau exemple est de ',hauteurmin);

writeln;

rangmax:=0;
rangmin:=0;
nbmax:=0;
nbmin:=50;

writeln('Question 10');
for i:= 0 to N-1 do 
begin
if (nbmax < nombreFeuilles(exemple[i])) then 
 begin
  rangmax:= i;
  nbmax:= nombreFeuilles(exemple[i]);
 end;
end;

for i:= 0 to N-1 do 
begin
if (nbmin > nombreFeuilles(exemple[i])) then 
 begin
  rangmin:= i;
  nbmin:= nombreFeuilles(exemple[i]);
 end;
end;


nbmax:= nombreFeuilles(exemple[rangmax]);
writeln('le nombre de feuilles maximale d''un arbre du tableau exemple est de ',nbmax);
nbmin:= nombreFeuilles(exemple[rangmin]);
writeln('la nombre de feuilles minimale d''un arbre du tableau exemple est de ',nbmin);
writeln;
END.
