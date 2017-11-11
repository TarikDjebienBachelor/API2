// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Unité sur le type GDENTIER

{   Motivation et objectifs du travail :

	Le type CARDINAL de Pascal ne permet de manipuler que les
    entiers de l'intervalle [0, 2^32 − 1].
    Le but de ce travail consiste à
    - définir un type de données pour représenter des entiers quelconques sans aucune limitation.
      On se contentera de représenter les entiers positifs ou nuls.
    - programmer deux procédures d'interface entre cette représentation et celle de l'utilisateur.
    - programmer les opérations arithmétiques de base.
    - programmer les opérateurs de comparaison.
}

UNIT U_Grands_Entiers;



INTERFACE
   uses U_Liste,
   		U_Element,
        SysUtils;
   


(*   GDENTIER(E) =  (ZERO) U ( E x GDENTIER(E) )   *)
(*   or ZERO = () donc                             *)
(*   GDENTIER(E) = LISTE(E)                        *)

   type 
     GDENTIER = LISTE;

   const
     ZERO : GDENTIER = NIL;



(* Transtypage *)

   // string2GDEntier() = liste des chiffres de
   // l’entier désigné par s
   // CU : s ne contient que des chiffres décimaux
   function string2GDEntier(s : STRING) : GDENTIER;
   
   // GDEntier2String() = Chaine de caracteres de
   // l’entier désigné par la liste des chiffres 
   function GDEntier2String(g : GDENTIER) : STRING;

