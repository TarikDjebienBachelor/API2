// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Tableaux et Pointeurs

program Question9;

var 
	i : INTEGER;
	t : array[1..10] of INTEGER;

begin

 // Initialisation des Valeurs des differents éléments du tableau
 for i:= 1 to 10 do
   t[i]:= 2 * i + 1;
 
 // Affichage des adresses de chacune des valeurs
 for i:= 1 to 10 do
   writeln('t[',i,'] a pour adresse : ', cardinal(@(t[i])),' et contient ',t[i]);

 // Interpretation et Analyse
 writeln;
   writeln('Question 10.');
    writeln('le tableau t est un tableau d''entiers de 10 cases memoire CONTIGUES.');
    writeln('On aura alors un emplacement memoire allouée qui vaut 10 x 4 = 40 octets');
   writeln;
end.
