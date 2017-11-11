// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Unité munie d'opérations sur la structure de donnée lineaire de type Liste
UNIT U_Liste;



INTERFACE
   uses U_Element,SysUtils;
   
   
  
(*          _      _____________      _            *)            
(* LISTE = |_|--->|______|______|--->|_| = LISTE   *)
(*                  info  suivant                  *)

   type 
     LISTE = ^CELLULE;
     CELLULE = record
       info : ELEMENT;
       suivant : LISTE;
     end{CELLULE};

   const
     LISTEVIDE : LISTE = NIL;



(* Constructeur *)
   
   // ajouteEnTete(e,l) = < e;l >
   // ajoute un nouvel élément e au debut de la liste l
   function ajouteEnTete(e: ELEMENT ; l: LISTE): LISTE;
   
   // insere(e,l) = nouvelle liste avec l'élement e
   // inserer au premier rang ou e ne depasse pas l'élement suivant
   // si l est triée, la liste obtenue est triée.
   function insere(const e: ELEMENT ; const L: LISTE ): LISTE;

(* Constructeur de copie *)   

   // cloner(l) duplique la liste l
   function cloner(L: LISTE): LISTE;
   
   
(* Sélecteurs *)
   
   // tete(l) = le premier élement de la liste l
   // CU : l non vide
   function tete(l: LISTE): ELEMENT;

   // reste(l) = la liste qui suit le premier élement de la liste l
   // CU : l non vide
   function reste(l: LISTE): LISTE;

   // dernier(L) = 
   // la liste debutant au dernier élément de la liste L
   // si L n'est pas vide 
   // sinon on renvoie la liste Vide.
   function dernier(const L: LISTE): LISTE;
   
(* Accesseurs *)
   
   // longueur(L) = nombre d'élements de la liste L
   // L = (1,2,3,4,5)
   // longueur(L) = 5
   function longueur(L: LISTE): INTEGER;
   
   // donne la liste débutant au k-ième élement de L
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L)
   function acces(k: CARDINAL ; L: LISTE ): LISTE;
   
   // donne l'élement de la liste L situé au rang k
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L)
   function elementRang(k: CARDINAL ; L: LISTE ): ELEMENT;
   
   // premiereOccur(e,L) =
   // la liste débutant à la premiere occurence
   // de e dans la liste L si elle existe
   // sinon on renvoie la liste Vide.
   function premiereOccur(const e: ELEMENT ; const L: LISTE): LISTE;

   // derniereOccur(e,L) =
   // la liste débutant à la derniere occurence
   // de e dans la liste L si elle existe 
   // sinon on renvoie la liste Vide.
   function derniereOccur(const e: ELEMENT ; const L: LISTE): LISTE;
   
   // donne le rang k de la 1ere occurence de l'élement e dans la liste L
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L)
   function rangPremierElement(const e: ELEMENT ; const L: LISTE): CARDINAL;

   // donne le rang k de la derniere occurence de l'élement e dans la liste L
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L) 
   function rangDernierElement(const e: ELEMENT ; const L: LISTE): CARDINAL;
   
(* Prédicat *)
   
   // estListeVide(l) <=> l est vide
   function estListeVide(l: LISTE): BOOLEAN;
   
   // estTriee(L) = VRAI si et seulement si
   // la liste L est triée selon la relation d'ordre '<='
   function estTriee(L: LISTE): BOOLEAN ; 

   // contient(l,ls) = VRAI si et seulement si
   // sl inclut dans l <=>  sl c l
   function contient(l:Liste; sl:Liste):Boolean;

   // estListePalindrome(L) = VRAI si et seulement si
   // Les elements de L forment un Palindrome
   function estListePalindrome(const L: LISTE): BOOLEAN;
   
(* Opérateurs *)

   // CONCATENATION '+' 
   // L1 = < e,l1 >  ;  L2 = < f,l2 >
   // L3 = L1 + L2 = < e,l1,f,l2 >
   function concatener(const L1: LISTE ; const L2: LISTE): LISTE;

   // EGALITE '='
   // VRAI si et seulement si L1 = L2
   function egalite(const L1: LISTE ; const L2: LISTE): BOOLEAN;
      
