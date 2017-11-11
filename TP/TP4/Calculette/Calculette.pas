PROGRAM Calculette;

USES U_Element,
	 U_Pile,
	 crt,sysutils;

VAR 
  op : STRING; //Element l'est aussi
  P : PILE;

//Lecture d'une chaine de caractere au clavier
procedure lire ( out op : STRING );
begin
  write('>');
  lireElement(op);  
end{lire};

//La procédure traiter va distinguer le cas où la saisie a donné un nombre entier ou le symbole d'un opérateur
procedure traiter ( const op : STRING ; var p : PILE);
var n,r : LONGINT ;
    SRES,SX,SY : STRING  ;
    res,x,y : LONGINT ;

// procedure Val(const s : STRING; out n : LONGINT; out r : LONGINT);     
{Pour cette distinction, la procédure prédéfinie val est utile. En voici la spécification :
 Val(s,n,r ) attribue à n l’entier représenté par la chaîne de caractères s.
 Si la conversion échoue, r est égal à l’indice où la conversion a échoué
}
   
//fonction puissance x^y =postfixé=> x y ^
function puissance(x,y:LONGINT):LONGINT;
begin
  if y = 0 then 
   puissance := 1
  else
   puissance:= x * puissance(x,y-1);
end{puissance};
begin
   Val(op,n,r);
   if r = 0 then // si op est un nombre 
     empiler(op,P)
   else // op est alors un operateur
    begin
     //Transtypage de SX: String -> x: Longint
     SX := sommet(P);
     Val(SX,x);
     depiler(P);
     //Transtypage de SY: String -> y: Longint
     SY:= sommet(P);
     Val(SY,y);
     depiler(P);
     //Calcul de Valeur(Y op X) = Valeur(Y) op Valeur(X) = y op x = res
           if op = '+' then
      res:= y + x
      else if op = '-' then
      res:= y - x
      else if op = '*' then
      res:= y * x
      else if op = '/' then
      res:= y div x
      //operateur puissance
      else if op = '^' then
      res:= puissance(y,x);
     
     //Transtypage de res: Longint -> SRES : String
     SRES:= IntToStr(res);
     
     //Sommet(P) <-- SRES
     empiler(SRES, P);
     
    end;
end{traiter};




//Affichage de la reponse
procedure afficherReponse ( const P: PILE);
begin
  write('=');
  ecrireElement(sommet(P));
end{afficherReponse};

//Ecran d'acceuil de la calculatrice
procedure Demarrer(var P : PILE);
var C : CHAR;
begin
clrscr;
  P:= PILE_VIDE;
  writeln('Calculette 5 opérations sur les nombres entiers positifs ou négatifs des expressions arithmétiques postfixées');
  writeln;
  writeln;
  writeln;
  write('Voulez-vous consulter le manuel d''utilisation? Y:yes N:no ');readln(C);
  if (C = 'Y') or (C= 'y') then
    begin
      writeln;
      writeln('Mode d''emploi : ');
      writeln;
      writeln('Exemple : 12 + 3 * 5');
      writeln('(le symbole > indiquant une attente de la calculette, et le symbole = indiquant sa réponse)');

      writeln('> 12');
	  writeln('= 12');
	  writeln('> 3');
      writeln('= 3');
      writeln('> 5');
      writeln('= 5');
      writeln('> *');
      writeln('= 15');
      writeln('> +');
      writeln('= 27');
      writeln('12 + (3*5) => 3 5 * 12 + ');
      
    end{man calculette};  
end{Demarrer};


//Menu de la Calculatrice
procedure Menu;
var choice : BOOLEAN;        
begin
writeln('note: tapez >exit pour quitter la calculatrice');
choice := TRUE;

  while choice = TRUE do begin
     lire(op);
     if op = 'exit' then choice := FALSE else
     begin
     traiter(op,P);
     afficherReponse(P);
     end;
  end{while};
end{Menu};



//ecran de fermeture de la calculatrice
procedure Arreter;
begin
writeln;
writeln('question 10 : ');
writeln;
writeln('1. ');
writeln('3 x (4 - 7)');
writeln('postixée : 4 7 - 3 * ');
writeln;
writeln('2. ');
writeln('1 + (8/5) - 2');
writeln('postixée : 8 5 / 1 + 2 -');
writeln;
writeln('3. ');
writeln('(1+8) / (5-2)');
writeln('1 8 + 5 2 - /');
writeln;
writeln('Auteur : DJEBIEN TARIK MIMP 32');
repeat until keypressed;
clrscr;
end{Arreter};




//PROGRAMME PRINCIPAL
BEGIN
  Demarrer(P);
  Menu;
  Arreter;
END.
//Taper >exit pour quitter 
