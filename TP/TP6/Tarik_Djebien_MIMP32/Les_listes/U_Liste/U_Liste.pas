// auteur : Djebien Tarik
// date   : novembre 2009
// objet  : Unité munie des opérations primitives sur la structure de donnée lineaire de type Liste

unit U_Liste;

interface
uses U_Element;  

type 
  LISTE = ^CELLULE;
  CELLULE = record
    info : ELEMENT;
    suivant : LISTE;
  end{CELLULE};

const
  LISTEVIDE : LISTE = NIL;


    
// ajouteEnTete(e,l) = < e;l >
function ajouteEnTete(e: ELEMENT ; l: LISTE): LISTE;

// tete(l) = le premier élement de la liste l
// CU : l non vide
function tete(l: LISTE): ELEMENT;

// reste(l) = la liste qui suit le premier élement de la liste l
// CU : l non vide
function reste(l: LISTE): LISTE;

// estListeVide(l) <=> l est vide
function estListeVide(l: LISTE): BOOLEAN;

// modifierTete(l,e) modifie la valeur de l'element en tete de l
// CU : l non vide
procedure modifierTete(const l: LISTE ; const e : ELEMENT);

// modifierReste(l,ll) modifie la valeur du reste de la liste l 
// en lui attribuant la liste ll
// CU : l non vide
procedure modifierReste(const l: LISTE ; const ll: LISTE);


implementation



// ajouteEnTete(e,l) = < e;l >
function ajouteEnTete(e: ELEMENT ; l: LISTE): LISTE;
var l1 : LISTE;
begin
  new(l1);
  l1^.info := e;
  l1^.suivant := l;
  ajouteEnTete := l1;
end{ajouteEnTete}; 


// tete(l) = le premier élement de la liste l
// CU : l non vide
function tete(l: LISTE): ELEMENT;
begin
 if not(estListeVide(l)) then
  tete := l^.info
 else
  writeln('La liste est vide');
end{tete};


// reste(l) = la liste qui suit le premier élement de la liste l
// CU : l non vide
function reste(l: LISTE): LISTE;
begin
 if not(estListeVide(l)) then
  reste:= l^.suivant
 else
  writeln('La liste est vide');
end{reste};


// estListeVide(l) <=> l est vide
function estListeVide(l: LISTE): BOOLEAN;
begin
  estListeVide :=  (l = NIL);
end{estListeVide};


// modifierTete(l,e) modifie la valeur de l'element en tete de l
// CU : l non vide
procedure modifierTete(const l: LISTE ; const e : ELEMENT);
begin
 if not(estListeVide(l)) then
   l^.info := e 
 else
   writeln('La liste est vide');
end{modifierTete};


// modifierReste(l,ll) modifie la valeur du reste de la liste l 
// en lui attribuant la liste ll
// CU : l non vide
procedure modifierReste(const l: LISTE ; const ll: LISTE);
begin
 if not(estListeVide(l)) then
  l^.suivant := ll
 else
  writeln('La liste est vide');
end{modifierReste};


initialization

    
finalization
   
  
end.