(* Procédures d'entrée/sortie *)  
 
   //saisie de la valeur parametre n sur la sortie standard
   procedure lireGDEntier(out n : GDENTIER);
   
   //ecriture du parametre n sur la sortie standard
   procedure ecrireGDEntier(const n : GDENTIER);
   
(* Accesseur: Taille d'un grand entier *)
 
   // tailleGDEntier(n) = nombre de chiffres de l’écriture décimale
   // de n.
   // La taille donnée peut dépasser légèrement la taille réelle.
   function tailleGDEntier(n : GDENTIER) : CARDINAL;
   
(* Opérateurs arithmétiques *)

   // add(n1 ,n2 ) = n1 + n2
   function add(n1,n2 : GDENTIER) : GDENTIER;

   // mult(n1 ,n2 ) = n1 × n2
   function mult(n1,n2 : GDENTIER) : GDENTIER;
   
   // puissance(a,n) = a^n
   function puissance(a : GDENTIER; n : CARDINAL) : GDENTIER;
   
(*  Question 10.
    Pourquoi dans la programmation de la fonction puissance se limiter au cas où l'exposant
    est un CARDINAL ?
    En programmation le compteur de la boucle de la fonction puissance ne peut etre que de type entier. 
    De plus le plus grand Cardinal vaut 2^32 − 1 , comme exposant d'une puissance c'est suffisant.
*)

(* Opérateurs de comparaison *)
 
   // compare(n1 ,n2 ) = -1 si n1 < n2
   //                     0 si n1 = n2
   //                     1 si n1 > n2
   function compare(n1,n2 : GDENTIER) : INTEGER;
   
   //fonction auxiliaire utile pour compare
   function aux(n1,n2: GDENTIER) : INTEGER;
   
(* Question 12.               
   Réalisez un programme illustant les différentes procédures et opérations. 
   Votre programme pourra par exemple montrer le calcul de la factorielle de 100. 
 *)

(*
 Pour chaque fonction ou procédure de la partie interface réalisée, vous écrirez un programme de
 test. Ce programme de test prendra ses éventuels arguments sur la ligne de commande.
*)



IMPLEMENTATION




(* Transtypage *)

   // string2GDEntier() = liste des chiffres de
   // l’entier désigné par s
   // CU : s ne contient que des chiffres décimaux
   function string2GDEntier(s : STRING) : GDENTIER;
   var
      i : INTEGER;
      estZero : BOOLEAN;
      G : GDENTIER;
   begin
     // Initialisation
     new(G);
     i := 1;
     estZero := TRUE;
     
     // Cas où l'expression reguliere de s vaut 0(0)* 
     while (estZero = TRUE ) AND (i <= length(s)) do
     begin
     if s[i] = '0' then
       inc(i)
     else
       estZero:= FALSE
     end;//while
     
     
     
     // string2GDEntier("3141592") = (1592, 314)
     if ((estZero = TRUE) AND (s <> '')) then
        G := ZERO
     else
     begin
       if length(s) <= 4 then 
          G^.info:= s
       else
         begin
          G^.info:= copy(s,(length(s)+1) - 4 , 4);
          G^.suivant:= string2GDEntier(copy(s,1,length(s) - 4));
         end;
     end;
     string2GDEntier:= G;
   end{string2GDEntier};
   
   
   // GDEntier2String() = Chaine de caracteres de
   // l’entier désigné par la liste des chiffres 
   function GDEntier2String(g : GDENTIER) : STRING;
   var S : STRING;
   begin
   if g = ZERO then
   begin
   S:= '0';
   GDEntier2String:= S;
   end
   else 
   begin
     S:= '';
     while not(estListeVide(g)) do
     begin
       S:= tete(g) + S;
       g:= reste(g);
     end;
     GDEntier2String:= S;
   end;
   end{GDEntier2String};

(* Procédures d'entrée/sortie *)  
   
   //saisie de la valeur parametre n sur la sortie standard
   procedure lireGDEntier(out n : GDENTIER);
   var
     S : STRING;
   begin
     readln(S);
     n := string2GDEntier(S)
   end{lireGDEntier};
   
   //ecriture du parametre n sur la sortie standard
   procedure ecrireGDEntier(const n : GDENTIER);
   var S : STRING;
       i : INTEGER;
   begin
     if n = ZERO then
     write('0')
     else
     begin
     i:=1;
     S:= GDEntier2String(n);
     // suppression des chiffres zeros inutiles sur l'affichage
     if S[1] = '0' then
      begin
        while (S[i] = '0') AND (i < length(S)) do inc(i);
        S:= copy(S,i,(length(S)+1)-i);
        write(S);
      end
     else
     write(S);
     end;
   end{ecrireGDEntier};

(* Accesseur: Taille d'un grand entier *)
 
   // tailleGDEntier(n) = nombre de chiffres de l’écriture décimale
   // de n.
   // La taille donnée peut dépasser légèrement la taille réelle.
   function tailleGDEntier(n : GDENTIER) : CARDINAL;
   begin
      if n = zero then
         tailleGDEntier := 1
      else
         if (reste(n)) = LISTEVIDE then
            tailleGDEntier := length(IntToStr(StrToInt(tete(n)))) // (*)
         else
            tailleGDEntier := 4 + tailleGDEntier(reste(n))
   // on aurai eu :
   // tailleReelle(n) <= tailleGDEntier(n) <= tailleReelle(n) + 4
   // si le double cast en (*) est ignoré
   // mais grâce à cette astuce on obtient exactement la taille réelle.  
   end{tailleGDEntier};
   
(* Opérateurs arithmétiques *)


(********************ADDITION****************************)

   // add(n1 ,n2 ) = n1 + n2
   function add(n1,n2 : GDENTIER) : GDENTIER;
   var ret,n,p: INTEGER;
       paquet: STRING;
       C_n1,C_n2: GDENTIER;
       res:   GDENTIER;    
   const
       quadruplet = '0000';
       triplet    =  '000';
       doublet    =   '00';
       singleton  =    '0';
   begin
    //initialisation
    res:= LISTEVIDE;
    ret:= 0;
    n  := 0;
    p  := 0;
    C_n1:= cloner(n1);
    C_n2:= cloner(n2);
    
    // cas tailleGrandEntier(n1) = tailleGrandEntier(n2)
    while (not estListeVide(n1) AND not estListeVide(n2) )  do 
    begin
      // Sauvegarde de la retenue
      n:= ret;
      // reinitialisation de la retenue et du paquet
      ret:= 0;
      paquet:= '';
      
      // ADDITION des 4bits de poids faibles
      // borne inferieure de n : 0
      // borne superieure de n : 9999 + 9999 = 19998 = (9998,0001)
      // valeur possible de la retenue dans la base 10⁴ : 0 ou 1
      n:= n + StrToInt(tete(n1)) +  StrToInt(tete(n2));
      
      // Disjonction des cas sur n
      
      // cas: n = 0
      if ( n = 0 ) then 
      	ajouteenfin(quadruplet,res);
      
      // cas: 0 < n <= 9
      if ( ( n > 0 ) AND ( n <= 9 ) ) then
        begin
          paquet:= triplet + IntToStr(n);
          ajouteEnFin(paquet,res); 
        end;
      // cas: 10 <= n <= 99
      if ( ( n >= 10 ) AND ( n <= 99 ) ) then
        begin
          paquet:= doublet + IntToStr(n);
          ajouteEnFin(paquet,res); 
        end;
      // cas: 100 <= n <= 999
      if ( ( n >= 100 ) AND ( n <= 999 ) ) then
        begin
          paquet:= singleton + IntToStr(n);
          ajouteEnFin(paquet,res); 
        end;
      // cas: 1000 <= n <= 9999
      if ( ( n >= 1000 ) AND ( n <= 9999 ) ) then
        begin
          paquet:= IntToStr(n);
          ajouteEnFin(paquet,res); 
        end;
      
      // Overflow : cas n >= 10000 
      if n >= base then
      begin
        // si n est un multiple de la base 
        if ((n mod base) = 0) then 
          begin
          paquet:= quadruplet;
          ajouteEnFin(paquet,res);
          ret := n div base;
          end
        else
          begin
          p:= n mod base;
          
          // cas: 0 < p <= 9
          if ( ( p > 0 ) AND ( p <= 9 ) ) then
          begin
          paquet:= triplet + IntToStr(p);
          ajouteEnFin(paquet,res); 
          end;
          // cas: 10 <= p <= 99
          if ( ( p >= 10 ) AND ( p <= 99 ) ) then
          begin
          paquet:= doublet + IntToStr(p);
          ajouteEnFin(paquet,res); 
          end;
          // cas: 100 <= p <= 999
          if ( ( p >= 100 ) AND ( p <= 999 ) ) then
          begin
          paquet:= singleton + IntToStr(p);
          ajouteEnFin(paquet,res); 
          end;
          // cas: 1000 <= p <= 9999
          if ( ( p >= 1000 ) AND ( p <= 9999 ) ) then
          begin
          paquet:= IntToStr(p);
          ajouteEnFin(paquet,res); 
          end;
         
          ret := n div base;
          end;//if
        end;//if
      // On passe au paquet suivant
      n1:= reste(n1);
      n2:= reste(n2);  
    end;//while
    

    
    // cas où tailleGDEntier n1 > n2 ET retenue = 0	
    if (estListeVide(n2)) AND not(estListeVide(n1)) AND ( ret = 0 ) then
       begin
         while not(estListeVide(n1)) do 
         begin
           ajouteEnFin(tete(n1),res);
           n1:= reste(n1);
         end;//while  
       end;//if
    
    // cas où tailleGDEntier n1 > n2 ET retenue <> 0	
    if (estListeVide(n2)) AND not(estListeVide(n1)) AND ( ret <> 0 ) then
       begin
        while not(estListeVide(n1)) do 
         begin
          // sauvegarde et reinitialisation de la retenue
          n := ret;
          ret:= 0;
          n := n + StrToInt(tete(n1));
          // cas où il n'y a pas de propagation de la retenue
          if n < base then 
             begin
               ajouteEnFin(IntToStr(n),res);
               n1:= reste(n1);
               while not(estListeVide(n1)) do
                begin
                 ajouteEnFin(tete(n1),res);
                 n1:= reste(n1);
                end;//while
             end;//if
          // cas où il y a propagation de la retenue
          if n >= base then
          begin
          // si n est un multiple de la base 
            if ((n mod base) = 0) then 
              begin
              paquet:= quadruplet;
              ajouteEnFin(paquet,res);
              ret := n div base;
              n1:= reste(n1);
              end
            else
              begin
              paquet:= IntToStr(n mod base);
              ajouteEnFin(paquet,res); 
              ret := n div base;
              n1:= reste(n1);
            end;//if
          end;//if
        end;//while  
    end;//if
    
    // cas où tailleGDEntier n1 < n2 ET retenue = 0	
    if (estListeVide(n1)) AND not(estListeVide(n2)) AND ( ret = 0 ) then
       begin
         while not(estListeVide(n2)) do 
         begin
           ajouteEnFin(tete(n2),res);
           n2:= reste(n2);
         end;//while  
       end;//if
    
    // cas où tailleGDEntier n1 < n2 ET retenue <> 0	
    if (estListeVide(n1)) AND not(estListeVide(n2)) AND ( ret <> 0 ) then
       begin
        while not(estListeVide(n2)) do 
         begin
          // sauvegarde et reinitialisation de la retenue
          n := ret;
          ret:= 0;
          n := n + StrToInt(tete(n2));
          // cas où il n'y a pas de propagation de la retenue
          if n < base then 
             begin
               ajouteEnFin(IntToStr(n),res);
               n2:= reste(n2);
               while not(estListeVide(n2)) do
                begin
                 ajouteEnFin(tete(n2),res);
                 n2:= reste(n2);
                end;//while
             end;//if
          // cas où il y a propagation de la retenue
          if n >= base then
          begin
          // si n est un multiple de la base 
            if ((n mod base) = 0) then 
              begin
              paquet:= quadruplet;
              ajouteEnFin(paquet,res);
              ret := n div base;
              n2:= reste(n2);
              end
            else
              begin
              paquet:= IntToStr(n mod base);
              ajouteEnFin(paquet,res); 
              ret := n div base;
              n2:= reste(n2);
            end;//if
          end;//if
        end;//while  
    end;//if
    
    // retenue finale issue de l'addition des 4bits de poids forts
    if (estListeVide(n1)) AND (estListeVide(n2)) AND (ret <> 0) then 
    	ajouteEnFin(IntToStr(ret),res);
    
    // Element neutre de l'addition 
    // e + 0 = 0 + e = e
    if (C_n1 = ZERO) then 
        add:= C_n2
    else if (C_n2 = ZERO) then 
        add:= C_n1
    else
        add:= res;
   end{add};

(********************MULTIPLICATION********************)

   // mult(n1 ,n2 ) = n1 × n2
   function mult(n1,n2 : GDENTIER) : GDENTIER;
   var
	   res,m1,m2,G,D,E,C_n1,C_n2 : GDENTIER;
	   s,longueur,i,j,ret : INTEGER;
	   x,reste,quadruplet : STRING;

	
   begin
	 //initialisation des variables
	 m1:= n1; m2:= n2;
	 G:= ZERO; D:= ZERO; res:= ZERO; E:= ZERO;
	 j:= 0; 
	 quadruplet:= '0000';
	 ret:= 0;	
     C_n1:= cloner(n1);
     C_n2:= cloner(n2);
     
	//debut de la grande boucle
	while m2 <> ZERO do
	begin
	
		//debut de la petite boucle
		while (m1 <> ZERO) OR (ret <> 0) do
		begin
			
			if m1 <> ZERO then
			s:= ret + StrToInt(tete(m1)) * StrToInt(tete(m2))
			else
			s:= ret;
			longueur:= length(IntToStr(s));
			if longueur > 4 then
			begin
				x:= copy(IntToStr(s),longueur-3,4);
				G:= ajouteEnTete(x,G);
				reste:= copy(IntToStr(s),1,longueur-4);
				ret:= StrToInt(reste);
			end{if}
			else
			begin
				G:= ajouteEnTete(IntToStr(s),G);
				ret:= 0;
			end{else};
			if m1 <> ZERO then
			m1:= m1^.suivant;
		end{petite boucle while};
		
		while G <> ZERO do
		begin
			E:=ajouteEnTete(tete(G),E);
			G:= G^.suivant;
		end{while};

		G:= INV;
		E:= ZERO;
		D:= add(G,D);
		G:= ZERO;
		
		For i:=0 to j do
		begin
			G:= ajouteEnTete(quadruplet,G);
		end{for};
		
		j:= j+1;
		m1:= n1;
		m2:= m2^.suivant;
	end{grande boucle while};

	res:= D;
	// Element neutre de la multiplication 
    // e + 0 = 0 + e = e
    if (C_n1 = string2GDEntier('1')) then 
        mult:= C_n2
    else if (C_n2 = string2GDEntier('1')) then 
        mult:= C_n1
    else
	mult:= res;
	    
   end{mult};

(***********************PUISSANCE*************************)
   // puissance(a,n) = a^n
   function puissance(a : GDENTIER; n : CARDINAL) : GDENTIER;
   var i : CARDINAL;
       res : GDENTIER;
   begin
   res := string2GDEntier('1');
   for i:= 1 to n do
    res := mult(res,a);
   puissance:= res;
   end{puissance};

(* Opérateurs de comparaison *)
 
   // compare(n1 ,n2 ) = -1 si n1 < n2
   //                     0 si n1 = n2
   //                     1 si n1 > n2
   function compare(n1,n2 : GDENTIER) : INTEGER;
   begin
   //cas particulier
   if (n1 = ZERO) AND (n2 = ZERO) then compare:= 0 else
   if (n1 = ZERO) AND (n2 <> ZERO) then compare:= -1 else
   if (n1 <> ZERO) AND (n2 = ZERO) then compare:= 1 else
   //cas général
   if egalite(n1,n2)=TRUE then compare:= 0 else
   if tailleGDEntier(n1) > tailleGDEntier(n2) then 
   compare:= 1 
   else
   if tailleGDEntier(n1) < tailleGDEntier(n2) then 
   compare:= -1
   else
   if tailleGDEntier(n1) = tailleGDEntier(n2) then
   compare:= aux(cloner(n1),cloner(n2));
   end{compare};
   
   // Prérequis : tailleGDEntier(n1) = tailleGDEntier(n2) 
   // aux(n1,n2) = -1 si n1 < n2
   //               1 si n1 > n2
   function aux(n1,n2: GDENTIER) : INTEGER;
   begin
     if StrToInt(tete(dernier(n1))) > StrToInt(tete(dernier(n2))) then
         aux := 1 
     else if StrToInt(tete(dernier(n1))) < StrToInt(tete(dernier(n2))) then
         aux := -1
     else begin
        supprimerDernier(n1);
        supprimerDernier(n2);
        aux:=aux(n1,n2);
        end; 
   end{aux};
   
   
INITIALIZATION
(* UNITE sur le type GDENTIER. *)
(* ANNEXE : Prototypes de fonctions usuelles sur les chaines de caractères *)

(* Longueur d'une chaîne 
  
  // length(s) = nombre de caractères dans s
  function length(s : STRING) : CARDINAL;
*)
 
(* Sous-chaîne 
  
  // copy(s,i,l) = sous-chaîne de s de longueur l
  // débutant à l’indice i
  function copy(s : STRING; i,l : CARDINAL) : STRING;
  
  Faîtes des tests avec cette fonction avant de l'utiliser 
  pour étudier son comportement avec des valeurs
  des paramètres i et l dépassant les limites de la chaîne s.
*)

(* Transtypage de chaines de caractères 
  
  // Conversion d'un entier en une chaîne de caractères
  // IntToStr(n) = chaine de caractères représentant l’écriture
  // décimale de l’entier n.
  function IntToStr(const n : INTEGER) : STRING;
  
  Remarque : cette fonction fait partie de l'unité SysUtils.
   
  // Conversion d'une chaîne de caractères en un entier
  // StrToInt(s) = l’entier représenté par
  // la chaîne de caractères s.
  function StrToInt(const s : STRING ) : INTEGER;
  
  Remarque : cette fonction fait partie de l'unité SysUtils.
*)

FINALIZATION     
(* Merci d'avance pour vos nombreuses remarques qui pourraient corriger et ameliorer cette unité *)
(* Cordialement, Djebien Tarik *)
END.{FIN DE L'UNITE SUR LES GRANDS ENTIERS}