(* Opérations modificatrices *)
 
   // modifierTete(l,e) modifie la valeur de l'element en tete de l
   // CU : l non vide
   procedure modifierTete(const l: LISTE ; const e : ELEMENT);

   // modifierReste(l,ll) modifie la valeur du reste de la liste l 
   // en lui attribuant la liste ll
   // CU : l non vide
   procedure modifierReste(const l: LISTE ; const ll: LISTE);
   
   // ajouteEnFin(e,l) = < l;e >
   // ajoute un nouvel élément e à la fin de la liste l
   // la liste l est modifiée
   procedure ajouteEnFin(const e: ELEMENT ; var l: LISTE);
   
   // inserer(e,l,k): insere un nouvel élement e au rang k dans l
   // la liste l est modifiée
   // CU : 0 <= k <= longueur(l)
   procedure inserer(const e: ELEMENT ; const l: LISTE ; const k: CARDINAL );
   
   // insererDansLeTri(e,l) = modifie la liste l en insérant l’élément
   // e au premier rang où e ne dépasse pas l’élément suivant
   // si l est triée avant, l est encore triée après
   // CU : e est une liste à un seul élément
   procedure insererDansLeTri(const e: LISTE ; var L: LISTE );
   
   // mirroir(1,2,3,4,5) = (5,4,3,2,1)
   function miroir(const L: LISTE): LISTE; 

(* Tri sur les listes *)

   // trie(l) = liste triée contenant les mêmes éléments que l
   function trie(l : LISTE) : LISTE;
   
   // trier(l) trie la liste l
   // la liste l est modifiée
   // aucune création de cellules n’est effectuée
   procedure trier(var L : LISTE);
   
(* Afficheur *)

   // Affiche les élements de la liste avec les parentheses
   // exemple : (3,4,5,7,...)
   procedure AfficherListe(const L: LISTE);
   
(* Destructeur *)
    
   // desallouer(l) : libere l'espace memoire alloue
   // pour chaque cellule de la liste l
   procedure desallouer(var l : LISTE);

   // supprimer(l,e) supprime toutes les occurrences de e dans l.
   // Si e n’existe pas la liste ne sera pas modifiée.
   procedure supprimerOccurence(var l: LISTE; const elt: ELEMENT);
   
   // supprimerTete(l) : detruit la tete element de l
   // CU : l non vide
   procedure supprimerTete(var l : LISTE);
   
  // supprimerDernier(l) : detruit le dernier element de l
  // CU : l non vide
  procedure supprimerDernier(var l : LISTE);




IMPLEMENTATION



(* Constructeur *)

   // ajouteEnTete(e,l) = < e;l >
   // ajoute un nouvel élément e au debut de la liste l
   function ajouteEnTete(e: ELEMENT ; l: LISTE): LISTE;
   var l1 : LISTE;
   begin
     new(l1);
     l1^.info := e;
     l1^.suivant := l;
     ajouteEnTete := l1;
   end{ajouteEnTete};
   
   // insere(e,l) = nouvelle liste avec l'élement e
   // inserer au premier rang ou e ne depasse pas l'élement suivant
   // si l est triée, la liste obtenue est triée.
   function insere(const e : ELEMENT ; const L : LISTE) : LISTE;
   begin
      if estListeVide(L) then begin
         insere := ajouteEnTete(e,L);
      end else begin
         if  inferieur(StrToInt(e),StrToInt(tete(L)))  then begin
            insere := ajouteEnTete(e,cloner(L));
         end else begin
            insere := ajouteEnTete( tete(L),insere(e,reste(L)) );
         end;
      end;
   end;{insere}
   


