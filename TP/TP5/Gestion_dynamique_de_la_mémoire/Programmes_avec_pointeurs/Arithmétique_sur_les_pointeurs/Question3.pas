// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Arithmétique sur les Pointeurs

program Question3;
uses SysUtils;

var n :  CARDINAL; // un CARDINAL occupe 4 octets = 32 bits
    p : ^CARDINAL; // p pointeur de CARDINAL occupera 4 octets aussi lors de son alocation memoire

begin

n := strToInt(paramstr(1));
writeln('Taille d''un CARDINAL : ',sizeof(n)); // sizeof(n) = 4
p := @n; // p --> n

writeln('Avant incrementation de p : ');
writeln('Valeur de p : ', cardinal(p)); // adresse de p en base 10
writeln('Adresse de n : ', cardinal(@n)); // adresse de n en base 10
// adresse de p = adresse de n 

// writeln(p^); affichera valeur(n) 

inc(p); // valeur(adresse(p)) <-- valeur(adresse(p)) + 4 

writeln('Apres incrementation de p : ');
writeln('Valeur de p : ', cardinal(p)); // (adresse de p en base 10)  + 4
writeln('Adresse de n : ', cardinal(@n)); // toujours la meme adresse pour n en base 10

// writeln(p^); affichera une valeur indeterminée
// dec(p); valeur(adresse(p)) <-- valeur(adresse(p)) - 4 donc adresse de p = adresse de n 
// writeln(p^); affichera valeur(n) à nouveau

end.
