unit unitAnno;

{$mode objfpc}{$H+} {$CODEPAGE UTF8}

interface
   uses Classes, SysUtils, GestionEcran, unitvar;

   //automatisation de l'affichage du texte avec des coordonnées x et y (centre le texte)
   procedure ecrireTexteCentre(x1,y1:Integer;texte1:String);

   //automatisation de l'affichage du texte avec des coordonnées x et y (ne centre pas le texte)
   procedure ecrireTexte(x1,y1:Integer;texte1:String);

   //affichage du menu principal
   procedure menuPrincipal();

   //affichage du menu de présentation
   procedure presentation();

   //affichage du menu de création de partie
   procedure create();

   //affichage du menu des choix
   procedure choixMenu();

   //affichage du menu de gestion des batiments
   procedure batiment();

   //gestion des tour
   procedure nextRound();

implementation

   var
     nom:String;
     nbRound: Integer; //Variable qui prend le numéro du round en cours

   procedure ecrireTexteCentre(x1,y1:Integer;texte1:String);
   var
     pos:Coordonnees;
   begin
     pos.x:=x1-round(length(texte1)/2);
     pos.y:=y1;
     ecrireEnPosition(pos,texte1);
   end;

   procedure ecrireTexte(x1,y1:Integer;texte1:String);
   var
     pos:Coordonnees;
   begin
     pos.x:=x1;
     pos.y:=y1;
     ecrireEnPosition(pos,texte1);
   end;

   procedure menuPrincipal();
   var
     texte:String;

   begin
     changerTailleConsole(200,60);

     texte:='Anno 1701';
     ecrireTexteCentre(100,10,texte);

     texte:='1. Pour créer une Nouvelle Partie';
     ecrireTexteCentre(100,45,texte);

     texte:='2. Pour Quitter';
     ecrireTexteCentre(100,50,texte);

     texte:='Allez à ? ';
     ecrireTexteCentre(100,55,texte);



   end;

   procedure presentation();
      var
        y:Integer;
        texte:String;
        intro:Text;

      begin
        effacerEcran();
        assign(intro, 'intro.txt');
        reset(intro);

        y:=15;
        while not eof(intro) do
        begin
          readln(intro, texte);
          ecrireTexteCentre(100,y,texte);
          y:=y+1;
        end;

        texte:='1. Pour Accoster ?';
        ecrireTexteCentre(100,45,texte);

        texte:='2. Pour Quitter';
        ecrireTexteCentre(100,50,texte);

        close(intro);
      end;

   procedure create();
   var
     texte:String;

   begin
     effacerEcran();

     nbRound:=1; //Initialisation du nombre de tour

     couleurs(black,LightGray);
     texte:='CREATION DE VOTRE PERSONNAGE';
     ecrireTexteCentre(100,5,texte);

     couleurs(white,black);
     texte:='Entrer le nom de votre personnage : ';
     ecrireTexteCentre(40,15,texte);

     readln(nom); // lit la variable du nom du joueur
   end;

   procedure ile();
   var
     texte:String;

   begin
     effacerEcran;

     dessinerCadreXY(95,1,105,3,double,white,black);

     texte:='Isla Soma';
     couleurs(white,lightRed);
     ecrireTexteCentre(100,2,texte);
     couleurs(white,black);

     dessinerCadreXY(9,6,30,10,simple,white,black);

     texte:='Nom: ';
     ecrireTexte(10,7,texte);
     write(nom);

     texte:='Argent: ';
     ecrireTexte(10,8,texte);
     write(getGold);

     texte:='Tour: ';
     ecrireTexte(10,9,texte);
     write(nbRound);

     dessinerCadreXY(109,6,132,13,simple,white,black);

     //affichage des ressources
     texte:='Nombre de ressources :';
     ecrireTexte(110,7,texte);

     texte:='- Bois : ';
     ecrireTexte(110,8,texte);
     write(getBois);

     texte:='- Poissons : ';
     ecrireTexte(110,9,texte);
     write(getFish);

     texte:='- Outils : ';
     ecrireTexte(110,10,texte);
     write(getOutil);

     texte:='- Laine : ';
     ecrireTexte(110,11,texte);
     write(getLaine);

     texte:='- Tissu : ';
     ecrireTexte(110,12,texte);
     write(getTissu);

     dessinerCadreXY(109,29,158,39,simple,white,black);

     texte:='Nombre de colons : ';
     ecrireTexte(110,30,texte);
     write(getColon);
     write('/',getMaison*4);

     texte:='Liste des bâtiments construits : ';
     ecrireTexte(110,31,texte);

     texte:='- Maisons: ';
     ecrireTexte(110,32,texte);
     write(getMaison);

     texte:='- Cabane de pêcheur: ';
     ecrireTexte(110,33,texte);
     write(getCabaneP);

     texte:='- Cabane de bucheron: ';
     ecrireTexte(110,34,texte);
     write(getCabaneB);

     texte:='- Bergerie: ';
     ecrireTexte(110,35,texte);
     write(getBergerie);

     texte:='- Atelier de tisserand: ';
     ecrireTexte(110,36,texte);
     write(getAtelier);

     if (getChapelle = false) then
       begin
         texte:='Vous n''avez pas encore construit de chapelle';
         ecrireTexte(110,37,texte);
       end
     else
       begin
         texte:='Vous avez construit une chapelle';
         ecrireTexte(110,37,texte);
       end;

     if (getCentreVille = false) then
       begin
         texte:='Vous n''avez pas encore construit de centre-ville';
         ecrireTexte(110,38,texte);
       end
     else
       begin
         texte:='Vous avez construit un centre-ville';
         ecrireTexte(110,38,texte);
       end;
   end;

   procedure choixMenu();
   var
     texte:String;
   begin
     ile();

     //passer au prochain tour
     texte:='1. Passer au prochain tour';
     ecrireTexte(10, 30, texte);

     //accéder au menu de gestion des bâtiments
     texte:='2. Accéder au menu de gestion des bâtiments';
     ecrireTexte(10, 31, texte);

     //Quitter le jeu
     texte:='3. Quitter le jeu';
     ecrireTexte(10, 32, texte);

     //demande du choix
     texte:='Que souhaitez-vous faire ? ';
     ecrireTexte(10, 34, texte);
   end;

   procedure batiment();
   var
     texte:String;
     z:Integer;
     ARRET:Boolean;
   begin
     ARRET:=True;

     while (ARRET) do
       begin
         effacerEcran();

         ile();

         texte:='1. Construire une maison pouvant accueillir 4 colons: -500 or, - 10 bois et -5 outils';
         ecrireTexte(10, 30, texte);

         texte:='2. Construire une cabane de bucheron : -500 or, -20 bois et -10 outils';
         ecrireTexte(10, 31, texte);

         texte:='3. Construire une cabane de pêcheur : -500 or, -20 bois et -10 outils';
         ecrireTexte(10, 32, texte);

         texte:='4. Construire une bergerie: -500 or, -20 bois et -10 outils';
         ecrireTexte(10, 33, texte);

         texte:='5. Construire un atelier de tisserand: -500 or, -20 bois, -10 outils et -10 laines';
         ecrireTexte(10, 34, texte);

         texte:='6. Construire une chapelle: -1500 or, -80 bois, -30 outils et -30 tissu';
         ecrireTexte(10, 35, texte);

         texte:='7. Construire un centre-ville: -1000 or, -45 bois, -20 outils et -20 tissu';
         ecrireTexte(10, 36, texte);

         texte:='8. Retour au menu précédent';
         ecrireTexte(10, 37, texte);

         texte:='Quel bâtiment voulez-vous construire ? ';
         ecrireTexte(10, 39, texte);

         readln(z);
         case z of
         1:
           begin
             if ((getGold>499) AND (getBois>9) AND (getOutil>4)) then
                begin
                   setMaison(getMaison+1);
                   setGold(getGold-500);
                   setBois(getBois-10);
                   setOutil(getOutil-5);
                end
             else
                 begin
                   texte:='Vous n''avez pas les ressources pour construire une maison';
                   ecrireTexte(10, 39, texte);
                   readln();
                 end;
           end;
         2:
           begin
             if ((getGold>499) AND (getBois>19) AND (getOutil>9)) then
                begin
                   setCabaneB(getCabaneB+1);
                   setGold(getGold-500);
                   setBois(getBois-20);
                   setOutil(getOutil-10);
                end
             else
                 begin
                   texte:='Vous n''avez pas les ressources pour construire une cabane de bucheron';
                   ecrireTexte(10, 39, texte);
                   readln();
                 end;
           end;
         3:
           begin
             if ((getGold>499) AND (getBois>19) AND (getOutil>9)) then
                begin
                   setCabaneP(getCabaneP+1);
                   setGold(getGold-500);
                   setBois(getBois-20);
                   setOutil(getOutil-10);
                end
             else
                 begin
                   texte:='Vous n''avez pas les ressources pour construire une cabane de pêcheur';
                   ecrireTexte(10, 39, texte);
                   readln();
                 end;
           end;
         4:
           begin
             if ((getGold>499) AND (getBois>19) AND (getOutil>9)) then
                begin
                   setBergerie(getBergerie+1);
                   setGold(getGold-500);
                   setBois(getBois-20);
                   setOutil(getOutil-10);
                end
             else
                 begin
                   texte:='Vous n''avez pas les ressources pour construire une bergerie';
                   ecrireTexte(10, 39, texte);
                   readln();
                 end;
           end;
         5:
           begin
             if ((getGold>499) AND (getBois>19) AND (getOutil>9) AND (getLaine>9)) then
                begin
                   setAtelier(getAtelier+1);
                   setGold(getGold-500);
                   setBois(getBois-20);
                   setOutil(getOutil-10);
                   setLaine(getLaine-10);
                end
             else
                 begin
                   texte:='Vous n''avez pas les ressources pour construire une atelier de tisserand';
                   ecrireTexte(10, 39, texte);
                   readln();
                 end;
           end;
         6:
           begin
             if ((getGold>1499) AND (getBois>79) AND (getOutil>29) AND (getTissu>29)) then
                begin
                   setChapelle(true);
                   setGold(getGold-1500);
                   setBois(getBois-80);
                   setOutil(getOutil-30);
                   settissu(getTissu-30);
                end
             else
                 begin
                     texte:='Vous n''avez pas les ressources pour construire une chapelle';
                     ecrireTexte(10, 39, texte);
                     readln();
                 end;
           end;
         7:
           begin
             if ((getGold>999) AND (getBois>44) AND (getOutil>19) AND (getTissu>19)) then
                begin
                   setCentreVille(true);
                   setGold(getGold-1000);
                   setBois(getBois-45);
                   setOutil(getOutil-20);
                   settissu(getTissu-20);
                end
             else
                 begin
                     texte:='Vous n''avez pas les ressources pour construire un centre-ville';
                     ecrireTexte(10, 39, texte);
                     readln();
                 end;
           end;
         8:ARRET:=false;
         end;
     end;
   end;

   procedure production ();
   var
      res: Integer;
   begin
     //Production de poissons
     setFish(getFish()+(getCabaneP()*4)); //Une cabane de pêcheur produit 4 poissons

     //Production de bois
     setBois(getBois()+(getCabaneB()*5)); //Une cabane de bucheron produit 5 bois

     //Production de tissu
     res:= getAtelier()*5;
     if res<getLaine() then
        begin
            setLaine(getLaine()-res);
            setTissu(getTissu()+(getAtelier*10)); //Un atelier produit 10 tissu pour 5 laines
        end;

     //Production de Laine
     setLaine(getLaine()+(getBergerie*15)); //Une bergerie produit 5 laines

     //Nouveau colons
     setColon(getColon()+round(getColon()/5)); //donne 20% de la population en colon supplémentaire par tour
     if(getColon()>(getMaison()*4)) then
        setColon(getMaison()*4);
   end;

   procedure AffMarchand();
   var
     texte:String;
   begin
     dessinerCadreXY(95,1,104,3,double,white,black);
     texte:='MARCHAND';
     ecrireTexteCentre(100,2,texte);

     dessinerCadreXY(149,24,173,31,simple,white,black);
     texte:='Nombre de ressources :';
     ecrireTexte(150,25,texte);
     texte:='- Bois : ';
     ecrireTexte(150,26,texte);
     write(getBois);
     texte:='- Poissons : ';
     ecrireTexte(150,27,texte);
     write(getFish);
     texte:='- Outils : ';
     ecrireTexte(150,28,texte);
     write(getOutil);
     texte:='- Laine : ';
     ecrireTexte(150,29,texte);
     write(getLaine);
     texte:='- Tissu : ';
     ecrireTexte(150,30,texte);
     write(getTissu);

     dessinerCadreXY(82,5,118,15,simple,white,black);
     texte:='Bois: 5 pièces d''or par laine';
     ecrireTexteCentre(100,6,texte);
     texte:='Poisson: 5 pièces d''or par laine';
     ecrireTexteCentre(100,8,texte);
     texte:='Laine: 5 pièces d''or par laine';
     ecrireTexteCentre(100,10,texte);
     texte:='Tissu: 10 pièces d''or par tissu';
     ecrireTexteCentre(100,12,texte);
     texte:='Outil: 2 pièces d''or par outil';
     ecrireTexteCentre(100,14,texte);

     dessinerCadreXY(1,4,15,7,simple,white,black);
     texte:='Argent :';
     ecrireTexte(2,5,texte);
     write(getGold);
     texte:='Tour: ';
     ecrireTexte(2,6,texte);
     write(nbRound-1);
   end;

   procedure achat();
   var
     z,x,temp:Integer;
     texte:String;
     ARRET:Boolean;
   begin
     while (ARRET) do
       begin
         effacerEcran();
         affMarchand();

         texte:='1. Acheter du bois';
         ecrireTexteCentre(100,50,texte);
         texte:='2. Acheter du poisson';
         ecrireTexteCentre(100,51,texte);
         texte:='3. Acheter de la laine';
         ecrireTexteCentre(100,52,texte);
         texte:='4. Acheter du tissu';
         ecrireTexteCentre(100,53,texte);
         texte:='5. Acheter des outils';
         ecrireTextecentre(100,54,texte);
         texte:='6. Revenir au menu précédent';
         ecrireTexteCentre(100,55,texte);

         texte:='Que voulez-vous faire: ';
         ecrireTexteCentre(100,57,texte);

         readln(z);

         case z of
         1:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             temp:=x*5;
             if(getGold()-temp>0) then
                begin
                     setGold(getGold()-temp);
                     setBois(getBois()+x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''argent, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         2:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             temp:=x*5;
             if(getGold()-temp>0) then
                begin
                     setGold(getGold()-temp);
                     setFish(getFish()+x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''argent, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         3:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             temp:=x*5;
             if(getGold()-temp>0) then
                begin
                     setGold(getGold()-temp);
                     setLaine(getLaine()+x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''argent, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         4:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             temp:=x*10;
             if(getGold()-temp>0) then
                begin
                     setGold(getGold()-temp);
                     setTissu(getTissu()+x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''argent, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         5:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             temp:=x*2;
             if(getGold()-temp>0) then
                begin
                     setGold(getGold()-temp);
                     setOutil(getOutil()+x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''argent, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         6:ARRET:=false;
         end;
     end;
   end;

   procedure vente();
   var
     z,x:Integer;
     texte:String;
     ARRET:Boolean;
   begin
     ARRET:=true;
     while (ARRET) do
       begin
         effacerEcran();
         affMarchand();

         texte:='1. Vendre du bois';
         ecrireTexteCentre(100,50,texte);
         texte:='2. Vendre du poisson';
         ecrireTexteCentre(100,51,texte);
         texte:='3. Vendre de la laine';
         ecrireTexteCentre(100,52,texte);
         texte:='4. Vendre du tissu';
         ecrireTexteCentre(100,53,texte);
         texte:='5. Vendre des outils';
         ecrireTexteCentre(100,54,texte);
         texte:='6. Revenir au menu précédent';
         ecrireTexteCentre(100,55,texte);

         texte:='Que voulez-vous faire: ';
         ecrireTexteCentre(100,57,texte);

         readln(z);

         case z of
         1:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             if(getBois()-x>=0) then
                begin
                     setBois(getBois()-x);
                     setGold(getGold()+(x*5));
                end
             else
               begin
                 write('Vous n''avez pas assez de bois, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         2:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             if(getFish()-x>=0) then
                begin
                     setGold(getGold()+(x*5));
                     setFish(getFish()-x);
                end
             else
               begin
                 write('Vous n''avez pas assez de poisson, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         3:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             if(getLaine()-x>=0) then
                begin
                     setGold(getGold()+x*5);
                     setLaine(getLaine()-x);
                end
             else
               begin
                 write('Vous n''avez pas assez de laine, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         4:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             if(getTissu()-x>=0) then
                begin
                     setGold(getGold()+x*10);
                     setTissu(getTissu()-x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''argent, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         5:
           begin
             texte:='Quelle quantité: ';
             ecrireTexteCentre(100,58,texte);
             readln(x);
             if(getOutil()-x>0) then
                begin
                     setGold(getGold()+x*2);
                     setOutil(getOutil()-x);
                end
             else
               begin
                 write('Vous n''avez pas assez d''outil, appuyer sur entrée pour passer');
                 readln();
               end;
           end;
         6:
           begin
             ARRET:=false;
           end;
         end;
       end;
   end;

   procedure marchand();
   var
     texte:String;
     z:Integer;
     ARRET:Boolean;
   begin
     ARRET:=true;

     while (ARRET) do
       begin
         effacerEcran();
         AffMarchand();

         texte:='1. Acheter';
         ecrireTexteCentre(100,20,texte);

         texte:='2. Vendre';
         ecrireTexteCentre(100,21,texte);

         texte:='3. Sortir du marchand';
         ecrireTexteCentre(100,22,texte);

         texte:='Que voulez-vous faire: ';
         ecrireTexteCentre(100,57,texte);

         readln(z);
         case z of
           1:
             begin
               achat();
             end;

           2:
             begin
               vente();
             end;
           3:
             begin
               ARRET:=false;
             end;

         end;
       end;
   end;

   procedure nextRound();
      var
        texte:String;
        res: Integer;
      begin
        EffacerEcran();
        nbRound:=nbRound+1;
        res:= getColon div 2;

        production();

        //Conso de poissons
        if res<getFish then
           begin
                setFish(getFish-res);
                texte:='Vos colons se délectent de vos poissons! Poissons restant: ';
                ecrireTexteCentre(100,10,texte);
                write(getFish);
           end
        else
            begin
                 texte:='Vous n''avez plus assez de poisson, vos colons ont faim !';
                 ecrireTexteCentre(100,10,texte);
                 setColon(getColon-4);
            end;

        //Conso de tissu
        if (res + 3)<getTissu then
           begin
                setTissu(getTissu-(res + 3));
                texte:='Vos ressources en tissu subviennent à vos colons ! Tissu restant: ';
                ecrireTexteCentre(100,12,texte);
                write(getTissu);
           end
        else
            begin
                 texte:='Vous n''avez plus assez de tissu, vos colons sont en colère !';
                 ecrireTexteCentre(100,12,texte);
                 setColon(getColon-2);
            end;

        //Conso de bois
        if (res div 2)<getBois then
           begin
                setBois(getBois-(res div 2));
                texte:='Vos ressources en bois subviennent à vos colons ! Bois restant: ';
                ecrireTexteCentre(100,14,texte);
                write(getBois);
           end
        else
            begin
                 texte:='Vous n''avez plus assez de bois, vos colons ne peuvent plus se chauffer !';
                 ecrireTexteCentre(100,14,texte);
                 setColon(getColon-2);
            end;

        //Check centre-ville
        if getCentreVille=TRUE then
           begin
                texte:='Vous avez un centre-ville, vos colons sont heureux !';
                ecrireTexteCentre(100,16,texte);
           end
        else
            texte:='Vous n''avez pas de centre-ville, vos colons sont mécontent !';
            ecrireTexteCentre(100,16,texte);

        //Check chapelle
        if getChapelle=TRUE then
           begin
                texte:='Vous avez une chapelle, vos colons sont heureux !';
                ecrireTexteCentre(100,18,texte);
           end
        else
            texte:='Vous n''avez pas de chapelle, vos colons sont mécontent !';
            ecrireTexteCentre(100,18,texte);

        readln();

        //Passage vers le tour suivant ou fin de partie
        EffacerEcran();
        If getColon<1 then
           begin
                texte:='L''entièreté de vos colons est mort !';
                ecrireTexteCentre(100,10,texte);
                texte:='Vous avez perdu !';
                ecrireTexteCentre(100,12,texte);
                readln();
                halt();
           end
        else
            begin
              setGold(getGold+(getColon*25));  //Taxes
              texte:='Vos colons vous on rapporté: ';
              ecrireTexteCentre(100,10,texte);
              write(getGold);
              if (nbRound mod 3 = 0) then
                 begin
                      marchand(); //Marchand
                 end;

              ile();
            end;
      end;

end.
