// auteur : Djebien Tarik
// date   : decembre 2009
// objet  : d�finition du type ARBRE 
//          d�finition avec allocation dynamique de la m�moire

UNIT U_Arbre ;

INTERFACE
uses U_Element;

const
   ARBREVIDE = NIL;
   k = 10701472 mod 50;
   
type
   ARBRE = ^NOEUD;
   NOEUD = record
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

   // procedure de construction d'un ABO b
   // � partir des �lements dans l'ordre infix� d'un AB a  
   procedure creerABOinfixe(const a:ARBRE;var b:ARBRE);
   
   {************** SELECTEURS **********************}
   // racine(a) = l'�l�ment situ� � la racine de a
   // CU : a non vide
   function racine(a :  ARBRE) : ELEMENT;

   // gauche(a) = le sous-arbre gauche de a
   // CU : a non vide
   function gauche(a : ARBRE) : ARBRE;

   // droit(a) = le sous-arbre droit de a
   // CU : a non vide
   function droit(a : ARBRE) : ARBRE;

   
   {************** PREDICAT   **********************}
   // estArbreVide(a) <=> a est vide
   function estArbreVide(a :  ARBRE) : BOOLEAN;
   
   // estABO(a) = VRAI si a est un arbre binaire ordonn� FAUX sinon
   function estABO(a: ARBRE): BOOLEAN;   
   
   // recherche(A,e)= VRAI si e c A FAUX sinon
   function recherche(a: ARBRE;e: ELEMENT): BOOLEAN;
   
   
   {************** MUTATION D'UN ARBRE ************}
   // modifierRacine(a,e) modifie la valeur de
   // l'�l�ment en t�te de a
   // CU : a non vide
   procedure modifierRacine(const a : ARBRE; const e : ELEMENT);
   
   // modifierGauche(a,g) modifie le sous-arbre gauche de a
   // en lui attribuant g 
   // CU : a non vide
   procedure modifierGauche(const a : ARBRE; const g : ARBRE);
   
   // modifierDroit(a,d) modifie le sous-arbre droit de a
   // en lui attribuant d 
   // CU : a non vide
   procedure modifierDroit(const a : ARBRE; const d : ARBRE);

   // insererABO(e,a) ajoute un nouvel �l�ment e
   // en feuille de a. L'arbre a est modifi�.
   procedure insererABO(const e : ELEMENT; var a: ARBRE);
   
   {************** ACCESSEUR **************} 
   // taille(a) = nombre de noeuds dans a
   function taille(a : ARBRE) : CARDINAL;
   
   // hauteur(a) = longueur de la plus longue branche de a 
   function hauteur(a : ARBRE) : INTEGER;
   
   // nombreFeuilles(a) = nombre de feuilles dans a
   function nombreFeuilles(a : ARBRE) : CARDINAL;
   
   // accede � l'�lement situ� le plus a droite possible dans a
   function plusADroite(a : ARBRE) : ELEMENT;

   // accede � l'�lement situ� le plus a gauche possible dans a
   function plusAGauche(a : ARBRE) : ELEMENT;
   
   {************** AFFICHEUR **************} 
   // procedure d'affichage d'un arbre <racine,gauche,droite> 
   procedure afficherArbre(a:ARBRE);

   // procedure d'affichage d'un arbre dans l'ordre infix� 
   procedure infixe(a:ARBRE);

   //procedure d'affichage d'un arbre dans l'ordre postfix� 
   procedure postfixe(a:ARBRE);
   
   //procedure d'affichage d'un arbre dans l'ordre prefix� 
   procedure prefixe(a:ARBRE);   

IMPLEMENTATION


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
   
   // procedure de construction d'un ABO b
   // � partir des �lements dans l'ordre infix� d'un AB a  
   procedure creerABOinfixe(const a:ARBRE;var b:ARBRE);
   begin
     if (estArbreVide(a)) then begin
     end else begin
     creerABOinfixe(gauche(a),b);
      insererABO(racine(a),b);
     creerABOinfixe(droit(a),b); 
     end;
   end;
   
   {************** SELECTEURS **********************}
   
   // racine(a) = l'�l�ment situ� � la racine de a
   // CU : a non vide
   function racine(a :  ARBRE) : ELEMENT;
   begin
      racine := a^.info;
   end {racine};

   // gauche(a) = le sous-arbre gauche de a
   // CU : a non vide
   function gauche(a : ARBRE) : ARBRE;
   begin
      gauche := a^.gauche;
   end {gauche};

   // droit(a) = le sous-arbre droit de a
   // CU : a non vide
   function droit(a : ARBRE) : ARBRE;
   begin
      droit := a^.droit;
   end {droit};
   
   {************** PREDICAT   **********************}

   // estArbreVide(a) <=> a est vide
   function estArbreVide(a :  ARBRE) : BOOLEAN;
   begin
      estArbreVide := (a=NIL);
   end {estArbreVide};
   
   // recherche(e,a) = VRAI si e appartient � a FAUX sinon
   function recherche(e: ELEMENT ; a: ARBRE): BOOLEAN;
   begin
     if estArbreVide(a) then
        recherche := FALSE
     else if racine(a) = e then
        recherche := TRUE
     else
        recherche := recherche(e,gauche(a)) or recherche(e,droit(a)) ; 
   end{recherche};
   
   // estABO(a) = VRAI si a est un arbre binaire ordonn� FAUX sinon
   function estABO(a: ARBRE): BOOLEAN;
   begin
     if estArbreVide(a) then
        estABO:= TRUE
     else if estArbrevide(gauche(a)) AND estArbreVide(droit(a)) then
        estABO:= TRUE
     else if estArbreVide(gauche(a)) then
        estABO:= estABO(droit(a))
     else if estArbreVide(droit(a)) then
        estABO:= estABO(gauche(a))
     else
        estABO:= ( (estABO(gauche(a))) AND (estABO(droit(a))) AND (racine(a) <= racine(droit(a))) AND (racine(gauche(a)) <= racine(a)) );
   end{estABO};
     
   {************** MUTATION D'UN ARBRE ************}
   
   // modifierRacine(a,e) modifie la valeur de
   // l'�l�ment en t�te de a
   // CU : a non vide
   procedure modifierRacine(const a : ARBRE; const e : ELEMENT);
   begin
      a^.info := e;
   end {modifierRacine};
   
   // modifierGauche(a,g) modifie le sous-arbre gauche de a
   // en lui attribuant g
   // CU : a non vide
   procedure modifierGauche(const a : ARBRE; const g : ARBRE);
   begin
      a^.gauche := g;
   end {modifierGauche};
   
   // modifierDroit(a,d) modifie le sous-arbre droit de a
   // en lui attribuant d 
   // CU : a non vide
   procedure modifierDroit(const a : ARBRE; const d : ARBRE);
   begin
      a^.droit := d;
   end {modifierDroit};

   // insererABO(e,a) ajoute un nouvel �l�ment e
   // en feuille de a. L'arbre a est modifi�.
   procedure insererABO(const e : ELEMENT; var a: ARBRE);
   var b: ARBRE;
   begin
     if estArbreVide(a) then
       a:= creerArbre(e,ARBREVIDE,ARBREVIDE)
     else if racine(a) <= e then
       begin
         b:= droit(a);
         insererABO(e,b);
         modifierDroit(a,b);
       end
     else
       begin
         b:= gauche(a);
         insererABO(e,b);
         modifierGauche(a,b);
       end;
   end {insererABO};

   {************** ACCESSEUR **************}
   
   // taille(a) = nombre de noeuds dans a
   function taille(a : ARBRE) : CARDINAL;
   begin
     if estArbreVide(a) then 
        taille:= 0
     else
        taille:= 1 + taille(droit(a)) + taille(gauche(a)) ;
   end{taille};
     
   // hauteur(a) = longueur de la plus longue branche de a 
   function hauteur(a : ARBRE) : INTEGER;
   begin
     if estArbreVide(a) then
        hauteur := -1
     else 
        hauteur := 1 + max(hauteur(gauche(a)),hauteur(droit(a)));
   end{hauteur};

   // nombreFeuilles(a) = nombre de feuilles dans a
   function nombreFeuilles(a : ARBRE) : CARDINAL;
   begin
     if estArbreVide(a) then
        nombreFeuilles := 0
     else 
     begin
     if estArbreVide(gauche(a)) and estArbreVide(droit(a)) then
        nombreFeuilles := 1
     else
        nombreFeuilles := nombreFeuilles(gauche(a)) + nombreFeuilles(droit(a));
     end;
   end{nombreFeuilles};


   // accede � l'�lement situ� le plus a droite possible dans a
   // CU: a non vide
   function plusADroite(a : ARBRE) : ELEMENT;
   begin
     if estArbreVide(droit(a)) then
       plusADroite:= racine(a)
     else
       plusADroite:= plusADroite(droit(a));    
   end{plusADroite};
   
   // accede � l'�lement situ� le plus a gauche possible dans a
   // CU: a non vide
   function plusAGauche(a : ARBRE) : ELEMENT;
   begin
     if estArbreVide(gauche(a)) then
       plusAGauche:= racine(a)
     else
       plusAGauche:= plusAGauche(gauche(a));    
   end{plusAGauche};
   
   {************** AFFICHEUR **************}   
  
  //procedure d'affichage d'un arbre sous la forme < racine ; ss-arbre gauche ; ss-arbre droit >
  //avec l'arbre vide definit par <vide> 
  procedure afficherArbre(a:ARBRE);
  begin
    if (estArbreVide(a)) then begin
     write('vide');
    end else begin
      write('<',racine(a),';'); afficherArbre(gauche(a)); write(';'); afficherArbre(droit(a)); write('>');
    end;
  end;

  //procedure d'affichage d'un arbre dans l'ordre infix� 
  procedure infixe(a:ARBRE);
  begin
    if (estArbreVide(a)) then begin
    end else begin
     infixe(gauche(a));
      write(racine(a),',');
     infixe(droit(a)); 
    end;
  end;
  
  //procedure d'affichage d'un arbre dans l'ordre postfix� 
  procedure postfixe(a:ARBRE);
  begin
    if (estArbreVide(a)) then begin
    end else begin
     postfixe(gauche(a)); 
     postfixe(droit(a));
     write(racine(a),',');
    end;
  end;
  
  //procedure d'affichage d'un arbre dans l'ordre prefix� 
  procedure prefixe(a:ARBRE);
  begin
    if (estArbreVide(a)) then begin
    end else begin
     write(racine(a),',');
     prefixe(gauche(a));
     prefixe(droit(a)); 
    end;
  end;
  
  

   
INITIALIZATION
// arbre pere-fils

type
   pArbre = ^sommet;
   sommet = record
       // info ici
       left,right,pere: pArbre;
   end{pArbre};

//n retourner l'adresse de l'ancetre commun
function ancetre(x,y: pArbre): pArbre;
var ok: boolean;
    y2: pArbre;
begin
  ok:= FALSE;
  y2:= y;
  while (x <> NIL ) and not(ok) do
    begin
    y:= y2;
     while (y <> NIL) and not(ok) do
       if x=y then ok:= TRUE else y:=y^.pere;
     x:= x^.pere;
    end;
 ancetre:= y;  
end{ancetre};

procedure arbreTopArbre2(T: Arbre; var T2: pArbre; P: pArbre);
begin
  if T <> NIL then begin
     new(T2);
     {recopie des infos de T dans T2 ici}
     T2^.pere:= P;
     arbreTopArbre2(T^.left, T2^.left, T2);
     arbreTopArbre2(T^.right, T2^.right, T2);
     end
  else T2:= NIL;
end{arbreTopArbre2};

// Recopie arbre binaire en un arbre binaire doublement li�
// Apr�s ex�cution de la proc�dure, l"arbre initial est toujours
// pr�sent en m�moire.
procedure arbreTopArbre(T: Arbre; var T2: pArbre);
begin
  arbreTopArbre2(T,T2,NIL);
end{arbreTopArbre};

FINALIZATION 

(* remarque:
 
 arbre binaire:
 chaque noeud possede 2 fils au plus.
 et on a :
 => E(log2(n)) <= h <= n-1
 E(x) partie entiere inferieure du r�el x.
 
 arbre d�g�n�r� :
 si chacun de ses noeuds possede qu'un et un seul fils except� le noeud 
 le plus profond qui n'en possede aucun.
   n : taille 
   h : hauteur
  
  arbre binaire d�g�n�r�
  =>  n = h + 1 

 arbre complet :
 si ses noeuds poss�dent tous le meme nombre de fils et
 si toutes ses feuilles ont la meme hauteur.
 
 arbre binaire complet
 => n = 2^(h+i) -1
  
 arbre parfait :
 si tous les niveaux, sauf le dernier, sont complets;
 tous les noeuds du dernier niveaux doivent etre regroup� � gauche.
  
 arbre �quilibr� :
 si pour chacun de ses noeuds, la difference de hauteur
 entre le sous arbre le plus haut et le moins haut n'exc�de pas 1.
  
END.
