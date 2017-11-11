// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Arithmétique sur les Pointeurs

program Question4;
uses SysUtils;

var n :  CHAR; // un CHAR occupe 1 octets = 8 bits
    p : ^CHAR; // p pointeur de CHAR occupera 1 octets aussi lors de son allocation memoire

begin
write('Entrez un caractere : ');readln(n);
writeln('Taille d''un CHAR : ',sizeof(n)); // sizeof(n) = 1
p := @n; // p --> n

writeln('Avant incrementation de p : ');
writeln('Valeur de p : ', cardinal(p)); // adresse de p en base 10
writeln('Adresse de n : ', cardinal(@n)); // adresse de n en base 10
// adresse de p = adresse de n 

 

inc(p); // valeur(adresse(p)) <-- valeur(adresse(p)) + 1

writeln('Apres incrementation de p : ');
writeln('Valeur de p : ', cardinal(p)); // (adresse de p en base 10)  + 1
writeln('Adresse de n : ', cardinal(@n)); // toujours la meme adresse pour n en base 10

writeln;
writeln('Question 4.3.');
writeln;
writeln('Observations : ');
writeln(' function sizeof(n : TYPE): CARDINAL ;');
writeln(' sizeof renvoie la taille en octets de l''emplacement memoire alloué à sa variable n');
writeln;
writeln('TYPE REAL     -->  8 octets');
writeln('TYPE CARDINAL -->  4 octets');
writeln('TYPE INTEGER  -->  4 octets');
writeln('TYPE BOOLEAN  -->  1 octets');
writeln('TYPE CHAR     -->  1 octets');
writeln; 

end.
