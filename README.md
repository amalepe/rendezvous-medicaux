# rendezvous-medicaux
Projet de gestion de rendez-vous médicaux développé avec Laravel, React et MySQL, permettant aux patients de réserver un créneau et aux médecins de confirmer ou d’annuler les rendez-vous, avec notification par email.

Objectif principal : simplifier la prise de rendez-vous, suivre l’état des réservations et améliorer la communication entre les deux profils d’utilisateurs.
2. Technologies utilisées
•	Backend : Laravel
•	Frontend : React
•	Base de données : MySQL
•	Authentification : Sanctum
•	Envoi d’e-mails : Mailtrap (mode test)
3. Profils utilisateurs
L’application contient deux profils principaux :
•	Patient : consulte les médecins, affiche les créneaux disponibles, réserve un rendez-vous et annule si nécessaire.
•	Médecin : consulte les rendez-vous reçus, confirme ou annule une demande, et déclenche l’envoi d’un e-mail au patient.
4. Fonctionnalités principales
•	Connexion sécurisée selon le rôle utilisateur.
•	Affichage de la liste des médecins.
•	Consultation des créneaux disponibles par médecin.
•	Réservation d’un rendez-vous par le patient.
•	Affichage de l’état du rendez-vous côté patient.
•	Confirmation ou annulation côté médecin.
•	Notification par e-mail après confirmation ou annulation.
5. Logique du processus
1.	Le patient se connecte à l’application.
2.	Il choisit un médecin puis un créneau disponible.
3.	Le rendez-vous est créé avec le statut patient = reserve et le statut médecin = en attente.
4.	Le médecin se connecte et consulte la liste des rendez-vous.
5.	Le médecin peut confirmer ou annuler la demande.
6.	Le patient voit ensuite le résultat : en attente, confirmé ou annulé.
7.	Un e-mail de notification peut être envoyé automatiquement après confirmation ou annulation de rendez vous
6. Comptes de connexion
Remarque : remplacez les exemples ci-dessous par les vrais comptes créés dans vos seeders ou dans votre base de données.
Profil	E-mail / Login	Mot de passe	Rôle
Patient	Areej@test.com	12345678	Réserver et annuler un rendez-vous
Médecin	Yahya@doc.com	12345678	Confirmer ou annuler un rendez-vous

Conseil : si vous utilisez des seeders, ajoutez au moins un compte patient et un compte médecin pour faciliter les démonstrations et les tests.
7. Données recommandées pour la démonstration
•	1 médecin avec spécialité et téléphone.
•	1 patient avec compte utilisateur actif.
•	Quelques créneaux disponibles.
•	Au moins un rendez-vous en attente.
•	Un rendez-vous confirmé et un rendez-vous annulé pour illustrer les différents états.
8. Scénarios de test
•	Connexion patient → affichage des médecins → réservation d’un créneau.
•	Connexion médecin → affichage des rendez-vous → confirmation d’une demande.
•	Connexion médecin → annulation d’une demande → vérification de l’e-mail.
•	Connexion patient → consultation du statut final du rendez-vous.
9. Conclusion
Ce projet montre la mise en place d’un système complet de gestion de rendez-vous médicaux. Il combine authentification, gestion des rôles, réservation, validation métier, mise à jour des statuts et notification par e-mail. C’est une bonne base pour un projet de PFE, de portfolio ou de démonstration technique.

