unit unitVar;

{$mode objfpc}{$H+}

interface
   uses Classes, SysUtils;

   //Unité de gestion des ressources: getX donne la valeur de la ressource, setX la modifie
   //initialisation
   procedure initialisation;

   //fish
   procedure setFish(val:Integer);
   function getFish : Integer;

   //gold
   procedure setGold(val:Integer);
   function getGold : Integer;

   //bois
   procedure setBois(val:Integer);
   function getBois : Integer;

   //outil
   procedure setOutil(val:Integer);
   function getOutil : Integer;

   //laine
   procedure setLaine(val:Integer);
   function getLaine : Integer;

   //tissu
   procedure setTissu(val:Integer);
   function getTissu : Integer;

   //colon
   procedure setColon(val:Integer);
   function getColon : Integer;

   //soldats
   procedure setSoldat(val:Integer);
   function getSoldat : Integer;

   //maison
   procedure setMaison(val:Integer);
   function getMaison : Integer;

   //cabaneP
   procedure setCabaneP(val:Integer);
   function getCabaneP : Integer;

   //cabaneB
   procedure setCabaneB(val:Integer);
   function getCabaneB : Integer;

   //bergerie
   procedure setBergerie(val:Integer);
   function getBergerie : Integer;

   //atelier
   procedure setAtelier(val:Integer);
   function getAtelier : Integer;

   //chapelle
   procedure setChapelle(val:Boolean);
   function getChapelle : Boolean;

   //centre-ville
   procedure setCentreVille(val:Boolean);
   function getCentreVille : Boolean;

   //chantier naval
   procedure setNaval(val:Boolean);
   function getNaval : Boolean;

   //bateaux
   procedure setBateau(val:Integer);
   function getBateau : Integer;

   procedure setNbRound(val : Integer);

   function getNbRound : Integer;

   procedure setNom(val : String);

   function getNom : String;

implementation
   var
     r : record //record contenant les données des ressources
       fish, bois, outil, laine, tissu, gold, colon, soldat, bateaux : Integer;
     end;

     b : record //record contenant les données des bâtiments
       maison, cabaneP, cabaneB, bergerie, atelier : Integer;
       chapelle, centreVille, chantierNaval : Boolean;
     end;

     nbRound:Integer;
     nom : String;


   procedure initialisation;
   begin
     r.fish := 100;
     r.bois := 100;
     r.outil := 100;
     r.laine := 100;
     r.tissu := 100;
     r.gold := 50000;
     r.colon := 12;
     r.soldat := 0;
     r.bateaux := 0;

     b.maison := 3;
     b.cabaneP := 0;
     b.cabaneB := 0;
     b.bergerie := 0;
     b.atelier := 0;

     b.chapelle := false;
     b.centreVille := false;
     b.chantierNaval := false;

     nom := '';
     nbRound := 1;
   end;

   //fish
   procedure setFish(val:Integer);
   begin
     fish:=val;
   end;

   function getFish : Integer;
   begin
     getFish:=fish;
   end;

   //gold
   procedure setGold(val:Integer);
   begin
     gold:=val;
   end;

   function getGold : Integer;
   begin
     getGold:=gold;
   end;

   //bois
   procedure setBois(val:Integer);
   begin
     bois:=val;
   end;

   function getBois : Integer;
   begin
     getBois:=bois;
   end;

   //outil
   procedure setOutil(val:Integer);
   begin
     outil:=val;
   end;

   function getOutil : Integer;
   begin
     getOutil:=outil;
   end;

   //laine
   procedure setLaine(val:Integer);
   begin
     laine:=val;
   end;

   function getLaine : Integer;
   begin
     getLaine:=laine;
   end;

   //tissu
   procedure setTissu(val:Integer);
   begin
     tissu:=val;
   end;

   function getTissu : Integer;
   begin
     getTissu:=Tissu;
   end;

   //colon
   procedure setColon(val:Integer);
   begin
     colon:=val;
   end;

   function getColon : Integer;
   begin
     getColon:=colon;
   end;

   //soldats
   procedure setSoldat(val:Integer);
   begin
     soldat:=val;
   end;

   function getSoldat : Integer;
   begin
     getSoldat:=soldat;
   end;

   //bateau
   procedure setBateau(val:Integer);
   begin
     bateaux:=val;
   end;

   function getBateau : Integer;
   begin
     getBateau:=bateaux;
   end;

   //maison
   procedure setMaison(val:Integer);
   begin
     maison:=val;
   end;

   function getMaison : Integer;
   begin
     getMaison:=maison;
   end;

   //cabaneP
   procedure setCabaneP(val:Integer);
   begin
     cabaneP:=val;
   end;

   function getCabaneP : Integer;
   begin
     getCabaneP:=cabaneP;
   end;

   //cabaneB
   procedure setCabaneB(val:Integer);
   begin
     cabaneB:=val;
   end;

   function getCabaneB : Integer;
   begin
     getCabaneB:=cabaneB;
   end;

   //bergerie
   procedure setBergerie(val:Integer);
   begin
     bergerie:=val;
   end;

   function getBergerie : Integer;
   begin
     getBergerie:=bergerie;
   end;

   //atelier
   procedure setAtelier(val:Integer);
   begin
     atelier:=val;
   end;

   function getAtelier : Integer;
   begin
     getAtelier:=atelier;
   end;

   //chapelle
   procedure setChapelle(val:Boolean);
   begin
     chapelle:=val;
   end;

   function getChapelle : Boolean;
   begin
     getChapelle:=chapelle;
   end;

   //centre-ville
   procedure setCentreVille(val:Boolean);
   begin
     centreVille:=val;
   end;

   function getCentreVille : Boolean;
   begin
     getCentreVille:=centreVille;
   end;

   //Chantier naval
   procedure setNaval(val:Boolean);
   begin
     chantierNaval:=val;
   end;

   function getNaval : Boolean;
   begin
     getNaval:=chantierNaval;
   end;

   procedure setNbRound(val : Integer);
   begin
     nbRound := val;
   end;

   function getNbRound : Integer;
   begin
     getNbRound := nbRound;
   end;

   procedure setNom(val : String);
   begin
     nom := val;
   end;

   function getNom : String;
   begin
     getNom := nom;
   end;

end.
