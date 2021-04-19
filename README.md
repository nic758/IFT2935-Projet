linux command to start postgres when you have permission error:
	sudo -u postgres [COMMAND]..


**Starting service**
sudo -u postgres service postgresql start


**startup cli**
sudo -u postgres psql "dbname"
	--> \c "dbname"

Default postgresql port = 5432

dependencies: org.slf4j/slf4j-log4j12 v1.4.2
											postgresql v42.2.2.jre7
											hibernate-entitymanager v3.4.0.GA


### Mode d'emplois sous Windows avec IntelliJ :

# Étape 1 : 
Cloner le repo. 

# Étape 2 : 
Faire rouler le script /src/gigascript.sql

Ce script va bâtir la base de donner et la peupler. Vous pouvez rouler le script de la façon de votre choix. 
Une façon d'y arriver est de se connecter à PostgresQL par invite de commande et d'exécuter la commande :

```\i '<INSÉREZ LE CHEMIN D'ACCÈS DU PROJET>/IFT2935-Projet/src/gigascript.sql'```

Par exemple :  

![image](https://user-images.githubusercontent.com/48171007/115169472-19951b80-a08c-11eb-8174-ceb9920ec5cc.png)

# Étape 3 : 

Ouvrir le projet dans IntelliJ, et configurer le projet.  
![image](https://user-images.githubusercontent.com/48171007/115169558-611ba780-a08c-11eb-92fb-c990634f6f86.png)

D'abord, choisir un SDK. Le projet fut testé avec Java SDK 11 et un niveau de langage équivalent  
![image](https://user-images.githubusercontent.com/48171007/115169630-96c09080-a08c-11eb-8667-0d14a11e34aa.png)

Si IntelliJ ne les a pas automatiquement importés, importer les librairies se trouvant dans le sous dossier 'lib' 
![image](https://user-images.githubusercontent.com/48171007/115169850-3120d400-a08d-11eb-9bfe-cfb2de6a06c3.png)


# Étape 4 : 

Valider le nom d'usager et le mot de passe dans le fichier de configuration (*hibernate.cfg.xml*)  

![image](https://user-images.githubusercontent.com/48171007/115170023-9f659680-a08d-11eb-9273-02a70ecf327c.png)


NB : si l'importation du script *gigascript.sql* s'est faite avec un nom d'usager autre que "postgres", il faudra faire une modification supplémentaire au code, dans *main.java* :

![image](https://user-images.githubusercontent.com/48171007/115170132-e5baf580-a08d-11eb-953d-49f2cd5925bb.png)  
↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓  
![image](https://user-images.githubusercontent.com/48171007/115170251-2a469100-a08e-11eb-9017-6d24e6a54091.png)


# Étape 5 :

Créer une configuration :

![image](https://user-images.githubusercontent.com/48171007/115170489-c7092e80-a08e-11eb-85e4-dfc91d2f865c.png)  

![image](https://user-images.githubusercontent.com/48171007/115170605-03d52580-a08f-11eb-89f1-72efa896d21c.png)


# Étape 6 : 

Faire rouler le programme!

Si tout c'est bien déroulé, cette fenêtre apparaîtra :  

![image](https://user-images.githubusercontent.com/48171007/115170758-6cbc9d80-a08f-11eb-8058-9baacc120235.png)

## FIN ##

