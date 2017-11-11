// auteur : 
// date   : 
// objet  : définition du type ARBRE 
//          définition avec allocation dynamique de la mémoire
unit U_Arbre ;

interface
uses U_Element;

const
   ARBREVIDE = NIL;
type
   ARBRE = ^CELLULE;
   CELLULE = record
      info : ELEMENT;
      gauche, droit : ARBRE;
   end {CELLULE};


   {************************************************}
   {*            OPERATIONS PRIMITIVES             *}
   {************************************************}   
   {************** CONSTRUCTEURS *******************}
   
   // creerArbre(e,g,d) = <e;g;d>
   function creerArbre(e : ELEMENT;
                       g,d : ARBRE) : ARBRE;
   
   {************** SELECTEURS **********************}
   // racine($a$) = l'élément situé à la racine de $a$
   // CU : $a$ non vide
   function racine(a :  ARBRE) : ELEMENT;

   // gauche($a$) = le sous-arbre gauche de $a$
   // CU : $a$ non vide
   function gauche(a : ARBRE) : ARBRE;

   // droit($a$) = le sous-arbre droit de $a$
   // CU : $a$ non vide
   function droit(a : ARBRE) : ARBRE;

   
   {************** PREDICAT   **********************}
   // estArbreVide($a$) $\Leftrightarrow$ $a$ est vide
   function estArbreVide(a :  ARBRE) : BOOLEAN;
   
   
   
   {************** MUTATION D'UN ARBRE ************}
   // modifierRacine($a$,$e$) modifie la valeur de
   // l'élément en tête de $a$ 
   // CU : $a$ non vide
   procedure modifierRacine(const a : ARBRE; const e : ELEMENT);
   
   // modifierGauche($a$,$g$) modifie le sous-arbre gauche de $a$
   // en lui attribuant $g$ 
   // CU : $a$ non vide
   procedure modifierGauche(const a : ARBRE; const g : ARBRE);
   
   // modifierDroit($a$,$d$) modifie le sous-arbre droit de $a$
   // en lui attribuant $d$ 
   // CU : $a$ non vide
   procedure modifierDroit(const a : ARBRE; const d : ARBRE);
   

   
implementation

   {************************************************}
   {*            OPERATIONS PRIMITIVES             *}
   {************************************************}   
   {************** CONSTRUCTEURS *******************}
   
   // creerArbre(e,g,d) = <e;g;d>
   function creerArbre(e : ELEMENT;
                       g,d : ARBRE) : ARBRE;
   var
      a1 : ARBRE;
   begin
      new(a1);
      a1^.info := e;
      a1^.gauche := g;
      a1^.droit := d;
      creerArbre := a1;
   end {creerArbre};
   
   {************** SELECTEURS **********************}
   // racine($a$) = l'élément situé à la racine de $a$
   // CU : $a$ non vide
   function racine(a :  ARBRE) : ELEMENT;
   begin
      racine := a^.info;
   end {racine};

   // gauche($a$) = le sous-arbre gauche de $a$
   // CU : $a$ non vide
   function gauche(a : ARBRE) : ARBRE;
   begin
      gauche := a^.gauche;
   end {gauche};

   // droit($a$) = le sous-arbre droit de $a$
   // CU : $a$ non vide
   function droit(a : ARBRE) : ARBRE;
   begin
      droit := a^.droit;
   end {droit};
   
   {************** PREDICAT   **********************}
   // estArbreVide($a$) $\Leftrightarrow$ $a$ est vide
   function estArbreVide(a :  ARBRE) : BOOLEAN;
   begin
      estArbreVide := (a=NIL);
   end {estArbreVide};
   
   
   {************** MUTATION D'UN ARBRE ************}
   // modifierRacine($a$,$e$) modifie la valeur de
   // l'élément en tête de $a$ 
   // CU : $a$ non vide
   procedure modifierRacine(const a : ARBRE; const e : ELEMENT);
   begin
      a^.info := e;
   end {modifierRacine};
   
   // modifierGauche($a$,$g$) modifie le sous-arbre gauche de $a$
   // en lui attribuant $g$ 
   // CU : $a$ non vide
   procedure modifierGauche(const a : ARBRE; const g : ARBRE);
   begin
      a^.gauche := g;
   end {modifierGauche};
   
   // modifierDroit($a$,$d$) modifie le sous-arbre droit de $a$
   // en lui attribuant $d$ 
   // CU : $a$ non vide
   procedure modifierDroit(const a : ARBRE; const d : ARBRE);
   begin
      a^.droit := d;
   end {modifierDroit};
   
   
initialization
   
finalization
   
end.
