// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : TP 9 - Manipulation d'arbres binaires : questions 15/16/17/18/19


program construction_ABO;
uses U_Element,
     U_Arbre, 
     U_Exemples_Arbres;

VAR
  n,j: CARDINAL;
  a: ARBRE;
  
  I:   array[1..15] of CARDINAL;
  II:  array[1..15] of CARDINAL;
  III: array[1..15] of CARDINAL;
  IV:  array[1..15] of CARDINAL;
  V:   array[1..15] of CARDINAL;
  


  
BEGIN
a:= ARBREVIDE;

// voir U_Arbre pour la question 15

writeln;
writeln('Question 16');
writeln('Entrez une suite de nombres d''entiers positifs se terminant par 0 pour construire un ABO');
read(n);
while n<>0 do
begin
insererABO(n,a);
read(n);
end;

afficherArbre(a);writeln;
infixe(a);writeln;
writeln;

writeln('Question 17');
write('test : estABO(');afficherArbre(a);writeln(') = ',estABO(a));

writeln;
writeln('Question 18');

I[1]:=8;I[2]:=4;I[3]:=12;I[4]:=2;I[5]:=6;I[6]:=10;I[7]:=14;I[8]:=1;I[9]:=3;I[10]:=5;I[11]:=7;I[12]:=9;I[13]:=11;I[14]:=13;I[15]:=15;
II[1]:=8;II[2]:=12;II[3]:=4;II[4]:=2;II[5]:=10;II[6]:=14;II[7]:=6;II[8]:=5;II[9]:=13;II[10]:=15;II[11]:=1;II[12]:=7;II[13]:=11;II[14]:=9;II[15]:=3;
III[1]:=5;III[2]:=8;III[3]:=4;III[4]:=2;III[5]:=13;III[6]:=6;III[7]:=7;III[8]:=10;III[9]:=15;III[10]:=1;III[11]:=3;III[12]:=9;III[13]:=14;III[14]:=11;III[15]:=12;
IV[1]:=1;IV[2]:=2;IV[3]:=3;IV[4]:=4;IV[5]:=5;IV[6]:=6;IV[7]:=7;IV[8]:=8;IV[9]:=9;IV[10]:=10;IV[11]:=11;IV[12]:=12;IV[13]:=13;IV[14]:=14;IV[15]:=15;
V[1]:=15;V[2]:=14;V[3]:=13;V[4]:=12;V[5]:=11;V[6]:=10;V[7]:=9;V[8]:=8;V[9]:=7;V[10]:=6;V[11]:=5;V[12]:=4;V[13]:=3;V[14]:=2;V[15]:=1;

a:= ARBREVIDE;
for j:=1 to 15 do
insererABO(I[j],a);
writeln('la hauteur de l''ABO I vaut : ',hauteur(a));

a:= ARBREVIDE;
for j:=1 to 15 do
insererABO(II[j],a);
writeln('la hauteur de l''ABO II vaut : ',hauteur(a));

a:= ARBREVIDE;
for j:=1 to 15 do
insererABO(III[j],a);
writeln('la hauteur de l''ABO III vaut : ',hauteur(a));

a:= ARBREVIDE;
for j:=1 to 15 do
insererABO(IV[j],a);
writeln('la hauteur de l''ABO IV vaut : ',hauteur(a));

a:= ARBREVIDE;
for j:=1 to 15 do
insererABO(V[j],a);
writeln('la hauteur de l''ABO V vaut : ',hauteur(a));

writeln;
writeln('Question 19');
a:= ARBREVIDE;
creerABOinfixe(exemple[k],a);
writeln;
writeln('exemple[k] : ');afficherArbre(exemple[k]);writeln;
writeln;
writeln('parcours infixé de exemple[k] : ');infixe(exemple[k]);writeln;
writeln;
writeln('a : ');afficherArbre(a);writeln;
writeln;
writeln('parcours infixé de a : ');infixe(a);writeln;
writeln;
writeln('estABO(exemple[k]) : ',estABO(exemple[k]));
writeln('estABO(a) : ',estABO(a));
writeln;
writeln('taille(a) : ',taille(a));
writeln('hauteur(a) : ',hauteur(a));
writeln('racine(a) : ',racine(a));
writeln('nombre de feuilles(a) : ',nombreFeuilles(a));
writeln('taille(gauche(a)) : ',taille(gauche(a)));
writeln('taille(droit(a)) : ',taille(droit(a)));
writeln;
writeln('FIN DU TP 9');
END.
