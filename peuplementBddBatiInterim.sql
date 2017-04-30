use batiInterim ;

INSERT INTO gestionnaire (login , mdp, nom, prenom) VALUES ('admin', 'azerty', 'Hecker', 'Amal');

INSERT INTO corpsMetier (libelle) VALUES 
('Charpentier bois'),
('Constructeur bois'),
('Constructeur en béton armé'),
('Couvreur'),
('Etancheur'),
('Miroitier'),
('Chauffagiste'),
('Electricien'),
('Agenceur'),
('Carreleur'),
('Menuisier'),
('Peintre');

INSERT INTO secteur (libelle) VALUES 
('Gros oeuvre'),
('Aménagement / Finition'),
('Couverture / plomberie'),
('Sanitaire / Electrique'),
('Menuiserie'),
('Serrurerie');

INSERT INTO Etat (alias, libelle) VALUES 
('ET','En attente'),
('A','Accepter'),
('R','Refuser');