(* Constructeur de copie *)      
    
    // copie de la liste l
    function cloner(L: LISTE): LISTE;
    var
    anc,nouv,debut: LISTE;
    begin
      if estListeVide(L) then 
         cloner:= nil
      else 
        begin
        new(debut);
        debut^.info:= L^.info;
        anc:= debut;
        anc^.suivant:= nil;
        L:= L^.suivant;
        while ( not estListeVide(L) ) do begin
          new(nouv);
          nouv^.info:= L^.info;
          nouv^.suivant:= nil;
          anc^.suivant:= nouv;
          anc:= nouv;
          L:= L^.suivant;
        end;
      cloner:= debut;
      end;
    end{cloner};



(* Sélecteurs *)

   // tete(l) = le premier élement de la liste l
   // CU : l non vide
   function tete(l: LISTE): ELEMENT;
   begin
     if not(estListeVide(l)) then
       tete := l^.info
     else
       writeln('la liste est vide');
   end{tete};

   // reste(l) = la liste qui suit le premier élement de la liste l
   // CU : l non vide
   function reste(l: LISTE): LISTE;
   begin
     if not(estListeVide(l)) then
       reste:= l^.suivant
     else
       writeln('la liste est vide');
   end{reste};

   // dernier(L) = 
   // la liste debutant au dernier élément de la liste L
   // si L n'est pas vide 
   // sinon on renvoie la liste Vide.
   function dernier(const L: LISTE): LISTE;
   begin
    if estListeVide(L) then
       dernier := LISTEVIDE
    else if estListeVide(reste(L)) then
       dernier := L
    else
       dernier := dernier(reste(L));
   end{dernier};
   


(* Accesseurs *)

   // version Recursive de la longueur
   // longueur(L) = nombre d'élements de la liste L
   function longueur(L: LISTE): INTEGER;
   begin
      if estListeVide(L) then
         longueur:= 0
      else
         longueur:= 1 + longueur(reste(L));
   end{longueur};
      
   // donne la liste débutant au k-ième élement de L
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L)
   function acces(k: CARDINAL ; L: LISTE ): LISTE;
   begin
     if k=0 then
       acces:= L
     else
       acces:= acces(k-1,reste(L));
   end{acces};

   // donne l'élement de la liste L situé au rang k
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L)
   function elementRang(k: CARDINAL ; L: LISTE ): ELEMENT;
   begin
      elementRang := tete(acces(k,L));
   end{elementRang};

   // premiereOccur(e,L) =
   // la liste débutant à la premiere occurence
   // de e dans la liste L si elle existe
   // sinon on renvoie la liste Vide.
   function premiereOccur(const e: ELEMENT ; const L: LISTE): LISTE;
   begin
     if estListeVide(L) then
         premiereOccur := LISTEVIDE
     else
       if tete(L) = e then
         premiereOccur := L
       else
         premiereOccur:= premiereOccur(e,reste(L));
   end{premiereOccur};
      
   // derniereOccur(e,L) =
   // la liste débutant à la derniere occurence
   // de e dans la liste L si elle existe 
   // sinon on renvoie la liste Vide.
   function derniereOccur(const e: ELEMENT ; const L: LISTE): LISTE;
   var L1 : LISTE;
   begin
    if estListeVide(L) then
      derniereOccur := LISTEVIDE
    else begin
      L1 := derniereOccur(e,reste(L));
      if estListeVide(L1) and (tete(L) = e) then
        derniereOccur := L
      else
        derniereOccur := L1;
      end{if};
   end{derniereOccur};

   // donne le rang k de la 1ere occurence de l'élement e dans la liste L
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L) 
   function rangPremierElement(const e: ELEMENT ; const L: LISTE): CARDINAL;
   begin
     rangPremierElement := longueur(L) - longueur(premiereOccur(e,L));
   end{rangPremierElement};

   // donne le rang k de la derniere occurence de l'élement e dans la liste L
   // les élements étant numerotés à partir de zero
   // CU : 0 <= k < longueur(L) 
   function rangDernierElement(const e: ELEMENT ; const L: LISTE): CARDINAL;
   begin
     rangDernierElement := longueur(L) - longueur(derniereOccur(e,L));
   end{rangDernierElement};



