drop database if exists batiInterim ;
create database batiInterim ;
use batiInterim ;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Artisan
#------------------------------------------------------------

CREATE TABLE Artisan(
        idArtisan     int (11) Auto_increment  NOT NULL ,
        nom           Varchar (50) ,
        prenom        Varchar (50) ,
        dateNaissance Date ,
        lieuNaissance Varchar (200) ,
        numTel        Int ,
        adresse       Varchar (100) ,
        cp            Int ,
        login         Varchar (60) ,
        mdp           Varchar (150) ,
        mdpChanger    Bool NOT NULL ,
        PRIMARY KEY (idArtisan )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Entrepreneur
#------------------------------------------------------------

CREATE TABLE Entrepreneur(
        idEntrepreneur int (11) Auto_increment  NOT NULL ,
        login          Varchar (60) ,
        mdp            Varchar (150) ,
        nomSociete     Varchar (100) ,
        numTel         Int ,
        adresse        Varchar (100) ,
        cp             Int ,
        nomChef        Varchar (25) ,
        prenomChef     Varchar (25) ,
        mdpChanger     Bool NOT NULL ,
        PRIMARY KEY (idEntrepreneur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: gestionnaire
#------------------------------------------------------------

CREATE TABLE gestionnaire(
        idGestionnaire int (11) Auto_increment  NOT NULL ,
        login          Varchar (50) ,
        mdp            Varchar (25) ,
        nom            Varchar (35) ,
        prenom         Varchar (35) ,
        PRIMARY KEY (idGestionnaire )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: corpsMetier
#------------------------------------------------------------

CREATE TABLE corpsMetier(
        idCorpMetier int (11) Auto_increment  NOT NULL ,
        libelle      Varchar (50) ,
        PRIMARY KEY (idCorpMetier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: chantier
#------------------------------------------------------------

CREATE TABLE chantier(
        idChantier     int (11) Auto_increment  NOT NULL ,
        nom            Varchar (25) ,
        idChefChantier Int ,
        idEntrepreneur Int ,
        PRIMARY KEY (idChantier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: secteur
#------------------------------------------------------------

CREATE TABLE secteur(
        idSecteur int (11) Auto_increment  NOT NULL ,
        libelle   Varchar (50) ,
        PRIMARY KEY (idSecteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mission
#------------------------------------------------------------

CREATE TABLE mission(
        idMission   int (11) Auto_increment  NOT NULL ,
        dateDebut   Date ,
        dateFin     Date ,
        intitule    Varchar (50) ,
        nbArtisans  Int ,
        prixParJour Float ,
        idChantier  Int ,
        PRIMARY KEY (idMission )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: chefChantier
#------------------------------------------------------------

CREATE TABLE chefChantier(
        idChefChantier int (11) Auto_increment  NOT NULL ,
        nom            Varchar (50) ,
        prenom         Varchar (35) ,
        login          Varchar (35) ,
        mdp            Varchar (150) ,
        mdpChanger     Bool ,
        idEntrepreneur Int ,
        PRIMARY KEY (idChefChantier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: conger
#------------------------------------------------------------

CREATE TABLE conger(
        idConger       int (11) Auto_increment  NOT NULL ,
        dateDebut      Date ,
        dateFin        Date ,
        valider        Varchar (30) ,
        idArtisan      Int ,
        idGestionnaire Int ,
        PRIMARY KEY (idConger )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Etat
#------------------------------------------------------------

CREATE TABLE Etat(
        idEtat  int (11) Auto_increment  NOT NULL ,
        alias   Varchar (10) NOT NULL ,
        libelle Varchar (50) ,
        PRIMARY KEY (idEtat )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: effectuer
#------------------------------------------------------------

CREATE TABLE effectuer(
        idArtisan Int NOT NULL ,
        idMission Int NOT NULL ,
        idEtat    Int NOT NULL ,
        PRIMARY KEY (idArtisan ,idMission ,idEtat )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: caracteriser
#------------------------------------------------------------

CREATE TABLE caracteriser(
        idMission    Int NOT NULL ,
        idCorpMetier Int NOT NULL ,
        PRIMARY KEY (idMission ,idCorpMetier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appartenir
#------------------------------------------------------------

CREATE TABLE appartenir(
        idArtisan    Int NOT NULL ,
        idCorpMetier Int NOT NULL ,
        PRIMARY KEY (idArtisan ,idCorpMetier )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: rattacher
#------------------------------------------------------------

CREATE TABLE rattacher(
        idSecteur      Int NOT NULL ,
        idEntrepreneur Int NOT NULL ,
        PRIMARY KEY (idSecteur ,idEntrepreneur )
)ENGINE=InnoDB;

ALTER TABLE chantier ADD CONSTRAINT FK_chantier_idChefChantier FOREIGN KEY (idChefChantier) REFERENCES chefChantier(idChefChantier);
ALTER TABLE chantier ADD CONSTRAINT FK_chantier_idEntrepreneur FOREIGN KEY (idEntrepreneur) REFERENCES Entrepreneur(idEntrepreneur);
ALTER TABLE mission ADD CONSTRAINT FK_mission_idChantier FOREIGN KEY (idChantier) REFERENCES chantier(idChantier);
ALTER TABLE chefChantier ADD CONSTRAINT FK_chefChantier_idEntrepreneur FOREIGN KEY (idEntrepreneur) REFERENCES Entrepreneur(idEntrepreneur);
ALTER TABLE conger ADD CONSTRAINT FK_conger_idArtisan FOREIGN KEY (idArtisan) REFERENCES Artisan(idArtisan);
ALTER TABLE conger ADD CONSTRAINT FK_conger_idGestionnaire FOREIGN KEY (idGestionnaire) REFERENCES gestionnaire(idGestionnaire);
ALTER TABLE effectuer ADD CONSTRAINT FK_effectuer_idArtisan FOREIGN KEY (idArtisan) REFERENCES Artisan(idArtisan);
ALTER TABLE effectuer ADD CONSTRAINT FK_effectuer_idMission FOREIGN KEY (idMission) REFERENCES mission(idMission);
ALTER TABLE effectuer ADD CONSTRAINT FK_effectuer_idEtat FOREIGN KEY (idEtat) REFERENCES Etat(idEtat);
ALTER TABLE caracteriser ADD CONSTRAINT FK_caracteriser_idMission FOREIGN KEY (idMission) REFERENCES mission(idMission);
ALTER TABLE caracteriser ADD CONSTRAINT FK_caracteriser_idCorpMetier FOREIGN KEY (idCorpMetier) REFERENCES corpsMetier(idCorpMetier);
ALTER TABLE appartenir ADD CONSTRAINT FK_appartenir_idArtisan FOREIGN KEY (idArtisan) REFERENCES Artisan(idArtisan);
ALTER TABLE appartenir ADD CONSTRAINT FK_appartenir_idCorpMetier FOREIGN KEY (idCorpMetier) REFERENCES corpsMetier(idCorpMetier);
ALTER TABLE rattacher ADD CONSTRAINT FK_rattacher_idSecteur FOREIGN KEY (idSecteur) REFERENCES secteur(idSecteur);
ALTER TABLE rattacher ADD CONSTRAINT FK_rattacher_idEntrepreneur FOREIGN KEY (idEntrepreneur) REFERENCES Entrepreneur(idEntrepreneur);
