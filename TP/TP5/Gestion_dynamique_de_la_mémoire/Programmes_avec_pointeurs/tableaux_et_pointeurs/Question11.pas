// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Tableaux et Pointeurs

program Question9;

var 
	i : INTEGER;
	t : array[1..10] of INTEGER;
    p : ^INTEGER; // p etant initialisé à l'adresse de la 1ere case de t il pointera donc vers un entier.

begin

 // Initialisation des Valeurs des differents éléments du tableau
 for i:= 1 to 10 do
   t[i]:= 2 * i + 1;
 
 //Initialisation de p
 p := @t[1];
 
 // Affichage des adresses de chacune des valeurs
 for i:= 1 to 10 do
  begin
   writeln('t[',i,'] a pour adresse : ', cardinal(p),' et contient ', p^);
   inc(p);
  end{for};

end.