(* Prédicat *)

   // estListeVide(l) <=> l est vide
   function estListeVide(l: LISTE): BOOLEAN;
   begin
     estListeVide :=  (l = NIL);
   end{estListeVide};
   
   // estTriee(L) = VRAI si et seulement si
   // la liste L est triée selon la relation d'ordre '<='
   function estTriee(L: LISTE): BOOLEAN ;
   begin
     // condition d'arret :
     // une liste L vide est par convention deja triée
     if estListeVide(L) then
        estTriee:= TRUE  
     else 
      // si non( tete_L <= suivant(tete_L) ) ET (le reste de L n'est pas vide) est VRAI alors   
      if ((not(estListeVide(reste(L)))) and (not(inferieurOuEgal(StrToInt(tete(L)),StrToInt(tete(reste(L))))))) then
          // L n'est pas triée  
          estTriee:= FALSE 
      else
          // recursivité :
          // sinon on rapelle estTriee sur le reste de L
          estTriee:= estTriee(reste(L));   
   end{estTriee};

   // contient(l,ls) = VRAI si et seulement si
   // ls est inclut dans l, autrement dit,
   // ls est une sous-liste de l.
   function contient(l:Liste; sl:Liste):Boolean;
   var
     cl,cls: Liste;
     trouve,cont: Boolean;
   begin
     trouve:= false;
     while ( (not estListeVide(l)) and (not trouve) ) do begin
       cl:= l;
       cls:= sl;
       cont:= true;
       while ((not estListeVide(cls)) and (not estListeVide(cl)) and cont) do
         if not(egal( cls^.info , cl^.info )) then 
           cont := false
         else begin
           cls := cls^.suivant;
           cl  := cl^.suivant;
         end;
       trouve := estListeVide(cls);
       l:= l^.suivant;
     end;
     contient := trouve;
   end{contient};

   // estListePalindrome(L) = VRAI si et seulement si
   // Les elements de L forment un Palindrome
   // exemple : L = (5,4,3,4,5)
   function estListePalindrome(const L: LISTE): BOOLEAN;
   begin
     // par convention la liste vide est un palindrome
     if estListeVide(L) then
     estListePalindrome := TRUE
     else
     estListePalindrome := egalite(L, miroir(L));
   end{estListePalindrome};

(* Opérateurs *)

   // CONCATENATION 
   // L1 = < e,l1 >  ;  L2 = < f,l2 >
   // L3 = L1 + L2 = < e,l1,f,l2 >
   // on ne modifie pas L1 et L2
   function concatener(const L1: LISTE ; const L2: LISTE): LISTE;
   var cl1,cl2,courant : LISTE;
   begin
     cl1 := cloner(L1);
     cl2 := cloner(L2);
     if estListeVide(cl1) then
        concatener:= cl2
     else
      begin
        courant := cl1;
         while not(estListeVide(courant^.suivant))do
           courant:= courant^.suivant;
        courant^.suivant := cl2;
        concatener := cl1;
      end; 
   end{concatener};

   // EGALITE
   // L1 = L2 si et seulement si
   // (L1 c L2) ET (L2 c L1)
   function egalite(const L1: LISTE ; const L2: LISTE): BOOLEAN;
   begin
     egalite := ( contient(L1,L2) ) AND ( contient(L2,L1) ) ;
   end{egalite};
   
   
