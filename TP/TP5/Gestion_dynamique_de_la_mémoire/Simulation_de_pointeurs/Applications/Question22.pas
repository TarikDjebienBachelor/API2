// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Application de la simulation de pointeur

program Question22;
uses U_Pointeur;

var n : CARDINAL;
    p : POINTEUR;
    
function factorielle(p:POINTEUR): CARDINAL;
var res,i: CARDINAL;
begin
  // 0! = 1
  if valeurPointee(p) = 0 then factorielle:= 1;
  // n!
  res:= 1;
  for i:= 1 to valeurPointee(p) do
    res:= res * i;
  factorielle:=res;
end{factorielle};

BEGIN
 write('Entrez un nombre pour calculer son factorielle : ');readln(n);
 allouer(p);
 attribuer(n,p);
 writeln(n,'! = ',factorielle(p));
 desallouer(p);
 
 writeln('voir note en bas du fichier source Question22.pas svp');
END.


{ NOTE: 
 j'ai tenté au debut de faire un algorithme recursif et non interatif :
 
 function factorielle_rec(p:POINTEUR): CARDINAL;
  begin
  // condition d'arret : 0! = 1
  if valeurPointee(p) = 0 then 
    factorielle_rec := 1
  // reccurence
  else
    factorielle_rec := valeurPointee(p) * factorielle_rec ( valeurPointee(p) - 1 );
  end;

 mais à l'execution j'obtenai l'erreur suivante :
   "Erreur de segmentation"
 
 => je ne comprend pas cette erreur... 
 
 ce que je ne comprend pas c'est que le type de l'argument est "POINTEUR" 
 or valeurPointee(p) - 1 nous renvoie un type "CARDINAL"
 mais rien n'est signalé lors de la compilation...
 cela est peut être dû au fait que "POINTEUR" est declaré comme un intervalle d'entiers ...?
 
 => merci pour l'explication, 
 Cordialement.
}
