// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Arithmétique sur les Pointeurs

program Question4;
uses SysUtils;

var n :  REAL; // un REAL occupe 8 octets = 64 bits
    p : ^REAL; // p pointeur de REAL occupera 8 octets aussi lors de son allocation memoire

begin

n := strToFloat(paramstr(1));
writeln('Taille d''un REAL : ',sizeof(n)); // sizeof(n) = 8
p := @n; // p --> n

writeln('Avant incrementation de p : ');
writeln('Valeur de p : ', cardinal(p)); // adresse de p en base 10
writeln('Adresse de n : ', cardinal(@n)); // adresse de n en base 10
// adresse de p = adresse de n 

 

inc(p); // valeur(adresse(p)) <-- valeur(adresse(p)) + 8

writeln('Apres incrementation de p : ');
writeln('Valeur de p : ', cardinal(p)); // (adresse de p en base 10)  + 8
writeln('Adresse de n : ', cardinal(@n)); // toujours la meme adresse pour n en base 10

 

end.