(* Opérations modificatrices *)

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

   // ajouteEnFin(e,l) = < l;e >
   // ajoute un nouvel élément e à la fin de la liste l
   // la liste l est modifiée
   procedure ajouteEnFin(const e: ELEMENT ; var l: LISTE);
   var L1,L2 : LISTE;
   begin
     L1 := dernier(l);
     L2 := ajouteEnTete(e,LISTEVIDE);
     if estListeVide(L1) then
       l:= L2
     else
       modifierReste(L1,L2);
   end{ajouteEnFin};

   // inserer(e,l,k): insere un nouvel élement e au rang k dans l
   // la liste l est modifiée
   // CU : 1 <= k <= longueur(l)
   procedure inserer(const e: ELEMENT ; const l: LISTE ; const k: CARDINAL );
   var L1,L2: LISTE;
   begin
      if not(k > CARDINAL(longueur(L))) AND (k<>0)  then
      begin
          L1 := acces(k-1,l);
          L2 := ajouteEnTete(e,reste(L1));
          modifierReste(L1,L2);
      end
      else 
        writeln(' Respectez la Condition d''Utilisation : 1 <= k <= longueur(l)');
   end{inserer};  

   // insererDansLeTri(e,l) = modifie la liste l en insérant l’élément
   // e au premier rang où e ne dépasse pas l’élément suivant
   // si l est triée avant, l est encore triée après
   // CU : e est une liste à un seul élément
   procedure insererDansLeTri(const e: LISTE ; var L: LISTE );
   begin
     if longueur(e) = 1 then
       L:= insere(tete(e),L)
     else
       writeln('la liste en premier parametre doit contenir un seul élement');
   end{insere};

   // fonction auxiliaire pour miroir
   function reflet(l1:liste ; l2:liste):liste;
   begin
     if estlistevide(l1) then
        reflet := l2
     else 
        reflet := reflet(reste(l1),ajouteEnTete(tete(l1),l2));
   end;{aux}
   
   
   // mirroir(1,2,3,4,5) = (5,4,3,2,1)
   function miroir(const L: LISTE): LISTE;
   begin
      miroir := reflet(L,LISTEVIDE);
   end; {miroir}



(* Tri sur les listes *)

   // trie(l) = liste triée contenant les mêmes éléments que l
   function trie(l : LISTE) : LISTE;
   // L'algorithme de tri utilisé est le tri par insertion qui s'exprime 
   // de manière récursive par les deux cas :
   begin
   // 1. trier une liste vide donne une liste vide.
     if estListeVide(l) then
      trie:= LISTEVIDE 
   // 2. trier une liste de tete e et de reste l donne la liste obtenue 
   //    en insérant l'élément e dans la liste obtenue en triant l.
     else
      trie:= insere(tete(l),trie(reste(l)));
   end{trie};
   
   // trier(l) trie la liste l
   // la liste l est modifiée
   // aucune création de cellules n’est effectuée
   procedure trier(var L : LISTE);
   begin
   L := trie(L);
   end{trier};

  
(* Afficheur *)

   // Affiche les élements de la liste sans les parentheses
   procedure afficherElementListe(const L: LISTE);
   begin
     if not(estListeVide(L)) then
       begin
         write(tete(L));
         if not(estListeVide(reste(L))) then
           begin
             write(',');
             afficherElementListe(reste(L));
           end{if};
     end{if};
   end{afficherElementListe};

   // Affiche les élements de la liste avec les parentheses
   procedure AfficherListe(const L: LISTE);
   begin
      write('(');
      AfficherElementListe(L);
      write(')');
   end{AfficherListe}; 



