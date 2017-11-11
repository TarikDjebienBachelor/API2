// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Allocation dynamique de la mémoire

program Question5;
uses SysUtils;

var p : ^INTEGER;

begin
  new(p); 
  p^ := strToInt(paramstr(1));
  
  writeln('Valeur pointee par p : ', p^);
  dispose(p);

    writeln;
  
  writeln('Q 5-1.');
    writeln('on affiche la valeur placée en parametre de l''executable car p^ pointe vers cette valeur');writeln;
  
  writeln('Q 5-2.');
    writeln('En effet, le programme compile mais on remarque un message preventif lors de la compilation :');
    writeln(' Warning: Variable "p" does not seem to be initialized');writeln;
    writeln(' C''est a l''execution que l''on remarque qu''il y a un gros probleme : ');
    writeln('EAccessViolation : Access violation');writeln;
    writeln('Explication : ');
    writeln('l''espace alloué au pointeur p n''existe plus donc l''affectation "p^ := strToInt(paramstr(1))" en memoire est prohibée');
    writeln('En effet, l''ordinateur interdit d''ecrire des données dans un emplacement aléatoire de la memoire');
    writeln('l''exécutable ne possède aucun droit pour effectuer cette réecriture en memoire');
    writeln('ceci evite le risque de supprimer à un endroit dans la memoire des donnée indispensable au bon fonctionnement de la machine');
    writeln('il faut donc allouer préalablement un emplacement LIBRE qui pourra contenir les donnée nécessaire');writeln;
  
  writeln('Q 5-3.');
    writeln('En ajoutant writeln(p^) à la suite du dispose,');
    writeln('on obtient à l''execution l''affichage d''une adresse memoire aleatoire pour p^');
    writeln('qui change à chaque nouvelle execution du programme');
    
  writeln('Conclusion : ');
    writeln('un pointeur P doit etre initialisé en lui allouant un espace memoire par l''instruction new(P)');
    writeln('Lorque l''usage de P devient inutile on peut liberer cet espace reservée dans la memoire par dispose(P)');
    writeln('tout accés à la zone pointée par P avant son allocation ou aprés sa desallocation memoire');
    writeln(' entrainera un probleme à un moment donné inevitable ');
     
    
writeln;  
end.
