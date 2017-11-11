// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Adresses de variables


program question1;
uses SysUtils;

var n : CARDINAL;

begin
  n:= strToInt(paramstr(1));
  writeln;
  writeln('Adresse de n : ',cardinal(@n));
  writeln;
  
  writeln('Q 1-1.');
  writeln;
  writeln('L''affichage obtenu indique l''adresse memoire en ecriture decimal de'); 
  writeln('l''emplacement memoire alloué à la variable n ');
  writeln;
  
  writeln('Q 1-2.');
  writeln;
  writeln('Pour :');
  writeln('Adresse_de_n_:_'', @n ');
  writeln;
  writeln('On obtient à la compilation :');
  writeln('Error: Can''t read or write variables of this type;');
  writeln;
  writeln('Explication :');
  writeln('c''est une erreur d''analyse semantique du compilateur dû au fait que lors de la lecture dans le writeln de @n,');
  writeln('le langage pascal ne permet pas de lire directement une adresse memoire qui n''a pas été convertie prealablement ');
  writeln('à l''aide d''un transtypage reconnu par le langage comme le type CARDINAL appliqué précédamment ');
  writeln;
  
  writeln('Q 1-3.');
  writeln;
  writeln('Adresse de n : ', intToHex(cardinal(@n),8));
  writeln;
  writeln('On passe de l''ecriture en base 10 de l''adresse memoire alloué a la variable n en une ecriture base 16,');
  writeln('le parametre 8 indiquant le nombre de bits sur lesquelles l''adresse sera codée ici 8 bits = 1 octet. ');
  writeln;
  writeln('Le lien entre Decimal <=> Hexadecimal ?');
  writeln('les adresses memoires sont par convention exprimées en hexadecimal');
  writeln('On convertit de decimal en binaire la valeur de l''adresse et ensuite ');
  writeln('il faut exprimer chaque caractère hexadécimal à l''aide de 4 informations binaires pour obtenir la meme adresse en base 16');
  writeln;
end.