(* Destructeur *) 

   // desallouer(l) : libere l'espace memoire alloue
   // pour chaque cellule de la liste l
   procedure desallouer(var l : LISTE);
   var l1 : LISTE;
   begin
      if not estListeVide(l) then begin
         l1 := reste(l);
         desallouer(l1);
         dispose(l);
      end {if};
   end {desallouer}; 
   
   // supprimerOccurence(l,e) supprime toutes les occurrences de e dans l.
   // Si e n’existe pas la liste ne sera pas modifiée.
   procedure supprimerOccurence(var l: LISTE; const elt: ELEMENT);
   var
     temp,courant: LISTE;
   begin
     if not estListeVide(l) then begin
       courant := l;
       while not estListeVide(courant^.suivant) do begin
         if courant^.suivant^.info = elt then begin
            temp := courant^.suivant;
            courant^.suivant := temp^.suivant;
            dispose(temp);
            temp:= nil;
         end
         else
           courant:= courant^.suivant;
       end;
       if l^.info = elt then begin
         temp:= l;
         l:= l^.suivant;
         dispose(temp);
         temp:= nil;
       end;
     end;
   end{supprimerOccurence};
   
   // supprimerTete(l) : detruit la tete e:ELEMENT de l
   // CU : l non vide
   procedure supprimerTete(var l : LISTE);
   begin
      if not estListeVide(l) then begin
      l^.info := tete(reste(l));
      l^.suivant := reste(reste(l));
      end else writeln('La liste est Vide');
   end{supprimerListe};
   
  // supprimerDernier(l) : detruit le dernier element de l
  // CU : l non vide
  procedure supprimerDernier(var l : LISTE);
  begin
    if not estListeVide(l) then begin
    l := miroir(l);
    supprimerTete(l);
    l := miroir(l);
    end else writeln('La liste est Vide');
  end{supprimerDernier};








INITIALIZATION
(* UNITE MANIPULATION DE LISTE SIMPLEMENT CHAINEE *)
(* ANNEXE : Prototypes *)


(* CONSTRUCTEURS
    
  function ajouteEnTete(e: ELEMENT ; l: LISTE): LISTE;
  function insere(const e: ELEMENT ; const L: LISTE ): LISTE;

(* CONSTRUCTEUR DE COPIE   
 
  function cloner(L: LISTE): LISTE;
   
(* SELECTEURS
     
  function tete(l: LISTE): ELEMENT;  
  function reste(l: LISTE): LISTE;
  function dernier(const L: LISTE): LISTE;
   
(* ACCESSEURS
     
  function longueur(L: LISTE): INTEGER; 
  function acces(k: CARDINAL ; L: LISTE ): LISTE;
  function elementRang(k: CARDINAL ; L: LISTE ): ELEMENT; 
  function premiereOccur(const e: ELEMENT ; const L: LISTE): LISTE; 
  function derniereOccur(const e: ELEMENT ; const L: LISTE): LISTE;  
  function rangPremierElement(const e: ELEMENT ; const L: LISTE): CARDINAL; 
  function rangDernierElement(const e: ELEMENT ; const L: LISTE): CARDINAL;
   
(* PREDICATS 
  
  function estListeVide(l: LISTE): BOOLEAN;  
  function estTriee(L: LISTE): BOOLEAN ; 
  function contient(l:Liste; sl:Liste):Boolean; 
  function estListePalindrome(const L: LISTE): BOOLEAN;
   
(* OPERATEURS 
  
  function concatener(const L1: LISTE ; const L2: LISTE): LISTE;  
  function egalite(const L1: LISTE ; const L2: LISTE): BOOLEAN;
      
(* MODIFICATEURS 
  
  procedure modifierTete(const l: LISTE ; const e : ELEMENT);  
  procedure modifierReste(const l: LISTE ; const ll: LISTE); 
  procedure ajouteEnFin(const e: ELEMENT ; var l: LISTE);  
  procedure inserer(const e: ELEMENT ; const l: LISTE ; const k: CARDINAL ); 
  procedure insererDansLeTri(const e: LISTE ; var L: LISTE );  
  function miroir(const L: LISTE): LISTE; 

(* TRI PAR INSERTION SUR LES LISTES
 
  function trie(l : LISTE) : LISTE;
  procedure trier(var L : LISTE);
   
(* AFFICHEUR 

  procedure AfficherListe(const L: LISTE);
   
(* DESTRUCTEURS
      
  procedure desallouer(var l : LISTE);  
  procedure supprimerOccurence(var l: LISTE; const elt: ELEMENT);
  procedure supprimerTete(var l : LISTE); 
  procedure supprimerDernier(var l : LISTE); 
 


*)
FINALIZATION     
(* Merci d'avance pour vos nombreuses remarques qui pourraient corriger et ameliorer cette unité *)
(* Cordialement, Djebien Tarik *)
END.
