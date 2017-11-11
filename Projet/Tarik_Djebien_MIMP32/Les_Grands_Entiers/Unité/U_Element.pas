// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : octobre 2009
// objet  : Unité munie des opérations primitives sur le type ELEMENT

Unit U_Element;

Interface

const base = 10000; // b = 10⁴

type 
	ELEMENT = STRING;
	
   //ecriture du parametre e sur la sortie standard
   procedure ecrireElement ( const e : ELEMENT );

   //saisie de la valeur parametre e sur la sortie standard
   procedure lireElement ( out e : ELEMENT );

(* Prédicat *)

   // verification que la chaine de caractere s ne contient que des chiffres décimaux
   function estChaineValide(s : STRING) : BOOLEAN;
   
   // egal(e1,e2) = VRAI si et seulement si e1 = e2
   function egal(e1,e2: ELEMENT): BOOLEAN;

   // inferieur(e1,e2) = VRAI si et seulement si e1 < e2
   function inferieur(e1,e2: INTEGER): BOOLEAN;

   // inferieurOuEgal(e1,e2) = VRAI si et seulement si e1 <= e2
   function inferieurOuEgal(e1,e2: INTEGER): BOOLEAN;

 
   
Implementation

procedure ecrireElement ( const e : ELEMENT );
begin
writeln(e);
end;//ecrireElement

procedure lireElement ( out e : ELEMENT );
begin
readln(e);
end;//lireElement

(* Prédicat *)

   // verification que la chaine de caractere s ne contient que des chiffres décimaux
   // estChaineValide("1254785698569") = TRUE
   // estChaineValide("12547e5698569") = FALSE
   function estChaineValide(s : STRING) : BOOLEAN;
   var
      i : INTEGER;
      estValide : BOOLEAN;
   begin
     estValide := TRUE;
     i:= 1;
     if s = '' then 
        estValide := FALSE 
     else 
     begin
	 while (i <= length(s)) AND (estValide = TRUE) do 
	
	 if not(( ord(s[i]) >= 48 ) AND ( ord(s[i]) <= 57 )) then
	 estValide := FALSE
	 else
	 i:= i+1;
 	end;
   estChaineValide := estValide;
   end{estChaineValide};
   
   // egal(e1,e2) = VRAI si et seulement si e1 = e2
   function egal(e1,e2: ELEMENT): BOOLEAN;
   var test : BOOLEAN;
	   i :    INTEGER;
   begin
     test := TRUE;
     if (length(e1) <> length(e2)) then
     test := FALSE
     else
      begin
        for i:=1 to length(e1) do
          begin
            if e1[i] <> e2[i] then
               test:= FALSE;
          end;
      end;
     egal:= test;
   end;//egal


   // inferieur(e1,e2) = VRAI si et seulement si e1 < e2
   function inferieur(e1,e2: INTEGER): BOOLEAN;
   begin
     inferieur:= (e1 < e2);
   end;//inferieur


   // inferieurOuEgal(e1,e2) = VRAI si et seulement si e1 <= e2
   function inferieurOuEgal(e1,e2: INTEGER): BOOLEAN;
   begin
     inferieurOuEgal:= (e1 <= e2);
   end;//inferieurOuEgal

  


Initialization

Finalization

end.
