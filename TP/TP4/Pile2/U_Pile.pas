Unit U_Pile;

Interface

uses U_Element;

const 
   MAX = 100; // taille maximale de la pile
   

type
   PILE = record
     sommet : 0..MAX;
     contenu : array[1..MAX] of ELEMENT; 
   
   end{PILE};


const
  PILE_VIDE : PILE = (sommet:0); // vacuité de la pile




//estPileVide(P) ssi P est vide
function estPileVide(P: PILE): BOOLEAN; 

//estPilePleine(P) ssi P est pleine
function estPilePleine(P: PILE): BOOLEAN;

//sommet(P)= élément situé au sommet de P
//CU: declenche une exception si la pile P est vide
function sommet(P: PILE):ELEMENT;

//empile x au sommet de la pile P
//CU: declenche une exception si la pile P est pleine
procedure empiler(const x: ELEMENT ; var P: PILE);

//depile le sommet x de la pile P
//CU: declenche une exception si la pile P est vide
procedure depiler(var P: PILE);




Implementation


//estPileVide(P) ssi P est vide
function estPileVide(P: PILE): BOOLEAN;
begin
 if P.sommet = 0 then
   estPileVide := TRUE
 else
   estPileVide := FALSE;
end{estPileVide};



//estPilePleine(P) ssi P est pleine
function estPilePleine(P: PILE): BOOLEAN;
begin
  if P.sommet = MAX then
     estPilePleine := TRUE
  else
     estPilePleine := FALSE;
end{estPilePleine};


//sommet(P)= élément situé au sommet de P
//CU: declenche une exception si la pile P est vide
function sommet(P: PILE):ELEMENT;
var 
  dernier : ELEMENT;

begin
  if estPileVide(P) then
    writeln('La Pile est Vide')
  else
   begin
    dernier:= P.contenu[ P.sommet ];
    sommet:= dernier;
   end;
end{sommet};


//empile x au sommet de la pile P
//CU: declenche une exception si la pile P est pleine
procedure empiler(const x: ELEMENT ; var P: PILE);
begin
  if estPilePleine(P) then
    writeln('La Pile est Pleine')
  else
    begin
      P.sommet := P.sommet + 1;
      P.contenu[ P.sommet ] := x ;
    end;
end{empiler};


//depile le sommet x de la pile P
//CU: declenche une exception si la pile P est vide
procedure depiler(var P: PILE);
begin
  if estPileVide(P) then
    writeln('La Pile est Vide')
  else
    begin
      P.sommet := P.sommet - 1;
    end;
end{depiler};



Initialization


Finalization

End.
