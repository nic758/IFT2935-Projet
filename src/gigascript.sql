begin transaction;

drop schema if exists projet_ift_2935 cascade;
create schema projet_ift_2935;
set search_path to projet_ift_2935;

create type facultes as enum
(
	'Arts et sciences',
	'Sciences de l education',
	'Ecole de sante publique',
	'Amenagement',
	'Medecine',
	'Education permanente',
	'Droit',
	'Et. superieures et postdoct',
	'Universite de Montreal',
	'Medecine veterinaire',
	'Medecine dentaire',
	'Optometrie',
	'Pharmacie',
	'Sciences infirmieres'
);

create type programmes as enum
(
	'Action communautaire',
	'Actuariat',
	'Administration de l education',
	'Administration de l education (D.Ed.)',
	'Administration des services de sante',
	'Administration des services de sante, option Gestion des servic',
	'Administration des services de sante, option administration soc',
	'Administration des systemes d education et de formation',
	'Administration des systemes informatiques',
	'Affaires publiques et internationales',
	'Amenagement, option Design Urbain',
	'Amenagement, option Ville, territoire, paysage',
	'Analyse des megadonnees en sante',
	'Analyse des megadonnees en sciences humaines et sociales',
	'Analyse et evaluation des interventions en sante',
	'Analyse et evaluation des services, organisations et systemes d',
	'Analyses environnementales et industrielles',
	'Andragogie',
	'Annee preparatoire',
	'Anthropologie',
	'Archeologie classique',
	'Architecture',
	'Architecture de paysage',
	'Archivistique',
	'Arts et sciences',
	'Audiologie',
	'Bio-informatique',
	'Biochimie',
	'Biochimie clinique ',
	'Biochimie et medecine moleculaire',
	'Bioethique',
	'Biologie (Sciences)',
	'Biophysique et physiologie moleculaire',
	'Biostatistique',
	'Bureautique',
	'Chimie',
	'Cinema',
	'Communication (Sciences)',
	'Communication dans les organisations en changement',
	'Communication et Politique',
	'Communication mediatique',
	'Communication organisationnelle',
	'Communication politique',
	'Complements de formation',
	'Criminalistique et information',
	'Criminologie',
	'Criminologie - Analyse criminologique',
	'Criminologie - Campus Laval',
	'Criminologie - Intervention criminologique',
	'Demographie',
	'Demographie et Anthropologie',
	'Demographie et Geographie',
	'Demographie et Statistique',
	'Design : orientation design d interieur',
	'Design : orientation design industriel',
	'Design d interieur',
	'Design de jeux',
	'Design des jardins',
	'Design industriel',
	'Design urbain',
	'Didactique',
	'Didactique et integration des matieres',
	'Droit et travail',
	'Ecodesign strategique',
	'Economie (Sciences)',
	'Economie et Politique',
	'Ecriture de scenario et creation litteraire',
	'Education comparee et fondements de l education',
	'Education prescolaire et enseignement primaire - Campus Laval',
	'Education prescolaire et enseignement primaire - Campus Montrea',
	'Education, option education prescolaire et enseignement primair',
	'Education, option orthopedagogie',
	'Education, option pedagogie universitaire des sciences de la sa',
	'Enseignement',
	'Enseignement au secondaire',
	'Enseignement de l education physique et a la sante',
	'Enseignement de l espagnol, langue seconde',
	'Enseignement de l ethique et de la culture religieuse au second',
	'Enseignement de l histoire au collegial',
	'Enseignement de l univers social au secondaire',
	'Enseignement de la philosophie au collegial',
	'Enseignement des mathematiques au secondaire',
	'Enseignement des sciences et des technologies au secondaire',
	'Enseignement du fran??ais au secondaire',
	'Enseignement du fran??ais langue seconde',
	'Enseignement en adaptation scolaire - Campus Laval',
	'Enseignement en adaptation scolaire - Campus Montreal',
	'Environnement et developpement durable',
	'Environnement, sante et gestion des catastrophes',
	'Epidemiologie',
	'Epidemiologie et controle des infections',
	'Ergotherapie',
	'Ethique clinique',
	'Ethique clinique pediatrique',
	'Ethique et droit',
	'Etudes allemandes',
	'Etudes allemandes dans le contexte europeen',
	'Etudes allemandes et Histoire',
	'Etudes anglaises',
	'Etudes anglaises et Litterature comparee',
	'Etudes arabes',
	'Etudes asiatiques',
	'Etudes autochtones',
	'Etudes catalanes',
	'Etudes cinematographiques',
	'Etudes cinematographiques et Litterature comparee',
	'Etudes classiques',
	'Etudes classiques et Anthropologie',
	'Etudes du jeu video',
	'Etudes est-asiatiques',
	'Etudes hispaniques',
	'Etudes individualisees',
	'Etudes individualisees - M.Sc.',
	'Etudes individualisees ??? M.Sc.A.',
	'Etudes internationales',
	'Etudes italiennes',
	'Etudes latino-americaines',
	'Etudes lusophones',
	'Etudes medievales',
	'Etudes neo-helleniques',
	'Etudes quebecoises',
	'Etudes religieuses',
	'Evaluation des competences',
	'Evaluation des technologies de la sante',
	'Exploration de technologies informatiques',
	'Finance mathematique et computationnelle ',
	'Fondements et pratiques en sciences sociales et sante',
	'Formation a l enseignement postsecondaire',
	'Formation preparatoire en relations industrielles',
	'Genetique medicale',
	'Genie biomedical ',
	'Geographie',
	'Geographie appliquee en environnement',
	'Geographie environnementale',
	'Geographie et etudes environnementales',
	'Geomatique et analyse spatiale',
	'Geomatique et cartographie dynamique',
	'Gestion de l information numerique',
	'Gestion de la qualite et de la securite des patients',
	'Gestion des services de sante et des services sociaux',
	'Gestion du changement en education',
	'Gestion du changement et responsabilite populationnelle',
	'Gestion du systeme de sante',
	'Gestion urbaine pour les pays en developpement',
	'Histoire',
	'Histoire ancienne',
	'Histoire de l art',
	'Histoire et Etudes classiques',
	'Hygiene du travail',
	'Informatique',
	'Informatique appliquee',
	'Initiation a la programmation',
	'Initiation au multimedia',
	'Insertion professionnelle en enseignement',
	'Integration pedagogique du numerique',
	'Internat de perfectionnement en sciences appliquees veterinaire',
	'Intervention educative',
	'Jeu video',
	'Journalisme',
	'Justice et victimes',
	'Kinesiologie',
	'Kinesiologie - Sciences de l activite physique',
	'Langue et culture chinoises',
	'Langue et culture coreennes',
	'Langue et culture grecques',
	'Langue et culture hispaniques',
	'Langue et culture japonaises',
	'Langue et culture latines',
	'Langue et culture neo-helleniques',
	'Langue et culture russes',
	'Langues modernes',
	'Leadership et gestion des etablissements scolaires',
	'Leadership pour militaires',
	'Lettres et sciences humaines',
	'Linguistique',
	'Linguistique et Psychologie',
	'Litterature',
	'Litterature comparee',
	'Litterature comparee et Philosophie',
	'Litteratures de langue fran??aise',
	'Litteratures de langue fran??aise et Linguistique',
	'Litteratures de langue fran??aise et Philosophie',
	'Litteratures de langues anglaise et fran??aise',
	'Mathematiques',
	'Mathematiques et Economie',
	'Mathematiques et Informatique',
	'Mathematiques et Physique',
	'Mathematiques et Statistique',
	'Medecine - Echocardiographie transoesophagienne peri-operatoire',
	'Medecine dentaire - Dentisterie pediatrique',
	'Medecine dentaire - Orthodontie',
	'Medecine dentaire - Rehabilitation prosthodontique',
	'Medecine dentaire - Sciences buccodentaires',
	'Medecine veterinaire - Biomedecine veterinaire',
	'Medecine veterinaire - Diagnostic en laboratoire',
	'Medecine veterinaire - Interface animal-homme-environnement et ',
	'Medecine veterinaire - Internat de perfectionnement en sciences',
	'Medecine veterinaire - Interventions en sante publique veterina',
	'Medecine veterinaire - Pathologie veterinaire',
	'Medecine veterinaire - Sciences cliniques veterinaires',
	'Media, culture et technologie',
	'Mesure et evaluation en education',
	'Methodologies d analyse sociologique',
	'Microbiologie et immunologie',
	'Mobilite, transport et urbanisme',
	'Multimedia',
	'Neuropsychologie clinique',
	'Neuroscience cognitive',
	'Neurosciences',
	'Nutrition',
	'Optometrie',
	'Optometrie - Sciences de la vision',
	'Optometrie - intervention en deficience visuelle',
	'Orthodidactique des mathematiques',
	'Orthodidactique du fran??ais',
	'Orthopedagogie - Eleves en difficulte d adaptation et de compor',
	'Orthopedagogie - Eleves handicapes',
	'Orthopedagogie - Soutien a l apprentissage',
	'Orthophonie',
	'Pathologie et biologie cellulaire',
	'Pathologie moleculaire et medecine personnalisee',
	'Pedagogie universitaire des sciences de la sante',
	'Pedagogie universitaire des sciences medicales',
	'Perfusion extracorporelle',
	'Petite enfance et approche interprofessionnelle',
	'Pharmacie',
	'Pharmacogenomique',
	'Pharmacologie',
	'Pharmacologie clinique',
	'Philosophie',
	'Philosophie et Etudes classiques',
	'Physiologie',
	'Physiologie moleculaire, cellulaire et integrative',
	'Physiotherapie',
	'Physiotherapie - Reeducation perineale et pelvienne',
	'Physiotherapie avancee en neuro-musculosquelettique',
	'Physique',
	'Physique et Informatique',
	'Physique medicale',
	'Programmation',
	'Programmation Internet',
	'Programme d accueil en sciences',
	'Psychoeducation',
	'Psychoeducation - Campus Laval',
	'Psychologie',
	'Psychologie - Campus Laval',
	'Psychologie - Campus Montreal',
	'Psychologie - option Neuropsychologie clinique',
	'Psychologie - option Psychologie clinique',
	'Psychologie - option psychologie du travail et organisations',
	'Psychologie - recherche et intervention',
	'Psychologie - recherche et intervention - option Neuropsycholog',
	'Psychologie - recherche et intervention - option Psychologie cl',
	'Psychologie - recherche et intervention - option Psychologie du',
	'Psychologie et Sociologie',
	'Psychopedagogie',
	'Recherche interdisciplinaire en sante de la reproduction',
	'Recits et medias autochtones',
	'Relations ethniques',
	'Relations industrielles',
	'Relations industrielles - Dynamique des relations du travail',
	'Relations industrielles - Gestion de la diversite dans les orga',
	'Relations industrielles - Gestion strategique des ressources hu',
	'Relations industrielles - Perspectives internationales',
	'Relations industrielles - Sante et mieux-etre au travail',
	'Sante communautaire',
	'Sante environnementale et sante au travail',
	'Sante environnementale mondiale',
	'Sante et securite du travail',
	'Sante mentale',
	'Sante mentale : fondements et pratiques d intervention',
	'Sante mondiale',
	'Sante numerique',
	'Sante publique',
	'Sante publique pour cadres et professionnels en exercice',
	'Science politique',
	'Science politique et Philosophie',
	'Sciences biomedicales',
	'Sciences cognitives',
	'Sciences de l information (archivistique et bibliotheconomie)',
	'Sciences de l information - Recherche',
	'Sciences de l???orthophonie et de l???audiologie',
	'Sciences de la readaptation',
	'Sciences des donnees',
	'Sciences des religions',
	'Sciences infirmieres - Soins palliatifs et de fin de vie',
	'Sciences neurologiques',
	'Sciences religieuses',
	'Securite et etudes policieres',
	'Securite interieure',
	'Service social',
	'Service social - Campus Laval',
	'Sociologie',
	'Soins prehospitaliers d???urgence avances',
	'Soutien a la transition scolaire des eleves ayant des besoins p',
	'Spiritualite et sante',
	'Statistique',
	'Statistiques sociales',
	'Synthese et architectures moleculaires',
	'Technologie et innocuite des aliments',
	'Theologie',
	'Theologie - Etudes bibliques',
	'Theologie pratique',
	'Toxicologie et analyse du risque',
	'Traduction',
	'Traduction troisieme langue',
	'Travail social',
	'Travail social - Campus Laval',
	'Travail social - Campus Montreal',
	'Urbanisme',
	'Virologie et immunologie '

);

create type disciplines as enum
(
	'Ecole de travail social',
	'Mathematiques et statistique',
	'Admin. et fondements de l educ',
	'Gestion /eval./pol. de sante',
	'Faculte des sciences infirmieres,Gestion /eval./pol. de sante',
	'Faculte des arts et des sciences,Gestion /eval./pol. de sante',
	'Informatique et rech. oper.',
	'Science politique',
	'Design',
	'Urbanisme/architecture paysage',
	'Faculte des arts et des sciences,Direction (Sante publique)',
	'Direction Arts et sciences',
	'Administration de la sante',
	'Chimie',
	'Psychopedagogie et andragogie',
	'SAFIRE',
	'Anthropologie',
	'Centre d etudes classiques',
	'Architecture',
	'Architecture de paysage',
	'Bibliotheconomie',
	'Orthophonie et audiologie',
	'Biochimie/medecine moleculaire',
	'Biochimie',
	'Medecine sociale et preventive',
	'Sciences biologiques',
	'Physique',
	'Faculte des arts et des sciences',
	'Histoire de l art',
	'Communication',
	'Criminologie',
	'Demographie',
	'Demographie,Anthropologie',
	'Demographie,Geographie',
	'Demographie,Mathematiques et statistique',
	'Didactique',
	'Relations industrielles',
	'Direction Polytechnique',
	'Sciences economiques',
	'Science politique,Sciences economiques',
	'Histoire de l art,Litteratures lang. fran??aise',
	'Formation initiale des maitres',
	'Faculte de medecine',
	'Litteratures et lang. modernes',
	'Histoire',
	'Philosophie',
	'Faculte de l amenagement',
	'Sante env. et sante au travail',
	'Readaptation',
	'Pediatrie',
	'Litteratures/langues du monde',
	'Litteratures et lang. modernes,Histoire',
	'Etudes anglaises,Litterature comparee',
	'Etudes Asie de l est',
	'Histoire de l art,Litterature comparee',
	'Centre d etudes classiques,Anthropologie',
	'Litterature comparee',
	'Faculte des arts et des sciences,Faculte de l amenagement',
	'Faculte de medecine,Etudes superieures et postdoctorales',
	'Etudes superieures et postdoctorales',
	'Et. classiques et medievales',
	'Litteratures lang. fran??aise',
	'Institut d etudes religieuses',
	'Mathematiques et statistique,Sciences economiques',
	'Faculte des arts et des sciences,Faculte de l education permane',
	'Pharmacologie et physiologie',
	'Geographie',
	'Urbanisme',
	'Centre d etudes classiques,Histoire',
	'Sciences cliniques',
	'Faculte de droit,Faculte de l education permanente',
	'Kinesiologie /sc.act.physique',
	'Faculte de l education permanente',
	'Linguistique et traduction',
	'Linguistique et traduction,Psychologie',
	'Litterature comparee,Philosophie',
	'Litteratures lang. fran??aise,Linguistique et traduction',
	'Litteratures lang. fran??aise,Philosophie',
	'Sciences economiques,Mathematiques et statistique',
	'Informatique et rech. oper.,Mathematiques et statistique',
	'Mathematiques et statistique,Physique',
	'Anesthesio./med. de la douleur',
	'Sante buccale',
	'Dentisterie de restauration',
	'Biomedecine veterinaire',
	'Pathologie et microbiologie',
	'Sociologie',
	'Microbio. infectio. et immuno.',
	'Psychologie',
	'Neurosciences',
	'Nutrition',
	'Direction Optometrie',
	'Faculte de medecine,Ophtalmologie',
	'Pathologie et biologie cellul.',
	'Chirurgie',
	'Direction Pharmacie',
	'Philosophie,Centre d etudes classiques',
	'Physiologie',
	'Physique,Informatique et rech. oper.',
	'Psychoeducation',
	'Sociologie,Psychologie',
	'Faculte de medecine,Faculte des sciences infirmieres',
	'Psychiatrie et addictologie',
	'Ecole de sante publique,Faculte des sciences infirmieres',
	'Direction (Sante publique)',
	'Ecole de sante publique',
	'Medecine sociale et preventive,Gestion /eval./pol. de sante,San',
	'Programmes de cycles superieurs en sciences biomedicales',
	'Faculte des sciences infirmieres',
	'Medecine de famille/d urgence'
);

create table personne
(
	matricule int primary key,
	code_postal text not null,
	nom_personne text not null,
	date_naissance date not null,
	faculte facultes,
	telephone_personne text,
	courriel_personne text not null,
	no_personne int not null,
	constraint age_personne check(date_naissance >= '1900-01-01')
);

create table prenoms
(
	matricule int not null,
	prenom text not null,
	foreign key (matricule) references personne(matricule),
	primary key(matricule, prenom)
);

create table etudiant
(
	matricule int unique not null,
	programme programmes not null,
	credits_completes int,
	gpa float,
	foreign key (matricule) references personne(matricule), 
	constraint gpa_check check(gpa >= 0 and gpa <= 4.3),
	constraint credits_pos check(credits_completes >= 0)
);

	
create table professeur
(
	matricule int not null,
	discipline disciplines not null,
	foreign key (matricule) references personne(matricule)
);

create table programmes_departements
(
	programme programmes primary key,
	faculte facultes not null,
	discipline disciplines not null
);

create table code_postal
(
	code_postal text primary key,
	ville text not null,
	province text not null
);


create table entreprise
(
	id_entreprise int primary key,
	nom_entreprise text not null,
	courriel_entreprise text not null,
	telephone_entreprise text not null,
	participante bool not null default true,
	domaine text
);


create table adresses
(
	id_entreprise int not null,
	code_postal text not null,
	no_entreprise int not null,
	rue_entreprise text not null,
	foreign key (id_entreprise) references entreprise(id_entreprise),
	primary key(id_entreprise, code_postal, no_entreprise, rue_entreprise)
);


create table stage_1
(
	id_entreprise int not null references entreprise(id_entreprise),
	matricule_etudiant int not null references personne(matricule),
	matricule_professeur int not null references personne(matricule),
	poste text, 
	date_debut date not null,
	date_fin date,
	heures_travaillees numeric(4,2),
	primary key (date_debut, id_entreprise, matricule_etudiant)
);


create table stage_2
(
	poste text primary key,
	salaire_horaire numeric(6,2)
);


create table visites
(
	id_entreprise int not null,
	matricule_etudiant int not null,
	date_debut date,
	date_fin date,
	date_visite date,
	foreign key (id_entreprise) references entreprise(id_entreprise),
	foreign key (matricule_etudiant) references etudiant(matricule),
	primary key (id_entreprise, matricule_etudiant, date_visite),
	constraint check_date check(date_visite >= date_debut and date_visite <= date_fin)
);




INSERT INTO programmes_departements VALUES ('Action communautaire', 'Arts et sciences', 'Ecole de travail social');
INSERT INTO programmes_departements VALUES ('Actuariat', 'Arts et sciences', 'Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Administration de l education', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Administration de l education (D.Ed.)', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Administration des services de sante', 'Ecole de sante publique', 'Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Administration des services de sante, option Gestion des servic', 'Ecole de sante publique', 'Faculte des sciences infirmieres,Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Administration des services de sante, option administration soc', 'Ecole de sante publique', 'Faculte des arts et des sciences,Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Administration des systemes d education et de formation', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Administration des systemes informatiques', 'Arts et sciences', 'Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Affaires publiques et internationales', 'Arts et sciences', 'Science politique');
INSERT INTO programmes_departements VALUES ('Amenagement, option Design Urbain', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Amenagement, option Ville, territoire, paysage', 'Amenagement', 'Urbanisme/architecture paysage');
INSERT INTO programmes_departements VALUES ('Analyse des megadonnees en sante', 'Medecine', 'Faculte des arts et des sciences,Direction (Sante publique)');
INSERT INTO programmes_departements VALUES ('Analyse des megadonnees en sciences humaines et sociales', 'Arts et sciences', 'Direction Arts et sciences');
INSERT INTO programmes_departements VALUES ('Analyse et evaluation des interventions en sante', 'Ecole de sante publique', 'Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Analyse et evaluation des services, organisations et systemes d', 'Ecole de sante publique', 'Administration de la sante');
INSERT INTO programmes_departements VALUES ('Analyses environnementales et industrielles', 'Arts et sciences', 'Chimie');
INSERT INTO programmes_departements VALUES ('Andragogie', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Annee preparatoire', 'Arts et sciences', 'SAFIRE');
INSERT INTO programmes_departements VALUES ('Anthropologie', 'Arts et sciences', 'Anthropologie');
INSERT INTO programmes_departements VALUES ('Archeologie classique', 'Arts et sciences', 'Centre d etudes classiques');
INSERT INTO programmes_departements VALUES ('Architecture', 'Amenagement', 'Architecture');
INSERT INTO programmes_departements VALUES ('Architecture de paysage', 'Amenagement', 'Architecture de paysage');
INSERT INTO programmes_departements VALUES ('Archivistique', 'Arts et sciences', 'Bibliotheconomie');
INSERT INTO programmes_departements VALUES ('Arts et sciences', 'Arts et sciences', 'SAFIRE');
INSERT INTO programmes_departements VALUES ('Audiologie', 'Medecine', 'Orthophonie et audiologie');
INSERT INTO programmes_departements VALUES ('Bio-informatique', 'Medecine', 'Biochimie/medecine moleculaire');
INSERT INTO programmes_departements VALUES ('Biochimie', 'Medecine', 'Biochimie/medecine moleculaire');
INSERT INTO programmes_departements VALUES ('Biochimie clinique ', 'Medecine', 'Biochimie/medecine moleculaire');
INSERT INTO programmes_departements VALUES ('Biochimie et medecine moleculaire', 'Medecine', 'Biochimie');
INSERT INTO programmes_departements VALUES ('Bioethique', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Biologie (Sciences)', 'Arts et sciences', 'Sciences biologiques');
INSERT INTO programmes_departements VALUES ('Biophysique et physiologie moleculaire', 'Arts et sciences', 'Physique');
INSERT INTO programmes_departements VALUES ('Biostatistique', 'Arts et sciences', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Bureautique', 'Education permanente', 'Faculte des arts et des sciences');
INSERT INTO programmes_departements VALUES ('Chimie', 'Arts et sciences', 'Chimie');
INSERT INTO programmes_departements VALUES ('Cinema', 'Arts et sciences', 'Histoire de l art');
INSERT INTO programmes_departements VALUES ('Communication (Sciences)', 'Arts et sciences', 'Communication');
INSERT INTO programmes_departements VALUES ('Communication dans les organisations en changement', 'Arts et sciences', 'Communication');
INSERT INTO programmes_departements VALUES ('Communication et Politique', 'Arts et sciences', 'Science politique');
INSERT INTO programmes_departements VALUES ('Communication mediatique', 'Arts et sciences', 'Communication');
INSERT INTO programmes_departements VALUES ('Communication organisationnelle', 'Arts et sciences', 'Communication');
INSERT INTO programmes_departements VALUES ('Communication politique', 'Arts et sciences', 'Communication');
INSERT INTO programmes_departements VALUES ('Complements de formation', 'Arts et sciences', 'SAFIRE');
INSERT INTO programmes_departements VALUES ('Criminalistique et information', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Criminologie', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Criminologie - Analyse criminologique', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Criminologie - Campus Laval', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Criminologie - Intervention criminologique', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Demographie', 'Arts et sciences', 'Demographie');
INSERT INTO programmes_departements VALUES ('Demographie et Anthropologie', 'Arts et sciences', 'Demographie,Anthropologie');
INSERT INTO programmes_departements VALUES ('Demographie et Geographie', 'Arts et sciences', 'Demographie,Geographie');
INSERT INTO programmes_departements VALUES ('Demographie et Statistique', 'Arts et sciences', 'Demographie,Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Design : orientation design d interieur', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Design : orientation design industriel', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Design d interieur', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Design de jeux', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Design des jardins', 'Amenagement', 'Architecture de paysage');
INSERT INTO programmes_departements VALUES ('Design industriel', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Design urbain', 'Amenagement', 'Design');
INSERT INTO programmes_departements VALUES ('Didactique', 'Sciences de l education', 'Didactique');
INSERT INTO programmes_departements VALUES ('Didactique et integration des matieres', 'Sciences de l education', 'Didactique');
INSERT INTO programmes_departements VALUES ('Droit et travail', 'Droit', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Ecodesign strategique', 'Amenagement', 'Direction Polytechnique');
INSERT INTO programmes_departements VALUES ('Economie (Sciences)', 'Arts et sciences', 'Sciences economiques');
INSERT INTO programmes_departements VALUES ('Economie et Politique', 'Arts et sciences', 'Science politique,Sciences economiques');
INSERT INTO programmes_departements VALUES ('Ecriture de scenario et creation litteraire', 'Arts et sciences', 'Histoire de l art,Litteratures lang. fran??aise');
INSERT INTO programmes_departements VALUES ('Education comparee et fondements de l education', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Education prescolaire et enseignement primaire - Campus Laval', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Education prescolaire et enseignement primaire - Campus Montrea', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Education, option education prescolaire et enseignement primair', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Education, option orthopedagogie', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Education, option pedagogie universitaire des sciences de la sa', 'Sciences de l education', 'Faculte de medecine');
INSERT INTO programmes_departements VALUES ('Enseignement', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement au secondaire', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement de l education physique et a la sante', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement de l espagnol, langue seconde', 'Arts et sciences', 'Litteratures et lang. modernes');
INSERT INTO programmes_departements VALUES ('Enseignement de l ethique et de la culture religieuse au second', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement de l histoire au collegial', 'Arts et sciences', 'Histoire');
INSERT INTO programmes_departements VALUES ('Enseignement de l univers social au secondaire', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement de la philosophie au collegial', 'Arts et sciences', 'Philosophie');
INSERT INTO programmes_departements VALUES ('Enseignement des mathematiques au secondaire', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement des sciences et des technologies au secondaire', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement du fran??ais au secondaire', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement du fran??ais langue seconde', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement en adaptation scolaire - Campus Laval', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Enseignement en adaptation scolaire - Campus Montreal', 'Sciences de l education', 'Formation initiale des maitres');
INSERT INTO programmes_departements VALUES ('Environnement et developpement durable', 'Arts et sciences', 'Faculte de l amenagement');
INSERT INTO programmes_departements VALUES ('Environnement, sante et gestion des catastrophes', 'Ecole de sante publique', 'Sante env. et sante au travail');
INSERT INTO programmes_departements VALUES ('Epidemiologie', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Epidemiologie et controle des infections', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Ergotherapie', 'Medecine', 'Readaptation');
INSERT INTO programmes_departements VALUES ('Ethique clinique', 'Medecine', 'Pediatrie');
INSERT INTO programmes_departements VALUES ('Ethique clinique pediatrique', 'Medecine', 'Pediatrie');
INSERT INTO programmes_departements VALUES ('Ethique et droit', 'Arts et sciences', 'Philosophie');
INSERT INTO programmes_departements VALUES ('Etudes allemandes', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes allemandes dans le contexte europeen', 'Arts et sciences', 'Litteratures et lang. modernes');
INSERT INTO programmes_departements VALUES ('Etudes allemandes et Histoire', 'Arts et sciences', 'Litteratures et lang. modernes,Histoire');
INSERT INTO programmes_departements VALUES ('Etudes anglaises', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes anglaises et Litterature comparee', 'Arts et sciences', 'Etudes anglaises,Litterature comparee');
INSERT INTO programmes_departements VALUES ('Etudes arabes', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes asiatiques', 'Arts et sciences', 'Etudes Asie de l est');
INSERT INTO programmes_departements VALUES ('Etudes autochtones', 'Arts et sciences', 'Anthropologie');
INSERT INTO programmes_departements VALUES ('Etudes catalanes', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes cinematographiques', 'Arts et sciences', 'Histoire de l art');
INSERT INTO programmes_departements VALUES ('Etudes cinematographiques et Litterature comparee', 'Arts et sciences', 'Histoire de l art,Litterature comparee');
INSERT INTO programmes_departements VALUES ('Etudes classiques', 'Arts et sciences', 'Centre d etudes classiques');
INSERT INTO programmes_departements VALUES ('Etudes classiques et Anthropologie', 'Arts et sciences', 'Centre d etudes classiques,Anthropologie');
INSERT INTO programmes_departements VALUES ('Etudes du jeu video', 'Arts et sciences', 'Histoire de l art');
INSERT INTO programmes_departements VALUES ('Etudes est-asiatiques', 'Arts et sciences', 'Etudes Asie de l est');
INSERT INTO programmes_departements VALUES ('Etudes hispaniques', 'Arts et sciences', 'Litterature comparee');
INSERT INTO programmes_departements VALUES ('Etudes individualisees', 'Et. superieures et postdoct', 'Faculte des arts et des sciences,Faculte de l amenagement');
INSERT INTO programmes_departements VALUES ('Etudes individualisees - M.Sc.', 'Arts et sciences', 'Faculte de medecine,Etudes superieures et postdoctorales');
INSERT INTO programmes_departements VALUES ('Etudes individualisees ??? M.Sc.A.', 'Amenagement', 'Etudes superieures et postdoctorales');
INSERT INTO programmes_departements VALUES ('Etudes internationales', 'Arts et sciences', 'Science politique');
INSERT INTO programmes_departements VALUES ('Etudes italiennes', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes latino-americaines', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes lusophones', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes medievales', 'Arts et sciences', 'Et. classiques et medievales');
INSERT INTO programmes_departements VALUES ('Etudes neo-helleniques', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Etudes quebecoises', 'Arts et sciences', 'Litteratures lang. fran??aise');
INSERT INTO programmes_departements VALUES ('Etudes religieuses', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Evaluation des competences', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Evaluation des technologies de la sante', 'Ecole de sante publique', 'Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Exploration de technologies informatiques', 'Arts et sciences', 'Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Finance mathematique et computationnelle ', 'Arts et sciences', 'Mathematiques et statistique,Sciences economiques');
INSERT INTO programmes_departements VALUES ('Fondements et pratiques en sciences sociales et sante', 'Universite de Montreal', 'Faculte des arts et des sciences,Faculte de l education permane');
INSERT INTO programmes_departements VALUES ('Formation a l enseignement postsecondaire', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Formation preparatoire en relations industrielles', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Genetique medicale', 'Medecine', 'Pediatrie');
INSERT INTO programmes_departements VALUES ('Genie biomedical ', 'Medecine', 'Pharmacologie et physiologie');
INSERT INTO programmes_departements VALUES ('Geographie', 'Arts et sciences', 'Geographie');
INSERT INTO programmes_departements VALUES ('Geographie appliquee en environnement', 'Arts et sciences', 'Geographie');
INSERT INTO programmes_departements VALUES ('Geographie environnementale', 'Arts et sciences', 'Geographie');
INSERT INTO programmes_departements VALUES ('Geographie et etudes environnementales', 'Arts et sciences', 'Geographie');
INSERT INTO programmes_departements VALUES ('Geomatique et analyse spatiale', 'Arts et sciences', 'Geographie');
INSERT INTO programmes_departements VALUES ('Geomatique et cartographie dynamique', 'Arts et sciences', 'Geographie');
INSERT INTO programmes_departements VALUES ('Gestion de l information numerique', 'Arts et sciences', 'Bibliotheconomie');
INSERT INTO programmes_departements VALUES ('Gestion de la qualite et de la securite des patients', 'Ecole de sante publique', 'Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Gestion des services de sante et des services sociaux', 'Education permanente', 'Faculte de medecine');
INSERT INTO programmes_departements VALUES ('Gestion du changement en education', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Gestion du changement et responsabilite populationnelle', 'Ecole de sante publique', 'Administration de la sante');
INSERT INTO programmes_departements VALUES ('Gestion du systeme de sante', 'Ecole de sante publique', 'Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Gestion urbaine pour les pays en developpement', 'Amenagement', 'Urbanisme');
INSERT INTO programmes_departements VALUES ('Histoire', 'Arts et sciences', 'Histoire');
INSERT INTO programmes_departements VALUES ('Histoire ancienne', 'Arts et sciences', 'Centre d etudes classiques');
INSERT INTO programmes_departements VALUES ('Histoire de l art', 'Arts et sciences', 'Histoire de l art');
INSERT INTO programmes_departements VALUES ('Histoire et Etudes classiques', 'Arts et sciences', 'Centre d etudes classiques,Histoire');
INSERT INTO programmes_departements VALUES ('Hygiene du travail', 'Ecole de sante publique', 'Sante env. et sante au travail');
INSERT INTO programmes_departements VALUES ('Informatique', 'Arts et sciences', 'Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Informatique appliquee', 'Arts et sciences', 'Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Initiation a la programmation', 'Education permanente', 'Faculte des arts et des sciences');
INSERT INTO programmes_departements VALUES ('Initiation au multimedia', 'Education permanente', 'Faculte des arts et des sciences');
INSERT INTO programmes_departements VALUES ('Insertion professionnelle en enseignement', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Integration pedagogique du numerique', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Internat de perfectionnement en sciences appliquees veterinaire', 'Medecine veterinaire', 'Sciences cliniques');
INSERT INTO programmes_departements VALUES ('Intervention educative', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Jeu video', 'Arts et sciences', 'Histoire de l art');
INSERT INTO programmes_departements VALUES ('Journalisme', 'Arts et sciences', 'Faculte de droit,Faculte de l education permanente');
INSERT INTO programmes_departements VALUES ('Justice et victimes', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Kinesiologie', 'Medecine', 'Kinesiologie /sc.act.physique');
INSERT INTO programmes_departements VALUES ('Kinesiologie - Sciences de l activite physique', 'Medecine', 'Kinesiologie /sc.act.physique');
INSERT INTO programmes_departements VALUES ('Langue et culture chinoises', 'Arts et sciences', 'Etudes Asie de l est');
INSERT INTO programmes_departements VALUES ('Langue et culture coreennes', 'Arts et sciences', 'Etudes Asie de l est');
INSERT INTO programmes_departements VALUES ('Langue et culture grecques', 'Arts et sciences', 'Centre d etudes classiques');
INSERT INTO programmes_departements VALUES ('Langue et culture hispaniques', 'Arts et sciences', 'Direction Arts et sciences');
INSERT INTO programmes_departements VALUES ('Langue et culture japonaises', 'Arts et sciences', 'Etudes Asie de l est');
INSERT INTO programmes_departements VALUES ('Langue et culture latines', 'Arts et sciences', 'Centre d etudes classiques');
INSERT INTO programmes_departements VALUES ('Langue et culture neo-helleniques', 'Arts et sciences', 'Direction Arts et sciences');
INSERT INTO programmes_departements VALUES ('Langue et culture russes', 'Arts et sciences', 'Direction Arts et sciences');
INSERT INTO programmes_departements VALUES ('Langues modernes', 'Arts et sciences', 'Litteratures et lang. modernes');
INSERT INTO programmes_departements VALUES ('Leadership et gestion des etablissements scolaires', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Leadership pour militaires', 'Education permanente', 'Faculte de l education permanente');
INSERT INTO programmes_departements VALUES ('Lettres et sciences humaines', 'Arts et sciences', 'Litteratures lang. fran??aise');
INSERT INTO programmes_departements VALUES ('Linguistique', 'Arts et sciences', 'Linguistique et traduction');
INSERT INTO programmes_departements VALUES ('Linguistique et Psychologie', 'Arts et sciences', 'Linguistique et traduction,Psychologie');
INSERT INTO programmes_departements VALUES ('Litterature', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Litterature comparee', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Litterature comparee et Philosophie', 'Arts et sciences', 'Litterature comparee,Philosophie');
INSERT INTO programmes_departements VALUES ('Litteratures de langue fran??aise', 'Arts et sciences', 'Litteratures lang. fran??aise');
INSERT INTO programmes_departements VALUES ('Litteratures de langue fran??aise et Linguistique', 'Arts et sciences', 'Litteratures lang. fran??aise,Linguistique et traduction');
INSERT INTO programmes_departements VALUES ('Litteratures de langue fran??aise et Philosophie', 'Arts et sciences', 'Litteratures lang. fran??aise,Philosophie');
INSERT INTO programmes_departements VALUES ('Litteratures de langues anglaise et fran??aise', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Mathematiques', 'Arts et sciences', 'Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Mathematiques et Economie', 'Arts et sciences', 'Sciences economiques,Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Mathematiques et Informatique', 'Arts et sciences', 'Informatique et rech. oper.,Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Mathematiques et Physique', 'Arts et sciences', 'Mathematiques et statistique,Physique');
INSERT INTO programmes_departements VALUES ('Mathematiques et Statistique', 'Arts et sciences', 'Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Medecine - Echocardiographie transoesophagienne peri-operatoire', 'Medecine', 'Anesthesio./med. de la douleur');
INSERT INTO programmes_departements VALUES ('Medecine dentaire - Dentisterie pediatrique', 'Medecine dentaire', 'Sante buccale');
INSERT INTO programmes_departements VALUES ('Medecine dentaire - Orthodontie', 'Medecine dentaire', 'Sante buccale');
INSERT INTO programmes_departements VALUES ('Medecine dentaire - Rehabilitation prosthodontique', 'Medecine dentaire', 'Dentisterie de restauration');
INSERT INTO programmes_departements VALUES ('Medecine dentaire - Sciences buccodentaires', 'Medecine dentaire', 'Sante buccale');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Biomedecine veterinaire', 'Medecine veterinaire', 'Biomedecine veterinaire');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Diagnostic en laboratoire', 'Medecine veterinaire', 'Pathologie et microbiologie');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Interface animal-homme-environnement et ', 'Medecine veterinaire', 'Pathologie et microbiologie');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Internat de perfectionnement en sciences', 'Medecine veterinaire', 'Sciences cliniques');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Interventions en sante publique veterina', 'Medecine veterinaire', 'Pathologie et microbiologie');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Pathologie veterinaire', 'Medecine veterinaire', 'Pathologie et microbiologie');
INSERT INTO programmes_departements VALUES ('Medecine veterinaire - Sciences cliniques veterinaires', 'Medecine veterinaire', 'Sciences cliniques');
INSERT INTO programmes_departements VALUES ('Media, culture et technologie', 'Arts et sciences', 'Communication');
INSERT INTO programmes_departements VALUES ('Mesure et evaluation en education', 'Sciences de l education', 'Admin. et fondements de l educ');
INSERT INTO programmes_departements VALUES ('Methodologies d analyse sociologique', 'Arts et sciences', 'Sociologie');
INSERT INTO programmes_departements VALUES ('Microbiologie et immunologie', 'Medecine', 'Microbio. infectio. et immuno.');
INSERT INTO programmes_departements VALUES ('Mobilite, transport et urbanisme', 'Amenagement', 'Urbanisme');
INSERT INTO programmes_departements VALUES ('Multimedia', 'Arts et sciences', 'Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Neuropsychologie clinique', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Neuroscience cognitive', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Neurosciences', 'Medecine', 'Neurosciences');
INSERT INTO programmes_departements VALUES ('Nutrition', 'Medecine', 'Nutrition');
INSERT INTO programmes_departements VALUES ('Optometrie', 'Optometrie', 'Direction Optometrie');
INSERT INTO programmes_departements VALUES ('Optometrie - Sciences de la vision', 'Optometrie', 'Faculte de medecine,Ophtalmologie');
INSERT INTO programmes_departements VALUES ('Optometrie - intervention en deficience visuelle', 'Optometrie', 'Direction Optometrie');
INSERT INTO programmes_departements VALUES ('Orthodidactique des mathematiques', 'Sciences de l education', 'Didactique');
INSERT INTO programmes_departements VALUES ('Orthodidactique du fran??ais', 'Sciences de l education', 'Didactique');
INSERT INTO programmes_departements VALUES ('Orthopedagogie - Eleves en difficulte d adaptation et de compor', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Orthopedagogie - Eleves handicapes', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Orthopedagogie - Soutien a l apprentissage', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Orthophonie', 'Medecine', 'Orthophonie et audiologie');
INSERT INTO programmes_departements VALUES ('Pathologie et biologie cellulaire', 'Medecine', 'Pathologie et biologie cellul.');
INSERT INTO programmes_departements VALUES ('Pathologie moleculaire et medecine personnalisee', 'Medecine', 'Pathologie et biologie cellul.');
INSERT INTO programmes_departements VALUES ('Pedagogie universitaire des sciences de la sante', 'Sciences de l education', 'Faculte de medecine');
INSERT INTO programmes_departements VALUES ('Pedagogie universitaire des sciences medicales', 'Sciences de l education', 'Faculte de medecine');
INSERT INTO programmes_departements VALUES ('Perfusion extracorporelle', 'Medecine', 'Chirurgie');
INSERT INTO programmes_departements VALUES ('Petite enfance et approche interprofessionnelle', 'Sciences de l education', 'Readaptation');
INSERT INTO programmes_departements VALUES ('Pharmacie', 'Pharmacie', 'Direction Pharmacie');
INSERT INTO programmes_departements VALUES ('Pharmacogenomique', 'Medecine', 'Pharmacologie et physiologie');
INSERT INTO programmes_departements VALUES ('Pharmacologie', 'Medecine', 'Pharmacologie et physiologie');
INSERT INTO programmes_departements VALUES ('Pharmacologie clinique', 'Medecine', 'Pharmacologie et physiologie');
INSERT INTO programmes_departements VALUES ('Philosophie', 'Arts et sciences', 'Philosophie');
INSERT INTO programmes_departements VALUES ('Philosophie et Etudes classiques', 'Arts et sciences', 'Philosophie,Centre d etudes classiques');
INSERT INTO programmes_departements VALUES ('Physiologie', 'Medecine', 'Pharmacologie et physiologie');
INSERT INTO programmes_departements VALUES ('Physiologie moleculaire, cellulaire et integrative', 'Medecine', 'Pharmacologie et physiologie');
INSERT INTO programmes_departements VALUES ('Physiotherapie', 'Medecine', 'Readaptation');
INSERT INTO programmes_departements VALUES ('Physiotherapie - Reeducation perineale et pelvienne', 'Medecine', 'Readaptation');
INSERT INTO programmes_departements VALUES ('Physiotherapie avancee en neuro-musculosquelettique', 'Medecine', 'Readaptation');
INSERT INTO programmes_departements VALUES ('Physique', 'Arts et sciences', 'Physique');
INSERT INTO programmes_departements VALUES ('Physique et Informatique', 'Arts et sciences', 'Physique,Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Physique medicale', 'Arts et sciences', 'Physique');
INSERT INTO programmes_departements VALUES ('Programmation', 'Arts et sciences', 'Informatique et rech. oper.');
INSERT INTO programmes_departements VALUES ('Programmation Internet', 'Arts et sciences', 'Faculte des arts et des sciences');
INSERT INTO programmes_departements VALUES ('Programme d accueil en sciences', 'Arts et sciences', 'SAFIRE');
INSERT INTO programmes_departements VALUES ('Psychoeducation', 'Arts et sciences', 'Psychoeducation');
INSERT INTO programmes_departements VALUES ('Psychoeducation - Campus Laval', 'Arts et sciences', 'Psychoeducation');
INSERT INTO programmes_departements VALUES ('Psychologie', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - Campus Laval', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - Campus Montreal', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - option Neuropsychologie clinique', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - option Psychologie clinique', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - option psychologie du travail et organisations', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - recherche et intervention', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - recherche et intervention - option Neuropsycholog', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - recherche et intervention - option Psychologie cl', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie - recherche et intervention - option Psychologie du', 'Arts et sciences', 'Psychologie');
INSERT INTO programmes_departements VALUES ('Psychologie et Sociologie', 'Arts et sciences', 'Sociologie,Psychologie');
INSERT INTO programmes_departements VALUES ('Psychopedagogie', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Recherche interdisciplinaire en sante de la reproduction', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Recits et medias autochtones', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Relations ethniques', 'Arts et sciences', 'Sociologie');
INSERT INTO programmes_departements VALUES ('Relations industrielles', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Relations industrielles - Dynamique des relations du travail', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Relations industrielles - Gestion de la diversite dans les orga', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Relations industrielles - Gestion strategique des ressources hu', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Relations industrielles - Perspectives internationales', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Relations industrielles - Sante et mieux-etre au travail', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Sante communautaire', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Sante environnementale et sante au travail', 'Ecole de sante publique', 'Sante env. et sante au travail');
INSERT INTO programmes_departements VALUES ('Sante environnementale mondiale', 'Ecole de sante publique', 'Sante env. et sante au travail');
INSERT INTO programmes_departements VALUES ('Sante et securite du travail', 'Arts et sciences', 'Relations industrielles');
INSERT INTO programmes_departements VALUES ('Sante mentale', 'Medecine', 'Psychiatrie et addictologie');
INSERT INTO programmes_departements VALUES ('Sante mentale : fondements et pratiques d intervention', 'Education permanente', 'Faculte des arts et des sciences');
INSERT INTO programmes_departements VALUES ('Sante mondiale', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Sante numerique', 'Ecole de sante publique', 'Gestion /eval./pol. de sante');
INSERT INTO programmes_departements VALUES ('Sante publique', 'Ecole de sante publique', 'Medecine sociale et preventive,Gestion /eval./pol. de sante,San');
INSERT INTO programmes_departements VALUES ('Sante publique pour cadres et professionnels en exercice', 'Ecole de sante publique', 'Medecine sociale et preventive');
INSERT INTO programmes_departements VALUES ('Science politique', 'Arts et sciences', 'Science politique');
INSERT INTO programmes_departements VALUES ('Science politique et Philosophie', 'Arts et sciences', 'Philosophie');
INSERT INTO programmes_departements VALUES ('Sciences biomedicales', 'Medecine', 'Programmes de cycles superieurs en sciences biomedicales');
INSERT INTO programmes_departements VALUES ('Sciences cognitives', 'Arts et sciences', 'Linguistique et traduction');
INSERT INTO programmes_departements VALUES ('Sciences de l information (archivistique et bibliotheconomie)', 'Arts et sciences', 'Bibliotheconomie');
INSERT INTO programmes_departements VALUES ('Sciences de l information - Recherche', 'Arts et sciences', 'Bibliotheconomie');
INSERT INTO programmes_departements VALUES ('Sciences de l???orthophonie et de l???audiologie', 'Medecine', 'Orthophonie et audiologie');
INSERT INTO programmes_departements VALUES ('Sciences de la readaptation', 'Medecine', 'Readaptation');
INSERT INTO programmes_departements VALUES ('Sciences des donnees', 'Arts et sciences', 'Informatique et rech. oper.,Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Sciences des religions', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Sciences infirmieres - Soins palliatifs et de fin de vie', 'Sciences infirmieres', 'Faculte des sciences infirmieres');
INSERT INTO programmes_departements VALUES ('Sciences neurologiques', 'Medecine', 'Neurosciences');
INSERT INTO programmes_departements VALUES ('Sciences religieuses', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Securite et etudes policieres', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Securite interieure', 'Arts et sciences', 'Criminologie');
INSERT INTO programmes_departements VALUES ('Service social', 'Arts et sciences', 'Ecole de travail social');
INSERT INTO programmes_departements VALUES ('Service social - Campus Laval', 'Arts et sciences', 'Ecole de travail social');
INSERT INTO programmes_departements VALUES ('Sociologie', 'Arts et sciences', 'Sociologie');
INSERT INTO programmes_departements VALUES ('Soins prehospitaliers d???urgence avances', 'Medecine', 'Medecine de famille/d urgence');
INSERT INTO programmes_departements VALUES ('Soutien a la transition scolaire des eleves ayant des besoins p', 'Sciences de l education', 'Psychopedagogie et andragogie');
INSERT INTO programmes_departements VALUES ('Spiritualite et sante', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Statistique', 'Arts et sciences', 'Mathematiques et statistique');
INSERT INTO programmes_departements VALUES ('Statistiques sociales', 'Arts et sciences', 'Sociologie');
INSERT INTO programmes_departements VALUES ('Synthese et architectures moleculaires', 'Arts et sciences', 'Chimie');
INSERT INTO programmes_departements VALUES ('Technologie et innocuite des aliments', 'Medecine veterinaire', 'Pathologie et microbiologie');
INSERT INTO programmes_departements VALUES ('Theologie', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Theologie - Etudes bibliques', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Theologie pratique', 'Arts et sciences', 'Institut d etudes religieuses');
INSERT INTO programmes_departements VALUES ('Toxicologie et analyse du risque', 'Ecole de sante publique', 'Sante env. et sante au travail');
INSERT INTO programmes_departements VALUES ('Traduction', 'Arts et sciences', 'Linguistique et traduction');
INSERT INTO programmes_departements VALUES ('Traduction troisieme langue', 'Arts et sciences', 'Litteratures/langues du monde');
INSERT INTO programmes_departements VALUES ('Travail social', 'Arts et sciences', 'Ecole de travail social');
INSERT INTO programmes_departements VALUES ('Travail social - Campus Laval', 'Arts et sciences', 'Ecole de travail social');
INSERT INTO programmes_departements VALUES ('Travail social - Campus Montreal', 'Arts et sciences', 'Ecole de travail social');
INSERT INTO programmes_departements VALUES ('Urbanisme', 'Amenagement', 'Urbanisme');
INSERT INTO programmes_departements VALUES ('Virologie et immunologie ', 'Medecine', 'Microbio. infectio. et immuno.');
INSERT INTO code_postal VALUES ('G0A1A0', 'Sainte-Christine-D Auvergne', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1A1', 'Saint-Alban', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1B0', 'Baie-St-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1C0', 'Basilique-Ste-Anne', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1E0', 'BEAUPORT', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1G0', 'Val-Belair', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1H0', 'Boischatel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1J0', 'Bon Pasteur', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1K0', 'Cap-Rouge', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1L0', 'Cap-Sant??', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1M0', 'Casey', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1N0', 'Ch??teau-Richer', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1P0', 'Clova', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1R0', 'Courcelette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1S0', 'Deschambault', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1T0', 'Donnacona', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1V0', 'Duchesnay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1W0', 'Grondines', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1X0', 'Lac-Beauport', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1Y0', 'Jacques-Cartier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A1Z0', 'Kiskissink', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2A0', 'La Baleine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2B0', 'Lac-Aux-Brochets', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2E0', 'Lac-Des-Sept-Iles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2G0', 'Lac-Edouard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2H0', 'Lac-St-Charles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2J0', 'Sainte-Catherine-De-La-Jacques-Cartier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2K0', 'L Ange Gardien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2L0', 'Petite-Rivi??re-Saint-Fran??ois', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2M0', 'LES ??bouLEMENTS', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2N0', 'Les Ecureuils', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2P0', 'Mont-Apica', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2R0', 'Neuville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2S0', 'Notre-Dame-Des-Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2T0', 'Oskelaneo', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2V0', 'Parent', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2W0', 'Plage Germain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2X0', 'Pont-Rouge', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A2Y0', 'Portneuf', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3A0', 'RIVI??RE-VERTE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3C0', 'Sainte-Anne-De-Bellevue', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3E0', 'St-Augustin-De-Quebec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3G0', 'Saint-Basile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3H0', 'St-Basile-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3J0', 'Saint-Bernard-Sur-Mer', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3K0', 'Sainte-Brigitte-De-Laval', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3L0', 'Saint-Casimir', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3N0', 'St-Emile-De-Quebec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3P0', 'Sainte-Famille', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3R0', 'SAINT-PIERRE-LES-BECQUETS', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3S0', 'Saint-Fran??ois-D ORL??ANS', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3T0', 'Saint-Gilbert', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3V0', 'Saint Hilarion', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3W0', 'SAINT-Fran??ois-D ORL??ANS', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3X0', 'St-Joachim-De-Montmorency', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3Y0', 'Les ??boulements', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A3Z0', 'SAINT-LAURENT NORD', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4A0', 'SAINT-LEONARD-PARENT', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4B0', 'SAINT-ROCH-DES-AULNAIES', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4C0', 'SAINT-PATRICE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4E0', 'Saint-Pierre-Ile-D Orleans', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4G0', 'Saint-Raymond', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4H0', 'Saint-Thuribe', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4J0', 'Saint-Tite-Des-Caps', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4K0', 'Saint-Urbain-De-Charlevoix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4L0', 'Saint-Ubalde', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4M0', 'Weymontachie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4N0', 'Shannon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4P0', 'Lac-Delage', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4R0', 'Triton Fishing Club', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4S0', 'Saint-Gabriel-De-Valcartier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4T0', 'Val-St-Michel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4V0', 'Wendake', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A4W0', 'Valcartier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A5A0', 'Baie St-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0A8E0', 'Wemotaci', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1A0', 'Bassin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1B0', 'Cap-Aux-Meules', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1C0', 'Entry Island', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1E0', 'L Etang-Du-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1G0', 'Fatima', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1H0', 'Grande-Entree', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1J0', 'Havre-Aubert', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1K0', 'Havre-Aux-Maisons', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1L0', 'La Verniere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1M0', 'Leslie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1N0', 'Millerand', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0B1P0', 'Pointe-Aux-Loups', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1A0', 'Barachois', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1B0', 'Biron', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1C0', 'Black Cape', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1E0', 'Bonaventure', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1G0', 'Cap-D Espoir', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1H0', 'Caplan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1J0', 'Carleton', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1K0', 'Chandler', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1L0', 'Pointe-A-La-Croix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1M0', 'Douglastown', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1N0', 'Escuminac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1P0', 'Gascons', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1R0', 'Gasp??', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1S0', 'Gasp?? Harbour', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1T0', 'ARCADIA', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1V0', 'Grande-Rivi??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1W0', 'Grande-Riviere-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1X0', 'L Alverne', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1Y0', 'Maria', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C1Z0', 'New Carlisle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2A0', 'Newport', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2B0', 'New Richmond', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2C0', 'New Richmond Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2E0', 'Nouvelle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2H0', 'Pabos', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2J0', 'Pabos Mills', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2K0', 'Hope', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2L0', 'Perce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2M0', 'POINTE CLAIRE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2N0', 'Port-Daniel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2P0', 'Port Venier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2R0', 'Listuguj', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2S0', 'Riviere-Paspebiac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2T0', 'Ruisseau-Leblanc', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2V0', 'Saint-Alphonse-De-Caplan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2W0', 'Saint-Elzear-De-Bonaventure', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2X0', 'Saint-Georges-De-Malbaie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2Y0', 'Saint-Jogues', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C2Z0', 'Saint-Omer', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C3A0', 'Saint-Simeon-De-Bonaventure', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C3B0', 'Sainte-Therese-De-Gasp??', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C3C0', 'Saint-Godefroi', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C3E0', 'Shigawake', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0C3G0', 'Val-D Espoir', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1A0', 'Anse-Au-Griffon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1B0', 'Anse-Ste-Anne-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1C0', 'Cap-Au-Renard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1E0', 'Cap-Des-Rosiers', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1G0', 'Cloridorme', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1H0', 'Fontenelle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1J0', 'Forillon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1K0', 'GRAND VALLEY', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1L0', 'Gros-Morne', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1M0', 'L Anse-A-Valleau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1N0', 'L Echouerie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1P0', 'Madeleine-Centre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1R0', 'Manche-D Epee', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1S0', 'Marsoui', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1T0', 'Mont-Louis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1V0', 'Mont-Saint-Pierre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1W0', 'Murdochville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1X0', 'Petit-Cap', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1Y0', 'Petite-Vallee', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E1Z0', 'Riviere-A-Claude', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2A0', 'Riviere-Au-Renard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2B0', 'Riviere-Madeleine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2C0', 'PRINCESS HARBOUR', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2G0', 'Sainte-Anne-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2H0', 'Martin River', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2J0', 'Tourelle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0E2K0', 'Ste-Anne-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1A0', 'Aguanish', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1B0', 'Baie-Johan-Beetz', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1C0', 'Blanc-Sablon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1E0', 'Brador', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1G0', 'Chevery', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1H0', 'Clarke City', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1J0', 'Fermont', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1K0', 'Gagnon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1L0', 'Gallix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1M0', 'Gethsemani', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1N0', 'Harrington Harbour', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1P0', 'Havre-Saint-Pierre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1R0', 'L Ile-Michon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1S0', 'Kegaska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1T0', 'La Tabatiere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1V0', 'Longue-Pointe-De-Mingan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1W0', 'Lourdes-De-Blanc-Sablon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1X0', 'Magpie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1Y0', 'Massey Park', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G1Z0', 'Middle Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2A0', 'Mingan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2B0', 'Moisie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2C0', 'Mutton Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2E0', 'Natashquan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2G0', 'Old Fort Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2H0', 'Point-Parent', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2J0', 'Port-Cartier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2K0', 'Port-Cartier-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2L0', 'Riviere-Au-Tonnerre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2M0', 'Riviere-Brochu', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2N0', 'Riviere-Saint-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2P0', 'Riviere-Saint-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2R0', 'Saint-Augustin-Saguenay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2S0', 'Salmon Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2T0', 'Schefferville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2V0', 'Sheldrake', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2W0', 'Tete-A-La-Baleine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2X0', 'De Grasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2Y0', 'Port-Menier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0G2Z0', 'Kawawachikamach', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1A0', 'BIENFAIT', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1B0', 'Betsiamites', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1C0', 'Chute-Aux-Outardes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1E0', 'Franquelin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1G0', 'Godbout', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1H0', 'Les Buissons', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1J0', 'Manicouagan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1K0', 'Manic Trois', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1L0', 'Micoua', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1M0', 'Pointe-Aux-Outardes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1N0', 'Pointe-Lebel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1P0', 'Colombier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1R0', 'Riviere-Pentecote', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1S0', 'Ragueneau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0H1T0', 'Baie-Comeau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1A0', 'Albertville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1B0', 'Amqui', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1C0', 'Baie-Des-Sables', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1E0', 'Cap-Chat', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1G0', 'Cap-Chat-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1H0', 'Capucins', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1J0', 'Causapscal', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1K0', 'Grosses-Roches', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1L0', 'Mont-Joli', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1M0', 'Lac-Au-Saumon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1N0', 'Saint-Z??non-Du-Lac-Humqui', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1P0', 'L ASSOMPTION', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1R0', 'L Ascension-De-Patapedia', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1S0', 'Metis Beach', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1T0', 'ILE DES CHENES', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1V0', 'MONT-APICA', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1X0', 'Padoue', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1Y0', 'Petit-Matane', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J1Z0', 'Price', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2A0', 'Routhierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2B0', 'Saint-Adelme', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2C0', 'Saint-Alexandre-Des-Lacs', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2E0', 'Saint-Alexis-De-Matap??dia', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2G0', 'Saint-Andre-De-Restigouche', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2H0', 'SAINTE-ANG??le-DE-MONNOIR', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2J0', 'SAINT-ALEXIS-DE-MATAP??DIA', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2K0', 'Sainte-F??LICIT??', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2L0', 'Sainte-Flavie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2M0', 'Sainte-Florence', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2N0', 'SAINTE-FRANCOISE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2P0', 'Ste-Ir??ne-De-Matap??dia', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2R0', 'Saint-Jean-De-Cherbourg', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2S0', 'St-Jean-De-Matapedia', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2T0', 'Ste-Jeanne-D Arc-De-Matane', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2V0', 'Saint-Leandre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2W0', 'Saint-Basile-Le-Grand', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2X0', 'Matane', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2Y0', 'Sainte-Marguerite-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J2Z0', 'Saint-Moise', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3A0', 'Saint-Noel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3B0', 'St-Octave', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3C0', 'Sainte-Paule', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3E0', 'SAINT-JEAN-DE-MATHA', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3G0', 'Saint-Tharcisius', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3H0', 'Saint-Ulric', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3J0', 'Saint-Vianney', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3K0', 'Sayabec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3L0', 'Val-Brillant', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0J3N0', 'Saint-Cleophas', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1A0', 'Esprit-Saint', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1B0', 'SAINTE-ANNE-DES-MONTS', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1C0', 'Les Hauteurs', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1E0', 'Luceville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1G0', 'Pointe-Au-Pere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1H0', 'Pointe-Au-P??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1J0', 'Sainte-Blandine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1K0', 'Saint-Charles-Garnier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1L0', 'Saint-Pascal', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1M0', 'Saint-Gabriel-De-Rimouski', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1N0', 'St-Gabriel-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1P0', 'Sainte-Luce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1R0', 'Saint-Marcellin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1S0', 'Rimouski', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1T0', 'Biencourt', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1V0', 'Lac-Des-Aigles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K1W0', 'Saint-Guy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0K4K0', 'Saint-Gabriel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L0K0', 'St-Gabriel-De-Kamouraska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1A0', 'Auclair', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1B0', 'Le Bic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1E0', 'Cabano', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1G0', 'Cacouna', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1H0', 'Degelis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1J0', 'Sully', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1K0', 'Rang-Saint-David', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1L0', 'L Isle-Verte-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1M0', 'Kamouraska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1P0', 'Saint-Antonin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1R0', 'Lamy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1S0', 'Lejeune', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1T0', 'St-Marc-Du-Lac Long', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1V0', 'LOST RIVER', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1W0', 'Mont-Carmel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1X0', 'Notre-Dame-Du-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1Y0', 'Notre-Dame-Du-Portage', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L1Z0', 'Packington', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2A0', 'Pointe-Riviere-Du-Loup', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2B0', 'Rivi??re-Bleue', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2C0', 'Rivi??re-Ouelle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2E0', 'Trois-Pistoles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2G0', 'Saint-Alexandre-De-Kamouraska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2H0', 'Saint-Germain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2K0', 'Saint Marys', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2L0', 'St-Athanase', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2M0', 'Saint-Bruno-De-Kamouraska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2N0', 'Saint-Clement', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2P0', 'Saint-Cyprien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2R0', 'Saint-Denis-De-La-Bouteillerie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2S0', 'St-Denis-Sur-Mer', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2T0', 'Saint-Eleuthere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2V0', 'Saint-Eloi', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2X0', 'Saint-Epiphane', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2Y0', 'Saint-Eusebe', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L2Z0', 'Saint-Fabien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3A0', 'St-Fabien-Sur-Mer', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3B0', 'Sainte-Francoise', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3C0', 'Saint-Francois-Xavier-De-Viger', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3H0', 'St-Guy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3J0', 'SAINT-JOSEPH-DE-KAMOURASKA', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3K0', 'SAINT-BRUNO-DE-KAMOURASKA', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3L0', 'Saint-Hubert-Rivi??re-Du-Loup', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3M0', 'Saint-Jean-De-Dieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3N0', 'St-Jean-De-La-Lande', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3P0', 'Saint-Joseph-De-Kamouraska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3R0', 'SAINT-SIMEON', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3S0', 'Saint-Louis-Du-Ha-Ha', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3T0', 'Saint-Mathieu-De-Rioux', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3V0', 'Saint-Medard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3W0', 'Saint-Modeste', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L3X0', 'Saint-Pacome', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L4A0', 'SAINT-PHILIPPE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L4B0', 'Saint-Pierre-De-Lamy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L4C0', 'Saint-Simon-De-Rimouski', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L4E0', 'Bic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L4G0', 'Sainte-Rita', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0L4H0', 'Squatec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1A0', 'Beauceville-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1B0', 'Saint-Martin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1C0', 'Courcelles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1E0', 'St-Jean-De-La-Lande-De-Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1G0', 'La Guadeloupe', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1H0', 'Lambton', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1J0', 'SAINT-ELIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1K0', 'Notre-Dame-Des-Pins', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1L0', 'Saint-Alfred', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1M0', 'Sainte-Aur??lie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1N0', 'Saint-Benjamin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1P0', 'Saint-Beno??t-Labre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1R0', 'Saint-Ephrem-De-Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1S0', 'SAINTE-MARIE-DE-BLANDFORD', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1T0', 'Saint G??d??on', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1W0', 'Saint-Ludger', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1X0', 'Saint-Philibert', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1Y0', 'Saint-Prosper-De-Dorchester', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M1Z0', 'SAINT-ADRIEN', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M2A0', 'Saint-Theophile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M2B0', 'Saint-Victor', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M2C0', 'Saint-Zacharie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0M2E0', 'Saint-Robert-Bellarmin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1A0', 'Black Lake', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1B0', 'Saint-Joseph-De-Coleraine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1C0', 'Sainte-Clotilde-De-Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1E0', 'ADMIRAL', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1G0', 'East Broughton', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1J0', 'Saint-Jacques-De-Leeds', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1K0', 'Kinnear s Mills', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1L0', 'Robertsonville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1M0', 'Saint-Adrien-D Irlande', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1N0', 'Saint-Ferdinand', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1P0', 'Saint-Frederic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1R0', 'Saint-Jules', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1S0', 'Adstock', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1T0', 'Saint-Pierre-De-Broughton', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1V0', 'SAINT-EPHREM-DE-BEAUCE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1W0', 'Sacre-Coeur-De-Marie-Partie-S', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N1X0', 'Tring-Jonction', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0N2E0', 'Thetford-Mines', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1A0', 'Ham-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1B0', 'Norbertville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1C0', 'Notre-Dame-De-Ham', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1E0', 'Princeville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1G0', 'Saint-Fortunat', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1H0', 'Sainte-Helene-De-Chester', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1J0', 'Chesterville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1K0', 'Saint-Pierre-Baptiste', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1L0', 'Sainte-Sophie-D Halifax', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1M0', 'Kirouac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0P1M5', 'Victoriaville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1A0', 'Armagh', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1A1', 'Saint-Charles-De-Bellechasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1B0', 'Saint-Cyprien-Des-Etchemins', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1C0', 'Beaumont', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1E0', 'Berthier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1G0', 'Buckland', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1H0', 'Cap-Saint-Ignace', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1J0', 'Cap-St-Ignace-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1K0', 'Daaquam', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1L0', 'Saint-Luc-De-Bellechasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1M0', 'Ste-Marguerite-De-Dorchester', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1N0', 'Lac-Trois-Saumons', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1P0', 'L Isle-Aux-Grues', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1S0', 'Lac Etchemin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1T0', 'LAFONTAINE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1W0', 'La Durantaye', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1X0', 'Lamartine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1Y0', 'Sainte-Justine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R1Z0', 'LA PATRIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2A0', 'La Pocatiere-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2C0', 'L Isletville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2E0', 'St.-Bernard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2G0', 'Morigeau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2H0', 'Notre-Dame-Du-Rosaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2K0', 'Pintendre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2M0', 'Saint-Adalbert', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2N0', 'St-Anselme', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2P0', 'Sainte-Apolline-De-Patton', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2S0', 'Saint-Camille-De-Bellechasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2V0', 'Sainte-Claire', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2X0', 'Saint-Damase-Des-Aulnaies', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2Y0', 'Saint-Damien-De-Buckland', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R2Z0', 'SAINTE-SOPHIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3A0', 'ST-FRANCOIS-DE-LAVAL', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3A6', 'St-Nazaire-De-Buckland', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3B0', 'Ste-Germaine-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3C0', 'Saint-Gervais', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3E0', 'Saint-Henri-De-L??vis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3G0', 'Saint-Jean-Port-Joli', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3H0', 'Saint-Just-De-Breteni??res', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3J0', 'Saint-Lazare-De-Bellechasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3K0', 'Sainte-Louise', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3L0', 'Sainte-Lucie-De-Beauregard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3M0', 'Saint-Magloire', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3N0', 'Saint-Malachie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3P0', 'St-Malachie-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3R0', 'St-Marcel-De-L Islet', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3S0', 'Saint-Michel-De-Bellechasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3W0', 'ST PONS', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3X0', 'Saint-Pamphile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3Y0', 'Saint-Paul-De-Montminy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R3Z0', 'Sainte-Perp??tue-De-L Islet', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4A0', 'Saint-Philemon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4B0', 'Saint-Patrice-De-La-Rivi??re-Du-Loup', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4C0', 'SAINT PAUL', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4E0', 'Saint-Roch-Des-Aulnaies', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4G0', 'Sainte-Rose-De-Watford', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4H0', 'Sainte-Sabine-De-Bellechasse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4J0', 'Saint-Vallier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4K0', 'Sanatorium-Begin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4L0', 'Standon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4M0', 'Tourville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4N0', 'Village-Des-Aulnaies', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4P0', 'SAINTE-F??LICIT??', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0R4R0', 'Saint-Omer-L Islet', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1A0', 'Beauceville-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1B0', 'Sainte Anne', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1C0', 'Bernieres', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1E0', 'Sainte-Helene-De-Breakeyville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1G0', 'Deschaillons-Sur-Saint-Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1H0', 'Dosquet', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1J0', 'Fortierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1K0', 'Inverness', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1L0', 'Issoudun', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1M0', 'Joly', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1N0', 'Laurier-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1P0', 'Laurierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1R0', 'Leclercville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1S0', 'BIRNIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1T0', 'Lourdes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1V0', 'Lyster', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1W0', 'Saint-Narcisse-De-Beaurivage', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1X0', 'Parisville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1Y0', 'Saint-Edouard-De-Lotbini??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S1Z0', 'Saint-Agapit', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2A0', 'SAINT-EDOUARD-DE-LOTBINI??RE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2B0', 'Ste-Anastasie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2C0', 'Saint-Antoine-De-Tilly', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2E0', 'Saint-Apollinaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2F0', 'Sainte-Agathe-De-Lotbiniere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2G0', 'Saint-Bernard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2H0', 'Sainte-Croix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2J0', 'SAINT-LAZARE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2L0', 'St-Etienne-De-Lauzon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2M0', 'Saint-Flavien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2P0', 'Saint-Gilles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2R0', 'SAINTE-BLANDINE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2S0', 'Saint-Isidore', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2T0', 'St-Jean-Chrysostome-De-Levis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2V0', 'St-Joseph-De-Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2W0', 'Saint-Lambert-De-Lauzon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2Y0', 'Ste-Marie-Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S2Z0', 'St-Nicolas', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3A0', 'Beauceville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3B0', 'St-Redempteur-De-Levis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3C0', 'Saint-Sylvestre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3E0', 'HERVEY-JONCTION', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3G0', 'Scott', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3H0', 'Val-Alain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3J0', 'Vallee-Jonction', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3K0', 'Villeroy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0S3L0', 'St-Nicolas Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T0L4', 'Longue Rive', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1A0', 'Baie-Sainte-Catherine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1B0', 'Cap-A-L Aigle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1C0', 'Clermont', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1E0', 'Forestville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1G0', 'Grandes-Bergeronnes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1H0', 'Labrieville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1J0', 'La Malbaie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1K0', 'Les Escoumins', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1L0', 'Notre-Dame-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1M0', 'Pointe-Au-Pic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1N0', 'Riviere-Mailloux', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1P0', 'Riviere-Portneuf', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1R0', 'Sainte-Agnes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1S0', 'Saint-Aime-Des-Lacs', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1T0', 'Saint-Fidele', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1V0', 'Saint-Irenee', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1W0', 'Saint-Paul-Du-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1X0', 'Saint-Simeon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1Y0', 'Chicoutimi', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T1Z0', 'Longue-Rive', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0T2A0', 'Tadoussac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1A0', 'Alouette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1C0', 'Martel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1D0', 'Sainte-Rose-Du-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1E0', 'Jean-Dechene', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1G0', 'Saint-Charles-De-Bourget', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1H0', 'Ferland-Et-Boilleau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1J0', 'L Anse-Saint-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1K0', 'Laterriere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1M0', 'Saint-Felix-D Otis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1N0', 'Petit-Saguenay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1P0', 'Riviere-Eternite', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1R0', 'St-Ambroise-De-Chicoutimi', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1S0', 'Saint-Fulgence', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1V0', 'Shipshaw', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0V1W0', 'Lamarche', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1A0', 'Albanel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1B0', 'Saint-Antoine-Du-Lac-Saint-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1C0', 'Mistissini', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1E0', 'Peribonka', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1G0', 'Chambord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1H0', 'Chapais', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1J0', 'Chutes-Des-Passes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1K0', 'Dalmas', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1L0', 'Delisle', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1N0', 'Desbiens', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1P0', 'Saint-Thomas-Didyme', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1R0', 'Girardville Centre', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1S0', 'Hebertville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1T0', 'Hebertville-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1V0', 'Lac-Bouchette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1W0', 'Lac-A-La-Croix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1Y0', 'L Ascension-De-Notre-Seigneur', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W1Z0', 'Larouche', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2A0', 'Metabetchouan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2B0', 'Saint-Ludger-De-Milot', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2C0', 'Mistassini', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2E0', 'Normandin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2H0', 'Mashteuiatsh', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2J0', 'La Dore', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2K0', 'Saint-Antoine-du-Lac-Saint-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2L0', 'Alma', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2M0', 'Saint-Edmond-Les-Plaines', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2N0', 'St-Felicien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2P0', 'Saint-Gedeon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2R0', 'Sainte-Hedwidge-De-Roberval', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2S0', 'Labrecque', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2T0', 'Sainte-Monique-Lac-Saint-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2V0', 'St-Nazaire-Du-Lac-St-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2W0', 'St-Prime', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2X0', 'Taillon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2Y0', 'Ticouape', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W2Z0', 'Village-Villeneuve', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W3A0', 'Dolbeau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0W3B0', 'Obedjiwan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1A0', 'Batiscan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1B0', 'Wolinak', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1C0', 'Champlain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1E0', 'Charette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1G0', 'Gentilly', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1H0', 'Grandes-Piles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1J0', 'GIROUXVILLE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1K0', 'Hervey-Jonction', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1L0', 'Lac-A-La-Tortue', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1M0', 'Lac-Aux-Sables', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1N0', 'Saint-Mathieu-Du-Parc', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1P0', 'Lac-Minogami', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1R0', 'La Croche', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1S0', 'Sainte-Marie-De-Blandford', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1T0', 'Les Vielles Forges', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1V0', 'Manseau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1W0', 'Notre-Dame-De-Montauban', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1X0', 'Montauban-Les-Mines', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X1Z0', 'Pointe-Du-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2A0', 'Precieux-Sang', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2B0', 'Proulxville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2C0', 'Trois-Rives', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2E0', 'Rivi??re-Mekinac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2G0', 'Saint-Adelphe-De-Champlain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2H0', 'Sainte-Angele-De-Laval', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2J0', 'SAINTE-ANNE-DE-SOREL', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2K0', 'St-Barnabe-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2L0', 'St-Boniface De Shawinigan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2M0', 'Sainte-Cecile-De-Levrard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2N0', 'Saint-Elie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2R0', 'sainte genevieve', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2S0', 'Sainte-Gertrude', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2T0', 'Saint-Gregoire', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2V0', 'Saint-Jean-Des-Piles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2X0', 'Saint-Maurice', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2Y0', 'Saint-Narcisse', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X2Z0', 'Saint-Pierre-Les-Becquets', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3A0', 'Saint-Prosper', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3B0', 'SAINT-SYLVESTRE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3C0', 'Sainte-Sophie-De-Levrard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3E0', 'Saint-Stanislas-De-Champlain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3G0', 'SAINTE-TH??R??SE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3H0', 'Saint-Tite', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3J0', 'Notre-Dame-Du-Mont-Carmel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3K0', 'Saint-Luc-De-Vincennes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3L0', 'Yamachiche', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3N0', 'DELACOUR', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0X3V0', 'St-Michel-Des-Saints', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1A0', 'Audet', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1B0', 'Beaulac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1C0', 'Lac-Drolet', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1E0', 'Milan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1G0', 'Lac-Megantic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1H0', 'Piopolis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1J0', 'STE-CECILE-DE-MILTON', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1K0', 'Saint-Gerard', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1L0', 'Saint-Romain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1M0', 'Saint-Sebastien-De-Frontenac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1N0', 'Stornoway', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1P0', 'Stratford', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Y1R0', 'Woburn', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Z1A0', 'Aston-Jonction', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Z1B0', 'Daveluyville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Z1E0', 'Sainte-Eulalie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Z1G0', 'Saint-Samuel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Z1J0', 'Saint-Wenceslas', 'Qu??bec');
INSERT INTO code_postal VALUES ('G0Z1K0', 'Saint-Rosaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1A0A1', 'Qu??bec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1A1A5', 'Quebec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1B0A1', 'Sainte-Foy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1B0A2', 'Beauport', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1B0A6', 'Val-B??lair', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1C1L1', 'Lac-Saint-Charles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1C4X3', 'Charlesbourg', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1C7Z3', 'Sillery', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E0A3', 'Loretteville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E0A6', 'Irlande', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E1T2', 'Levis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E2T4', 'L Ancienne-Lorette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E4N4', 'Saint-Augustin-De-Desmaures', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E6P9', 'Venise-En-Qu??bec', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1E7A6', 'Vanier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1H1G8', 'Saint-??mile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1J2G0', 'Beauport Local 6678', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1V1V6', 'Ste-Foy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G1X5G4', 'Cap Rouge', 'Qu??bec');
INSERT INTO code_postal VALUES ('G2B1B0', 'Neufchatel', 'Qu??bec');
INSERT INTO code_postal VALUES ('G2E1K9', 'Ancienne-Lorette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G2E1Y0', 'Ancienne Lorette', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3A1A0', 'St.-Augustin-De-Desmaures', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3A1V6', 'St-Augustin-De-Desmaures', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3E0B7', 'Saint-Emile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3E1T4', 'St-Emile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3H0B7', 'Sainte-Jeanne-De-Pont-Rouge', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3J1N0', 'Val Belair', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3L1A0', 'Saint-Francois-D Orleans', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3M0A8', 'Les ??cureuils', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3Z0A1', 'Baie-Saint-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('G3Z3W7', 'La Petite-Rivi??re-Saint-Fran??ois', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4R0A1', 'SEPT-??les', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4R0B1', 'Sept-Iles', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4R0B2', 'Sept-??les', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4R4K2', 'Maliotenam', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4T1Z1', 'L Ile-D Entree', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4T3B1', 'L ETANG-DU-NORD', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4T3B2', 'L ??tang-Du-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4T3X1', '??tang-Du-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4T6A1', 'Grosse-Ile', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4T7A2', 'Grande-Entr??e', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4W9C7', 'Saint-Francois-D Assise', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4Z1C0', 'Baie Comeau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G4Z1Y0', 'Anse Comeau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5A1E7', 'La Malbaie-Pointe-Au-Pic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5A1S4', 'Riviere-Malbaie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5A2R0', 'Rivi??re-Malbaie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5B1C0', 'Port Cartier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5C0A6', 'Hauterive', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5H0A8', 'Mont Jolie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5H1V6', 'St-Jean-Baptiste', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5H2V0', 'Mont Joli', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5H3K6', 'Saint-Joseph-De-Lepage', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5H5H6', 'St-Joseph-De-Lepage', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5L0A7', 'Notre-Dame-De-Rimouski', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5L1E9', 'Rimouski-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5L3J9', 'Sainte-Odile-Sur-Rimouski', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5M1A0', 'Pointe Au Pere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5R0A1', 'RIVI??RE-DU-LOUP', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5R0A4', 'Rivi??re-Du-Loup', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5R1E3', 'Riviere-Du-Loup', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5R2B0', 'Riviere Du Loup', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5R2R3', 'L??vis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5R2Z1', 'Saint-Patrice', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5T1A2', 'D??gelis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5V0A1', 'Montmagny', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y0A1', 'Saint-Georges', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y0G4', 'Saint Georges De Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y0G7', 'Aubert-Gallion', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y1A6', 'St-Georges', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y1A9', 'St.-Georges', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y3N4', 'St-Georges-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y5C1', 'Saint-Georges-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('G5Y8H2', 'Aubert Gallion', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6B0A1', 'LAC-M??gantic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6B1A1', 'NANTON', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6B1B0', 'Lac Megantic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6B1E4', 'Lac-M??gantic', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6B2K5', 'Frontenac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6B3E4', 'Nantes', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6E0A1', 'Sainte-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6E1A0', 'Ste.-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6E1C6', 'Ste-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6E1J1', 'St.-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6E6L6', 'Lac Ste-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6G0A1', 'Saint-Jean-De-Brebeuf', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6G1A1', 'Thetford Mines', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6G2S0', 'Thetford', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6G8Y1', 'Kinnear S Mills', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6H3C4', 'Leeds Village', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6H3E8', 'East Broughton Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6J0A1', 'SAINT-??TIENNE-DE-LAUZON', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6J0A6', 'Saint-Etienne-De-Lauzon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6J1A8', 'Saint-??TIENNe-De-Lauzon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6K0A1', 'SAINT-AMATEUR', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6K1B4', 'Saint-Redempteur', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6K1Z3', 'Charny', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6L0A3', 'Plessisville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6P6M1', 'Arthabaska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6P6S2', 'Saint-Christophe-D Arthabaska', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6V1B0', 'Aubigny', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6V2D4', 'Saint-Joseph-De-La-Pointe-De-L??vy', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6V8J1', 'Lauzon', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6W0A4', 'Saint-Romuald', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6W0H4', 'Saint Romald', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6W2E4', 'St-Romuald-D Etchemin', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6W7C9', 'St-David-De-L Auberiviere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6X1X0', 'Quebec/Levis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6Z0A1', 'Saint-Jean-Chrysostome', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6Z1A0', 'St.-Jean-Chrysostome-De-Levis', 'Qu??bec');
INSERT INTO code_postal VALUES ('G6Z3B6', 'St-Jean-Chrysostome', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7A0A1', 'Saint-Nicolas', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7B0A1', 'La Baie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7B0A5', 'Grand-Baie', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7B1Z3', 'Port Alfred/Bagotville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7G1X0', 'Chicoutimi-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7G3W8', 'Canton Tremblay', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7N0A1', 'Laterri??Re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7N1A2', 'LATERRI??RE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7P1Z9', 'Saint-Ambroise', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7P3B4', 'Saint-Andre-Du-Lac-Saint-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7S0A1', 'Jonqui??Re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7S0A3', 'JONQUI??RE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7S0A6', 'Jonquiere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7S1E5', 'Arvida', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7X1C9', 'Jonquiere-Kenogami', 'Qu??bec');
INSERT INTO code_postal VALUES ('G7X7V6', 'Lac-Kenogami', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8G1A1', 'M??TABETCHOUAN-LAC-A-LA-CROIX', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8G1A2', 'Metabetchouan-Lac-A-La-Croix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8G2M5', 'Metabechuoan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8G5J3', 'M??Tabetchouan-Lac-A-La-Croix', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8H1A1', 'Roberval', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8J0A1', 'Saint-Prime', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8J1A1', 'SALVADOR', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8K0A1', 'SAINT-F??LICIEN', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8K0A3', 'Saint-Felicien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8K0A6', 'Saint-F??Licien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8K1A0', 'St.-Felicien', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8L0A1', 'Dolbeau-Mistassini', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8M0A4', 'Saint-Stanislas', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8M4T6', 'Sainte-Elisabeth-De-Proulx', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8N0A1', 'H??BERTVILLE', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8N0B1', 'H??Bertville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8N4C5', 'Notre-Dame-D H??Bertville', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8P0A1', 'Chibougamau', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T0A1', 'TROIS-RIVI??RES', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T0A2', 'Trois-Rivi??res', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T0A5', 'Trois-Rivieres', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T0B2', 'Cap-De-La-Madeleine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T1A7', 'Saint-Louis-De-France', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T2A0', 'Cap De La Madeleine', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T3B9', 'Sainte-Marthe-Du-Cap', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T7V7', 'Ste-Marthe-Du-Cap', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T7V8', 'St-Louis-De-France', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8T9P9', 'Trois-Rivi??res-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8V2A5', 'L ??le-Perrot', 'Qu??bec');
INSERT INTO code_postal VALUES ('G8Y4L8', 'Trois-Rivieres-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9A0A5', 'Trois-Rivi??res Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9B0E5', 'Pointe Du Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9H0A1', 'B??CANCOUR', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9H0B6', 'B??Cancour', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9H0C6', 'Becancour', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N0A1', 'Shawinigan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N0B3', 'Shawenegan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N1E1', 'Grand-m??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N1Y5', 'Baie-De-Shawinigan', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N6K8', 'Saint-Gerard-Des-Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N6S7', 'SAINT-G??RARD-DES-LAURENTIDES', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9N6T5', 'Shawinigan-Sud', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9R0A1', 'Saint-G??Rard-Des-Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9R1X7', 'Lantier', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9T0A1', 'Saint-Georges-De-Champlain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9T1A9', 'Grand-Mere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9T1B0', 'Grand Mere', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9T1B9', 'GRAND-m??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9T3E7', 'Lemoyne', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9T6N4', 'St-Georges-De-Champlain', 'Qu??bec');
INSERT INTO code_postal VALUES ('G9X0A1', 'La Tuque', 'Qu??bec');
INSERT INTO code_postal VALUES ('H0A1A0', 'Address Unknown', 'Qu??bec');
INSERT INTO code_postal VALUES ('H0A1E0', 'Sainte-Marie-De-Laval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H0A1G0', 'St-Francois-De-Laval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H0A2G0', 'St-Francois', 'Qu??bec');
INSERT INTO code_postal VALUES ('H0M1A0', 'Akwesasne', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1A0A1', 'Montr??al', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1A0A3', 'Pointe-Aux-Trembles', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1A0A6', 'Pte Aux Trembles', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1A1B7', 'Montreal', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1B0A2', 'Montr??al-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1B1A9', 'Montr??al-EST', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1B2V2', 'Montreal-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1B5K2', 'Pierrefonds', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1B5K8', 'Lasalle', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1C0B2', 'Riviere Des Prairies', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1E1A7', 'Ahuntsic', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1E1P3', 'Anjou', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1E2Z3', 'Saint-Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1G1A0', 'Montr??al-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1G1A1', 'Montr??al-NORD', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1G1C4', 'Montreal-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1G1L0', 'Montreal Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1H5V7', 'Laval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1L1Q1', 'Long Point', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1M3H7', 'Saint-L??Onard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1M3Y5', 'Longue-Pointe', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1N0A7', 'Brossard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1N3L1', 'Beaconsfield', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1P1A2', 'SAINT L??ONARD', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1P1B3', 'Saint-Leonard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1P1H7', 'ST LEONARD', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1P1N7', 'St-Leonard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1P3R3', 'Ville St-Leonard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1R1L0', 'St.-Leonard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1V1X6', 'Rosemont', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1V1Y7', 'Westmount', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1V3E1', 'Mont-Royal', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1V3L7', 'Kirkland', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1W4A2', 'Sherbrooke', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1X3G5', 'Lachine', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1Y2H5', 'Roxboro', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1Y3K8', 'L ??le-Bizard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H1Z3T4', 'C??Te Saint Michel', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2A3R4', 'St-Michel', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2B1A0', 'Sault-Au-R??Collet', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2B1Y3', 'Duvernay', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2B2Z6', 'St.Leonard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2E2C0', 'Beaubien', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2J0A4', 'Delorimier', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2L3G5', 'Dollard-Des-Ormeaux', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2M2X8', 'Youville', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2R2O2', 'Plateau-Mont-Royal', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2T3E2', 'Outremont', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2V2N1', 'Pointe-Claire', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2X1A3', 'Dorval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3C1C9', 'Ile-Des-Soeurs', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3E0A1', 'Verdun', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3P1Z2', 'Mount-Royal', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3P2Z0', 'Mont Royal', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3R2M1', 'C??Te-Saint-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3S3W5', 'Ville Mont-Royal', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3T1A0', 'Snowdon', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3X1A5', 'Hampstead', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3X1R8', 'Cote Saint-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3X1R9', 'C??te-Saint-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('H3Z2V4', 'Baie-D Urf??', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4A2Y1', 'Notre-Dame-De-Grace', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4B1W9', 'Montr??al-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4B3P3', 'Notre Dame De Grace', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4C0A7', 'Montreal#', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4C3E7', 'Saint-Pierre', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4J2O9', 'Bordeaux', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4K1K8', 'St-Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4K3P3', 'Cartierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4L0A3', 'St.-Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4M2Z2', 'St Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4N1C9', 'Ville St. Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4R0B0', 'St.Laurent', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4W1R5', 'Cote-St-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4W3J6', 'Cote-Saint-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4X1B4', 'Montr??al-OUEST', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4X1C7', 'Montreal-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4Y1A0', 'Pointe Claire Dorval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H4Y1B0', 'Pte Claire Dorval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7A1K9', 'Chambly', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7C1S1', 'Otterburn Park', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7C1S6', 'St-Vincent-De-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7C1W1', 'Lavaltrie', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7C5S5', 'Saint-Vincent-De-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7E0A4', 'Beloeil', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7E4N2', 'Saint-Bruno-De-Montarville', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7E4N3', 'Carignan', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7E4N4', 'Saint-Antoine-De-Lavaltrie', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7H2S4', 'Mont-Saint-Hilaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7H2W7', 'Auteuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7K1K4', 'Lorraine', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7K3G5', 'Vimont', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7L1G4', 'Sainte-Rose', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7L3M7', 'Chomedey', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7N1X2', 'Laval-Des-Rapides', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7N2S5', 'Pont-Viau', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7P2P1', 'Fabreville', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7R1L8', 'Laval-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7V2V0', 'Chomedey Laval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7X1A4', 'Sainte-Dorothee', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7X1A6', 'STE.-DOROTHEE', 'Qu??bec');
INSERT INTO code_postal VALUES ('H7X1E0', 'Ste.-Dorothee', 'Qu??bec');
INSERT INTO code_postal VALUES ('H8N1B8', 'La Salle', 'Qu??bec');
INSERT INTO code_postal VALUES ('H8R1E0', 'St.-Pierre', 'Qu??bec');
INSERT INTO code_postal VALUES ('H8R1P1', 'Terrebonne', 'Qu??bec');
INSERT INTO code_postal VALUES ('H8Y3C0', 'Dollard Des Ormeaux', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9C1B6', 'L Ile-Bizard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9C2C2', 'Ile-Bizard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9C2H0', 'St.-Raphael-De L Ile-Bizard', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9H0B2', 'Sainte-Genevi??Ve-De-Pierrefonds', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9H1A1', 'Sainte-Genevieve', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9H3A2', 'Sainte Genevieve', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9J4R4', 'St Charles', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9P1A4', 'Pointe Claire-Dorval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9P1H9', 'Pointe-Claire-Dorval', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9R1B0', 'Pointe Claire', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9W1B0', 'Ste.-Anne-De-Bellevue', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9W2X2', 'St.-Anne-De-Bellevue', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9X1A1', 'Senneville', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9X1P3', 'Baie-D Urfe', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9X2R1', 'Baie D Urfe', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9X3A0', 'Baie D Urfee', 'Qu??bec');
INSERT INTO code_postal VALUES ('H9X4A4', 'Ste-Anne-De-Bellevue', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1A0', 'Danville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1A1', 'Tingwick', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1B0', 'Kingsey Falls', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1C0', 'Saint-Adrien', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1E0', 'Saint-Albert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1G0', 'Saint-Camille', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1H0', 'Sainte-Elizabeth-De-Warwick', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1J0', 'Saint-Georges-De-Windsor', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1K0', 'Saint-Remi-De-Tingwick', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0A1N0', 'Wotton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B0A3', 'Cookshire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1A0', 'Ascot Corner', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1B0', 'Austin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1C0', 'Ayer s Cliff', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1E0', 'Beebe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1G0', 'Bishopton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1G8', 'Cookshire-Eaton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1H0', 'Bromptonville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1J0', 'Bury', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1K0', 'Chartierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1L0', 'Compton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1N0', 'Deauville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1P0', 'Stanhope', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1R0', 'East Angus', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1S0', 'East Hereford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1T0', 'Georgeville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1V0', 'Greenlay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1W0', 'Sainte-Catherine-De-Hatley', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1X0', 'Kingsbury', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1Y0', 'La Patrie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B1Z0', 'Lennoxville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2A0', 'Martinville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2B0', 'Melbourne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2C0', 'Canton-De-Hatley', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2E0', 'Notre-Dame-Des-Bois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2G0', 'Omerville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2H0', 'Cleveland', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2J0', 'Rock Forest', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2K0', 'Rock Island', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2L0', 'Marbleton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2M0', 'Saint-Benoit-Du-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2N0', 'St-Claude', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2P0', 'Saint-Denis-De-Brompton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2R0', 'Sainte-Edwidge', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2S0', 'Saint-??lie-d Orford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2T0', 'Saint-Felix-De-Kingsey', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2V0', 'St-Francois-Xavier-De-Brompton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2W0', 'Saint-Hermenegilde', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2X0', 'Saint-Isidore-De-Clifton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2Y0', 'Saint-Malo', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B2Z0', 'Lingwick', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3A0', 'Sawyerville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3B0', 'Scotstown', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3E0', 'Stanstead', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3E3', 'Ogden', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3G0', 'Stoke', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3H0', 'Waterville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3J0', 'Weedon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3K0', 'Windsor', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3N0', 'Richmond-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B3S0', 'Richmond', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0B4B0', 'Hatley', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1A0', 'Bon-Conseil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1B0', 'L Avenir', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1C0', 'Saint-Bonaventure', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1E0', 'Sainte-Brigitte-Des-Saults', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1G0', 'SAINT-CLET', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1H0', 'St-Cyrille-De-Wendover', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1J0', 'SAINT-EDMOND-DE-GRANTHAM', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1K0', 'Saint-Edmond-De-Grantham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1L0', 'Saint Guillaume', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1M0', 'Saint-L??Onard-D Aston', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1N0', 'Saint-Lucien', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1P0', 'St-Nicephore', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1R0', 'Sainte-Perpetue', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C1S0', 'Wickham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C2C0', 'Drummondville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0C8A8', 'Saint-Joachim-De-Courval', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1A0', 'Abbotsford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1A1', 'Bolton-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1B0', 'Abercorn', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1C0', 'Bromont 2', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1E0', 'Ange-Gardien', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1G0', 'Saint-Etienne-De-Bolton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1H0', 'Bonsecours', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1J0', 'Brigham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1K0', 'Brome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1L0', 'Bromont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1M0', 'Dunham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1N0', 'East Farnham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1P0', 'Eastman', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1R0', 'Foster', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1S0', 'Fulford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1T0', 'Highwater', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1V0', 'Knowlton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1W0', 'Lawrenceville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1X0', 'Mansonville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1Y0', 'Racine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E1Z0', 'Roxton Pond', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2B0', 'Saint-Joachim-De-Shefford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2C0', 'Ste-Cecile-De-Milton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2H0', 'South Bolton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2J0', 'Stukely-Sud', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2K0', 'Sutton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2L0', 'Valcourt', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2M0', 'Warden', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2N0', 'Waterloo', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E2P0', 'West Br??Me', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0E3G0', 'St-??TIENNe De Bolton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G0O0', 'Baie-Du-Febvre', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1B0', 'Grand-Saint-Esprit', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1C0', 'La Visitation-De-Yamaska', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1E0', 'Nicolet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1G0', 'Notre-Dame-De-Pierreville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1H0', 'Odanak', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1K0', 'Massueville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1L0', 'Pierreville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1N0', 'Sainte-Monique', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1P0', 'Saint-Ours', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1R0', 'Saint-Pie-De-Guire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1S0', 'Saint-Robert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1T0', 'Sainte-Victoire-De-Sorel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1V0', 'Saint-Nazaire-D Acton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G1W0', 'Yamaska-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0G3J0', 'St-David D Yamaska', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H0C0', 'St-Liboire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1A0', 'Acton Vale', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1B0', 'La Pr??Sentation', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1E0', 'Roxton Falls', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1G0', 'SAINT-BERNARD', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1H0', 'Canton-De-Granby', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1J0', 'Saint-Damase', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1K0', 'Saint-Denis-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1L0', 'Saint-Dominique', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1M0', 'SAINT-ETIENNE-DE-BOLTON', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1N0', 'Saint-Charles-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1P0', 'Saint-Jude', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1R0', 'Saint-Liboire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1T0', 'Saint-Marcel-De-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1W0', 'Ste-Roselie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1X0', 'Sainte-Rosalie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H1Z0', 'Saint-Zephirin-De-Courval', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2A0', 'Saint-Thomas-D Aquin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2B0', 'Saint-Theodore-D Acton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2C0', 'Durham-Sud', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2E0', 'Upton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2H0', 'Actonvale', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2J0', 'St-Pie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0H2K0', 'St-Damase', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J0C9', 'Pike River', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1A0', 'Bedford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1B0', 'Clarenceville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1C0', 'Frelighsburg', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1E0', 'Henryville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1G0', 'BEAUHARNOIS', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1H0', 'L Acadie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1J0', 'Lacolle', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1K0', 'Saint-Athanase', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1L0', 'Napierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1M0', 'Notre-Dame-De-Stanbridge', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1N0', 'Philipsburg', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1R0', 'Richelain', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1S0', 'Saint-Alexandre-D Iberville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1T0', 'Saint-Armand', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1V0', 'Saint-Bernard-De-Lacolle', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1W0', 'Saint-Blaise-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1X0', 'Sainte-Brigide-D Iberville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1Y0', 'Saint-Ignace-De-Stanbridge', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J1Z0', 'Saint-Jacques-Le-Mineur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J2A0', 'St-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J2B0', 'Ste-Sabine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J2C0', 'SAINT-BASILE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J2G0', 'Sabrevois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0J2J0', 'Stanbridge Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1A0', 'Berthierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1B0', 'SACRE-COEUR-DE-MARIE-PARTIE-S', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1C0', 'Saint-Ambroise-De-Kildare', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1E0', 'Lanoraie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1G0', 'L Assomption', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1J0', 'L Epiphanie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1K0', 'Lourdes-De-Joliette', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1L0', 'Mandeville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1M0', 'Manouane', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1N0', 'Maskinong??', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1R0', 'Sainte-Angele-De-Premont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1S0', 'Rawdon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1T0', 'Saint-Alexis-De-Montcalm', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1W0', 'Saint-Alexis-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1X0', 'SAINTE-MARTHE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1Y0', 'Sainte-Beatrix', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1Z', 'St-Charles-De-Mandeville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K1Z0', 'Saint-Calixte', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2A0', 'Saint-Cleophas-De-Brandon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2B0', 'SAINT-PACOME', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2C0', 'Saint-Cuthbert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2E0', 'Saint-Damien', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2G0', 'Saint-Didace', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2H0', 'Saint-??Douard-De-Maskinong??', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2K0', 'SAINT-HERMENEGILDE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2L0', 'Saint-Esprit', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2M0', 'ST.-FELIX-DE-VALOIS', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2P0', 'LA VISITATION-DE-YAMASKA', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2R0', 'Saint-Liguori', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2S0', 'Saint-Jean-De-Matha', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2T0', 'Sainte-Julienne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2V0', 'Saint-Justin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2W0', 'SAINT-LIN', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2Y0', 'Sainte-Marcelline-De-Kildare', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K2Z0', 'Sainte-Marie-Salome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3A0', 'SAINTE-MARIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3A3', 'Sainte-M??Lanie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3C0', 'Saint-Norbert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3E0', 'Saint-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3G0', 'St-Paulin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3H0', 'Saint-Roch-De-L Achigan', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3J0', 'St-Sulpice', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3K0', 'St-Theodore Chertsey', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3L0', 'Saint-Thomas', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3M0', 'Sainte-Ursule', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3N0', 'Saint-Z??non', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3P0', 'Vaucluse', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3T0', 'St.-Felix-De-Valois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3W0', 'St-Rock De L Achigan C.P', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3X0', 'Ste-Julienne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3Y0', 'St-Calixte-De-Kilkenny', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K3Z0', 'St-Gerard De Magella', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0K4A0', 'St-Jacques', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1A0', 'Calixa-Lavallee', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1B0', 'Ch??teauguay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1C0', 'Contrecoeur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1E0', 'Ville De Ste-Catherine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1G0', 'Delson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1H0', 'Hemmingford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1J0', 'Marieville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1K0', 'Mercier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1L0', 'Mont-St.-Hilaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1M0', 'Rougemont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1N0', 'Saint-Amable', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1P0', 'Sainte-Ang??le-De-Monnoir', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1R0', 'Saint-Antoine-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1S0', 'St-Basile-Le-Grand', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1T0', 'SAINT-ROSAIRE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1V0', 'St-Charles-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1W0', 'SAINTE-CLOTILDE-DE-BEAUCE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1X0', 'St-Constant', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1Y0', 'Saint-??Douard-De-Napierville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L1Z0', 'St.-Hilaire-Est', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2A0', 'Saint-Isidore-De-Laprairie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2B0', 'Saint-Jean-Baptiste', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2C0', 'Ste-Julie-De-Vercheres', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2E0', 'St-Marc-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2G0', 'St-Mathias', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2H0', 'Saint-Mathieu-De-Laprairie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2J0', 'Saint-Michel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2K0', 'Saint-Philippe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2L0', 'Saint-R??mi', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2M0', 'Saint-Roch-De-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2N0', 'Sherrington', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2P0', 'Varennes', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2R0', 'Verch??Res', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2S0', 'Domaine-Des-Hauts-Bois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2T0', 'Base St-Hubert (Post Militaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2X0', 'Domaine Des Hauts Bois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L2Z0', 'Ste Julie De Vercheres', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L3A0', 'St-Remi', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L3B0', 'Vercheres', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0L3C0', 'St-Cesaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1A0', 'Kangirsuk', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1B0', 'Deception Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1C0', 'Kuujjuaq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1E0', 'Chisasibi', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1G0', 'Kuujjuarapik', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1H0', 'Ivujivik', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1J0', 'Quaqtaq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1K0', 'Kangiqsujuaq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1L0', 'Wemindji', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1M0', 'Inukjuak', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1N0', 'Kangiqsualujjuaq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1P0', 'Puvirnituq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1R0', 'Waskaganish', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1S0', 'Salluit', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1T0', 'Tasiujaq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1V0', 'Akulivik', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1W0', 'Eastmain', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1X0', 'Aupaluk', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1Y0', 'Umiujaq', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M1Z0', 'Eastmain 1', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M2A0', 'Laforge 1', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M2B0', 'Brisay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0M2C0', 'Laforge 2', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1A0', 'Lachenaie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1B0', 'La Plaine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1B2', 'Saint-Augustin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1C0', 'Mascouche', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1E0', 'Oka', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1G0', 'Pointe-Calumet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1H0', 'Sainte-Anne-Des-Plaines', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1J0', 'Mirabel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1K0', 'Saint-Benoit', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1L0', 'St-Janvier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1M0', 'St-Joseph Du Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1P0', 'Sainte-Marthe-Sur-Le-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1S0', 'Ste-Scholastique', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1T0', 'Mascouche Heights', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1V0', 'St-Louis-De-Terrebonne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1W0', 'St.-Louis-De-Terrebonne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1W7', 'La Trappe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1X0', 'Ste-Anne-Des-Plaines', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1Y0', 'Ste-Marthe-Sur-Le-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N1Z0', 'St-Janvier C.P', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0N2E0', 'Lac Du Cerf', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1A0', 'Como', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1B0', 'Coteau-Du-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1C0', 'Coteau-Landing', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1E0', 'Coteau-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1G0', 'Dalhousie Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1H0', 'Hudson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1J0', 'Hudson Heights', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1K0', 'Ile-Perrot-Sud', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1L0', 'Les Cedres', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1M0', 'Pointe-Des-Cascades', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1N0', 'Pointe-Fortune', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1P0', 'Rigaud', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1R0', 'RIVI??RE-BLEUE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1S0', 'Saint-Clet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1T0', 'Sainte-Justine-De-Newton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1V0', 'St-Lazare-De-Vaudreuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1W0', 'Sainte-Marthe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1X0', 'Saint-Polycarpe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1Y0', 'Saint-Telesphore', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P1Z0', 'Saint-Zotique', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P2A0', 'St Lazare De Vaudreuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0P2W0', 'Saint-Lazare', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1A0', 'Mille-Isles', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1A9', 'Saint-Sauveur-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1B0', 'Sainte-Anne-Des-Lacs', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1B8', 'St-Sauveur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1C0', 'Saint-Lin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1E0', 'Lesage', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1G0', 'Mont-Rolland', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1H0', 'Morin-Heights', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1J0', 'Saint-Hippolyte', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1K0', 'Piedmont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1L0', 'Ste-Adele', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1N0', 'Saint-Colomban', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1P0', 'St-Hippolyte-De-Kilkenny', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1P5', 'Ste-Anne Des Lacs', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1R0', 'Saint-Sauveur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1S0', 'Sainte-Sophie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1T0', 'PROVOST', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1V0', 'Village-De-Seraphin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1W0', 'Bellefeuille', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1X0', 'Ste Adele', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1Y0', 'Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R1Z0', 'St.-Lin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R2A0', 'Prevost', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R2B0', 'St-Sauveurs-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0R2C0', 'Ste-Sophie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1A0', 'Athelstan', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1B0', 'Cazaville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1C0', 'Dewittville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1E0', 'Franklin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1G0', 'Sainte-Martine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1H0', 'Godmanchester', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1J0', 'Melocheville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1K0', 'Ormstown', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1L0', 'Elgin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1M0', 'Saint-Anicet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1N0', 'Saint-Antoine-Abb??', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1P0', 'Ste-Barbe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1R0', 'Saint-Chrysostome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1S0', 'Saint-??TIENNe-De-Beauharnois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1T0', 'Saint-Louis-De-Gonzague', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1V0', 'SAINT-PAUL-DE-MONTMINY', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1W0', 'Saint-Stanislas-De-Kostka', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1X0', 'St-Timothee', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S1Y0', 'Saint-Urbain-Premier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S2A0', 'Ste Martine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S2B0', 'Huntingdon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0S2C0', 'Havelock', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1A0', 'Arundel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1B0', 'Br??Beuf', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1C0', 'Ecowi', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1E0', 'Esterel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1G0', 'Boileau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1H0', 'Labelle', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1J0', 'lac-sup??rieur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1J1', 'Saint-Jovite', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1J2', 'SAINT-FAUSTIN', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1K0', 'Lac-Des-Plages', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1L0', 'SAINTE-MARGUERITE-MARIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1M0', 'La Conception', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1N0', 'Lac-St-Denis', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1R0', 'La Macaza', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1S0', 'La Minerve', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1T0', '117 S Rivi??re-Rouge', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1W0', 'L Ascension', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1X0', 'Lussier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1Y0', 'Wentworth-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T1Z0', 'Mont-Tremblant', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2A0', 'Notre-Dame-De-La-Merci', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2A2', 'Lac-sup??rieur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2B0', 'Saint-Adolphe-D Howard', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2C0', 'Saint-Donat-De-Montcalm', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2E0', 'Entrelacs', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2G0', 'Saint-Faustin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2J0', 'St.-Agathe-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2K0', 'Ste-Marguerite-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2L0', 'Amherst', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2M0', 'Lac-Des-Seize-Iles', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2N0', 'Val-David', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2P0', 'Val-Des-Lacs', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2R0', 'Val-Morin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2S0', 'Val-Morin-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2V0', 'Montcalm', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2W0', 'L Annociation', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2X0', 'St-Jovite', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2Y0', 'Lost River', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T2Z0', 'St-Donat-De-Montcalm', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T3A0', 'Val David', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T3B0', 'L Annonciation', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0T3C0', 'Laurel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1A0', 'Brownsburg', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1B0', 'Grenville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1C0', 'Carillon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1E0', 'Ch??N??Ville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1G0', 'Duhamel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1G4', 'Namur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1H0', 'Fassett', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1K0', 'Gore', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1L0', 'Montebello', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1M0', 'Montpellier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1P0', 'Notre-Dame-De-La-Paix', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1R0', 'Papineauville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1S0', 'Plaisance', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1T0', 'Pointe-Au-Chene', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1V0', 'Ripon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1W0', 'ST-ANDRE-AVELLIN', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1Y0', 'Saint-Emile-De-Suffolk', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V1Z0', 'St-Hermas', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V2A0', 'St-Philippe D Argenteuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V2B0', 'Saint-Placide', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V2G0', 'St-Andre-Avellin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0V2V0', 'Saint-Andr??-Avellin', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1A0', 'Chute-Saint-Philippe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1B0', 'Farley', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1C0', 'Ferme-Neuve', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1E0', 'Montcerf-Lytton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1G0', 'Kiamika', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1H0', 'Beaux-Rivages', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1J0', 'Des Ruisseaux', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1K0', 'Lac-Saint-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1L0', 'Lac-Saguay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1M0', 'Maniwak1', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1P0', 'Mont-Saint-Michel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1R0', 'Nominingue', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1S0', 'Lac-Du-Cerf', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1T0', 'Parc-De-La-Verendrye', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1V0', 'Ste-Anne-Du-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1W0', 'Aumond', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W1X0', 'SAINTE-MONIQUE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W2B0', 'Mitchinamecus', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0W2C0', 'Rapid Lake', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1A0', 'Alcove', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1B0', 'Angers', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1C0', 'Blue Sea', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1E0', 'Bouchette', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1G0', 'Norway Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1H0', 'Bryson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1J0', 'Ile Du Grand-Calumet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1K0', 'Campbell s Bay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1L0', 'Cantley', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1M0', 'Chapeau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1N0', 'Chelsea', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1P0', 'Danford Lake', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1R0', 'Davidson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1S0', 'Duclos', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1T0', 'Farrellton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1V0', 'Fort-Coulonge', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1W0', 'Gracefield', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1X0', 'Kazabazua', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1Y0', 'Lac-Cayamant', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X1Z0', 'Deleage', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2A0', 'Ladysmith', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2B0', 'Limbour', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2C0', 'Denholm', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2E0', 'Lucerne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2G0', 'Luskville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2H0', 'Masson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2J0', 'Messines', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2L0', 'Notre-Dame-De-La-Salette', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2M0', 'Notre-Dame-Du-Laus', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2N0', 'Old Chelsea', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2P0', 'Otter Lake', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2P4', 'Thorne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2R0', 'Perkins', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2S0', 'Poltimore', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2T0', 'Portage-Du-Fort', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2V0', 'Quyon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2W0', 'SAINTE-CECILE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2X0', 'Ste-Therese-De-Gatineau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2Y0', 'Shawville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X2Z0', 'Sheenboro', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3A0', 'Tenaga', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3B0', 'Thurso', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3C0', 'Val-Des-Bois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3E0', 'V??nosta', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3G0', 'Wakefield', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3H0', 'Waltham Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3J0', 'Wilsons Corners', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3K0', 'Lac Des Loups', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3L0', 'St-Pierre-De-Wakefield', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3M0', 'Rapides-Des-Joachims', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0X3N0', 'Saint-Sixte', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1A0', 'Barraute', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1A1', 'Matagami', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1B0', 'Beattyville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1C0', 'Cadillac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1E0', 'Champneuf', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1G0', 'Dalquier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1H0', 'Desmaraisville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1J0', 'Saint-Marc-De-Figuery', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1K0', 'Gagnon Siding', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1L0', 'Guyenne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1M0', 'Harricanaw-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1N0', 'Joutel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1P0', 'Lac-Langis', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1R0', 'La Corne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1S0', 'La Morandiere', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1T0', 'La Motte', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1V0', 'Landrienne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1W0', 'Launay-Taschereau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1X0', 'Lebel-Sur-Quevillon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1Y0', 'Louvicourt', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y1Z0', 'Malartic', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2B0', 'Miquelon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2C0', 'Nottaway', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2E0', 'Preissac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2G0', 'Berry', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2H0', 'Riviere-Heva', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2J0', 'Rochebaucourt', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2K0', 'Saint-Dominique-Du-Rosaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2L0', 'Sainte-Gertrude-De-Villeneuve', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2M0', 'Belcourt', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2N0', 'Sullivan', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2P0', 'Val-Senneville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2R0', 'Vassan', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2S0', 'Villemontel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2T0', 'Comtois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2V0', 'La Grande Deux', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2W0', 'La Grande Trois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2X0', 'Radisson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y2Z0', 'Caniapiscau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3A0', 'Sakami', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3B0', 'Nemiscau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3C0', 'Waswanipi', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3E0', 'Laforge-Deux', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3L0', 'Chaumont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3M0', 'Lac-Simon', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Y3N0', 'La Grande 2a', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1A0', 'Angliers', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1B0', 'Arntfield', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1C0', 'Authier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1E0', 'Authier-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1G0', 'Bearn', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1H0', 'Beaucanton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1J0', 'Beaudry', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1K0', 'Bellecombe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1L0', 'Belleterre', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1M0', 'Ste-Germaine-Boule', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1N0', 'Chazel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1P0', 'Clericy', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1R0', 'Mancebourg', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1S0', 'Cloutier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1T0', 'Colombourg', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1V0', 'Desmeloizes', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1W0', 'Duparquet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1X0', 'Dupuy', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1Y0', 'Rouyn-Noranda', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z1Z0', 'Fabre', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2A0', 'Fugereville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2B0', 'Gallichan', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2C0', 'Granada', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2E0', 'BURIN', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2G0', 'Saint-Bruno-De-Guigues', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2H0', 'Kipawa', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2J0', 'Laforce', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2K0', 'Laniel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2L0', 'La Reine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2M0', 'Lasarre', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2N0', 'Latulipe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2P0', 'Laverloch??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2R0', 'Lorrainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2S0', 'Macamic', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2V0', 'Mcwatters', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2W0', 'Moffet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2X0', 'Montbeillard', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2Y0', 'Mont-Brun', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z2Z0', 'Nedelec', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3A0', 'Normetal', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3B0', 'Notre-Dame-Du-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3C0', 'Palmarolle', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3E0', 'Poularies', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3G0', 'Rapide-Danseur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3H0', 'Remigny', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3J0', 'Rollet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3K0', 'Roquemaure', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3L0', 'Saint-Eugene-De-Guigues', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3M0', 'Saint-Vital-De-Clermont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3N0', 'Taschereau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3P0', 'Tee Lake', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3R0', 'BATISCAN', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3S0', 'Val-Paradis', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3T0', 'Val-Saint-Gilles', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3V0', 'Villebois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3W0', 'Ville-Marie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J0Z3X0', 'Destor', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1A0A1', 'Coaticook', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1C0A7', 'Fleurimont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1G3G0', 'Fleuri Mont', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1G4S3', 'Ascot', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1H6W8', 'Sherbrook', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1N1E6', 'Rock-Forest', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1R0C5', 'Saint-??Lie-D Orford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1R1N9', 'Saint-Elie-D Orford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1R2R5', 'St-Elie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1T1A1', 'Asbestos', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1X0A1', 'Magog', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1X0A2', 'Orford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1X0C4', 'Canton Magog', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1Z0A1', 'Saint-Cyrille-De-Wendover', 'Qu??bec');
INSERT INTO code_postal VALUES ('J1Z1S0', 'Saint-Cyrille', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2A0A1', 'SAINT-NIC??PHORE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2A0A4', 'Saint-Nicephore', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2A1A0', 'St.-Nicephore', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2B6X3', 'Grantham-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2C0A2', 'Saint-Charles-De-Drummond', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2C7C5', 'St-Charles-De-Drummond', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2C7G9', 'Grantham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2G0A1', 'Granby', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2G2G0', 'Canton De Shefford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2G6Z7', 'S Granby', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2H1T9', 'Canton De Granby', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2J0A0', 'Cantons-De-Granby', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2K0A1', 'Cowansville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2M0A1', 'Shefford', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2N0A1', 'Farnham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2R0A1', 'Saint-Hyacinthe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2R0A5', 'St.-Hyacinthe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2S0B9', 'La Providence', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2S1E7', 'St-Hyacinthe', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2W0A0', 'St Jean Sur Le Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2W0A1', 'Saint-Jean-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2W0C9', 'Saint-Luc', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2W1K5', 'St.-Jean-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2X0B7', 'Iberville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J2X4B7', 'Sorel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3A1L3', 'St.-Jean', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3A1R7', 'St-Jean-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3A2T2', 'Saint-Jean Sur Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3E0A1', 'Sainte-Julie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3E0B3', 'Ste Julie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3E1G3', 'Ste-Julie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3G0B3', 'Saint-Mathieu-De-Beloeil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3G0B7', 'Mcmasterville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3H0E3', 'Mont-St-Hilaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3H1K3', 'Otterburn-Park', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3H3N0', 'St.-Hilaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3H4G6', 'St-Hilaire', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3L0A8', 'Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3L3Z4', 'Saint-Joseph-De-Sorel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3L5Z7', 'Saint-Mathias-Sur-Richelieu', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3N1S0', 'St-Basile Le Grand', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3P0A1', 'Sorel-Tracy', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3P0B6', 'Sainte-Anne-De-Sorel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3P7V3', 'St-Pierre-De-Sorel', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3R1C1', 'Tracy', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3T1L0', 'Saint-Jean-Baptiste-De-Nicolet', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3V0A1', 'Saint-Bruno', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3V1Y0', 'St.-Bruno', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3V3R9', 'St-Bruno', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3V5K5', 'Bruno', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3V6E6', 'St Bruno', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3V9E3', 'St-Bruno-De-Montarville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3Y0A1', 'Saint-Hubert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3Y1C3', 'St.-Hubert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3Y1G5', 'St-Hubert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3Y2Y6', 'Greenfield Park', 'Qu??bec');
INSERT INTO code_postal VALUES ('J3Y8H2', 'Saint Hubert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4B0A1', 'Boucherville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4G1A0', 'Longueuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4P1A1', 'Saint-Lambert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4P2E7', 'St-Lambert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4P2J0', 'St.-Lambert', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4T1Z0', 'Lafleche', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4V1S3', 'Greenfield-Park', 'Qu??bec');
INSERT INTO code_postal VALUES ('J4X2X1', 'La Prairie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5A0A1', 'Saint-Constant', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5A1A0', 'St.-Constant', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5C0A1', 'Sainte-Catherine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5C1A0', 'Ste-Catherine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5C1G6', 'Ste. Catherine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5K0B3', 'St Colomban', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5K0B9', 'St-Colomban', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5L0A1', 'Saint-J??R??ME', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5L0A2', 'SAINT-J??R??ME', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5L0B1', 'Saint-Jerome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5L0B8', 'Lafontaine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5M0A2', 'Saint-Lin-Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5R0A1', 'Candiac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5R4V0', 'Laprairie', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5V0A1', 'Louiseville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5W1B1', 'Saint-Sulpice', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5W4Z4', 'Saint-Gerard-Majella', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5X0A1', 'L ??PIPHANIE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5Y0A1', 'Repentigny', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5Z0A1', 'Le Gardeur', 'Qu??bec');
INSERT INTO code_postal VALUES ('J5Z1A1', 'Charlemagne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6E0A1', 'SAINT-CHARLES-BORROM??E', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6E0A2', 'Joliette', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6E0A7', 'Notre-Dame-Des-Prairies', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6E0B6', 'Saint-Charles-Borromee', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6E3H2', 'St-Paul', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6E4M7', 'St-Charles-Borromee', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6J0A2', 'Ch??teauguay-Centre', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6J2A8', 'Chateauguay', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6N0A2', 'Beauharnois', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6N1A1', 'L??ry', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6N1E0', 'Maple Grove', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6N1G0', 'Lery', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6N3C1', 'Salaberry-De-Valleyfield', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6N3G3', 'Maple-Grove', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6S0B9', 'Grande-Ile', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6S0G3', 'Saint-Timoth??e', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6S1A1', 'Grande-??le', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6S1B2', 'Valleyfield', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6S2C8', 'Saint-Timothee', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6S4Y7', 'Grande Ile', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6X1X0', 'St-Louis De Terrebonne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Y0E4', 'Bois Des Filions', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Y0E6', 'Saint-Louis-De-Terrebonne', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Z0A1', 'Bois-Des-Filion', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Z1C1', 'St.-Therese-De-Blainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Z1G0', 'Ste-Therese-De-Blainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Z4B5', 'Saint Therese-De-Blainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J6Z4N9', 'Rosemere', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7A0A0', 'Rosem??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7A0A1', 'Blainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7A1A6', 'ROSEm??re', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7C2M0', 'Ste.-Therese-De-Blainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7C4Z4', 'Sainte-TH??R??SE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7E0A2', 'Sainte-TH??R??SE-De-Blainville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7E1E9', 'Sainte-Therese', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7G1A1', 'Boisbriand', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7N0B4', 'Sainte-Scholastique', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7P0A1', 'Saint-Eustache', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7P1A1', 'St.-Eustache', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7P2B2', 'St-Eustache', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7R0A2', 'Deux-Montagnes', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7R1N0', 'Deux Montagnes', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7T1A1', 'LES C??dres', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7T1A2', 'Les C??dres', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V0A1', 'Vaudreuil-Dorion', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V0A3', 'Pincourt', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V0H3', 'Terrasse-Vaudreuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V1E0', 'Vaudreuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V1V0', 'Dorion Vaudreuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V2C8', 'Dorion-Vaudreuil', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V2L0', 'Dorion', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V3B4', 'L Ile-Perrot', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V3G0', 'Ile Perrot', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V3H6', 'NOTRE-DAME-DE-L ??le-PERROT', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V7M4', 'Notre-Dame-De-L ??le-Perrot', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V9L8', 'Notre-Dame-De-L Ile-Perrot', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7V9R7', 'Vaudreuil-Sur-Le-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7X1A1', 'Les C??teaux', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7X1A3', 'Les Coteaux', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Y1E4', 'St.-Jerome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Y2H1', 'St-Jerome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Y3V3', 'St Jerome', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Z2L2', 'Saint-Antoine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Z3B7', 'St-Antoine-Des-Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Z4M0', 'St.-Antoine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Z7N2', 'St-Antoine', 'Qu??bec');
INSERT INTO code_postal VALUES ('J7Z7S3', 'Saint-Antoine-Des-Laurentides', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8B0A1', 'SAINTE-AD??LE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8B0A8', 'Sainte-AD??LE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8B0B2', 'Sainte-Adele', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8B1C1', 'Sainte-Marguerite-Station', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8C0A1', 'Sainte-Agathe-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8C1K0', 'Ste.-Agathe-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8C2J0', 'Sainte-Agathe-Nord', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8C2Y4', 'Sainte-Agathe-Sud', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8C2Z8', 'Ivry-Sur-Le-Lac', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8C3A4', 'Ste-Agathe-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8E0B3', 'Lac Mercier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8G0A1', 'Brownsburg-Chatham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8G1J8', 'Chatham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8G1V1', 'Ayersville', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8G1V6', 'Lachute', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8G2S4', 'Harrington', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8G3H1', 'Grenville-Sur-La-Rouge', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8H0A2', 'Wentworth', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8L0A1', 'L Ange-Gardien', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8L0A2', 'Gatineau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8L0A6', 'Mayo', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8L1A8', 'Buckingham', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8M1G3', 'Masson-Angers', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8N0A2', 'Val-Des-Monts', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8P1Z0', 'Templeton', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8T0A4', 'Pointe Gatineau', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8T1M0', 'Gatineau Point', 'Qu??bec');
INSERT INTO code_postal VALUES ('J8X1A6', 'Hull', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9B2H0', 'Lac-Meach', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9E1A0', 'Egan-Sud', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9E1A1', 'Maniwaki', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9E2V7', 'LAC-DELAGE', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9E3A9', 'Bois-Franc', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9H0B2', 'Aylmer', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9H6W6', 'Aylmer C.P', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9L0A2', 'Mont-Laurier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9L0B6', 'Mont Laurier', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9P0A1', 'Val-D Or', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9P0A3', 'Atikamek', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9P1M9', 'Val D Or', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9P4N7', 'Dubuisson', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9T1A1', 'Amos', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9V1E1', 'Duhamel-Ouest', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9X1E0', 'Rouyn Noranda', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9X2G0', 'Lac-Dufault', 'Qu??bec');
INSERT INTO code_postal VALUES ('J9Z0A1', 'La Sarre', 'Qu??bec');
INSERT INTO code_postal VALUES ('T0B4N1', 'Viking', 'Alberta');
INSERT INTO code_postal VALUES ('V0P1J0', 'Kyuquot', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V5E2P9', 'Burnaby', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V6B1R8', 'Vancouver', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V7H3M2', 'North Vancouver', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V8Y2K3', 'Victoria', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('B4P1E3', 'Wolfville', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('C0B8G4', 'Harmony', 'Ile-du-Prince-??douard');
INSERT INTO code_postal VALUES ('E2E1L7', 'Quispamsis', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('G0P1Y0', 'Saint-S??verin-De-Beauce', 'Qu??bec');
INSERT INTO code_postal VALUES ('K1K4V6', 'Ottawa', 'Ontario');
INSERT INTO code_postal VALUES ('K1V1W8', 'Gloucester', 'Ontario');
INSERT INTO code_postal VALUES ('K7A0K2', 'Montague', 'Ontario');
INSERT INTO code_postal VALUES ('K9V4S3', 'Lindsay', 'Ontario');
INSERT INTO code_postal VALUES ('L0M1T0', 'Angus', 'Ontario');
INSERT INTO code_postal VALUES ('L0N1S2', 'Shelburne', 'Ontario');
INSERT INTO code_postal VALUES ('L0R1T0', 'Hamilton', 'Ontario');
INSERT INTO code_postal VALUES ('L0R2H0', 'Dundas', 'Ontario');
INSERT INTO code_postal VALUES ('L0S1B0', 'Crystal Beach', 'Ontario');
INSERT INTO code_postal VALUES ('M6S3A8', 'Toronto', 'Ontario');
INSERT INTO code_postal VALUES ('M6S4M5', 'York', 'Ontario');
INSERT INTO code_postal VALUES ('M8V3E8', 'Etobicoke', 'Ontario');
INSERT INTO code_postal VALUES ('M9L2W5', 'North York', 'Ontario');
INSERT INTO code_postal VALUES ('N0E3N0', 'Windham', 'Ontario');
INSERT INTO code_postal VALUES ('N0M1M4', 'Crediton', 'Ontario');
INSERT INTO code_postal VALUES ('N0M2M0', 'Beachville', 'Ontario');
INSERT INTO code_postal VALUES ('N1G4C2', 'Guelph', 'Ontario');
INSERT INTO code_postal VALUES ('N1R5S5', 'Cambridge', 'Ontario');
INSERT INTO code_postal VALUES ('N2M2V9', 'Kitchener', 'Ontario');
INSERT INTO code_postal VALUES ('N3P1J4', 'Brantford', 'Ontario');
INSERT INTO code_postal VALUES ('N3W2B2', 'Caledonia', 'Ontario');
INSERT INTO code_postal VALUES ('N5X1L3', 'London', 'Ontario');
INSERT INTO code_postal VALUES ('P0A1X0', 'South River', 'Ontario');
INSERT INTO code_postal VALUES ('R0H0H1', 'Portage La Prairie', 'Manitoba');
INSERT INTO code_postal VALUES ('S0C3K0', 'Midale', 'Saskatchewan');
INSERT INTO code_postal VALUES ('S4V3V9', 'Regina', 'Saskatchewan');
INSERT INTO code_postal VALUES ('T0A0A0', 'Abee', 'Alberta');
INSERT INTO code_postal VALUES ('T5P6B3', 'Edmonton', 'Alberta');
INSERT INTO code_postal VALUES ('T9J0J3', 'Fort Mcmurray', 'Alberta');
INSERT INTO code_postal VALUES ('V0H1Z0', 'Summerland', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V6N3E7', 'W Vancouver', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('B0W2C9', 'Argyle', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('E4E1F7', 'Parlee Brook', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('E4R2R1', 'Renouard Point', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('E5E2K7', 'Welshpool', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('J0T2J1', 'Saint-Donat', 'Qu??bec');
INSERT INTO code_postal VALUES ('L0B9B0', 'Nestleton Station', 'Ontario');
INSERT INTO code_postal VALUES ('L0K1E0', 'Orillia', 'Ontario');
INSERT INTO code_postal VALUES ('L0K4J9', 'Coldwater', 'Ontario');
INSERT INTO code_postal VALUES ('L4M4Y8', 'Oro', 'Ontario');
INSERT INTO code_postal VALUES ('N0L3H4', 'Iona Station', 'Ontario');
INSERT INTO code_postal VALUES ('P8N2W0', 'Kenora', 'Ontario');
INSERT INTO code_postal VALUES ('R0J1E6', 'Strathclair', 'Manitoba');
INSERT INTO code_postal VALUES ('R0L2P0', 'Minitonas', 'Manitoba');
INSERT INTO code_postal VALUES ('R0M2I0', 'Griswold', 'Manitoba');
INSERT INTO code_postal VALUES ('R7B2I2', 'Brandon', 'Manitoba');
INSERT INTO code_postal VALUES ('R9A3R2', 'The Pas', 'Manitoba');
INSERT INTO code_postal VALUES ('S0N2B1', 'Cypress Hills Park', 'Saskatchewan');
INSERT INTO code_postal VALUES ('S7K3R2', 'Saskatoon', 'Saskatchewan');
INSERT INTO code_postal VALUES ('S9A1B7', 'North Battleford', 'Saskatchewan');
INSERT INTO code_postal VALUES ('T1Y3R2', 'Calgary', 'Alberta');
INSERT INTO code_postal VALUES ('T7Y1R3', 'Stony Plain', 'Alberta');
INSERT INTO code_postal VALUES ('T8E2M0', 'Ardrossan', 'Alberta');
INSERT INTO code_postal VALUES ('T8N5B6', 'St Albert', 'Alberta');
INSERT INTO code_postal VALUES ('V1C3S7', 'Cranbrook', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V3W1S9', 'Surrey', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('V4B8H6', 'White Rock', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('B0N2X0', 'Mount Uniacke', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('B1T6J4', 'Christmas Island', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('B2J3H6', 'North Fourchu', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('B2S0B9', 'East Gore', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('B3G1C8', 'Eastern Passage', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('B4R0A2', 'Coldbrook', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('E1E0C7', 'Moncton', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('G8K2P8', 'Saint-F??licien', 'Qu??bec');
INSERT INTO code_postal VALUES ('H2B4B3', 'Sault-Au-R??collet', 'Qu??bec');
INSERT INTO code_postal VALUES ('K8A6W8', 'Pembroke', 'Ontario');
INSERT INTO code_postal VALUES ('L0C1G1', 'Uxbridge', 'Ontario');
INSERT INTO code_postal VALUES ('L0E1F0', 'Pefferlaw', 'Ontario');
INSERT INTO code_postal VALUES ('L0M2X0', 'Glencairn', 'Ontario');
INSERT INTO code_postal VALUES ('L1V0C2', 'Pickering', 'Ontario');
INSERT INTO code_postal VALUES ('M4J1X7', 'East York', 'Ontario');
INSERT INTO code_postal VALUES ('N0G2I2', 'Wroxeter', 'Ontario');
INSERT INTO code_postal VALUES ('N4B2C0', 'Delhi', 'Ontario');
INSERT INTO code_postal VALUES ('P0B2M0', 'Huntsville', 'Ontario');
INSERT INTO code_postal VALUES ('P0N1A6', 'Porcupine', 'Ontario');
INSERT INTO code_postal VALUES ('R2L1P7', 'Winnipeg', 'Manitoba');
INSERT INTO code_postal VALUES ('R4H0A9', 'Headingley', 'Manitoba');
INSERT INTO code_postal VALUES ('S0N2M0', 'Eastend', 'Saskatchewan');
INSERT INTO code_postal VALUES ('V8C0A1', 'Kitimat', 'Colombie-Britannique');
INSERT INTO code_postal VALUES ('B1G0B4', 'Dominion', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('B3L5S8', 'Halifax', 'Nouvelle-??cosse');
INSERT INTO code_postal VALUES ('E4A4A0', 'Chipman', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('E8B2P2', 'Val-D Amour', 'Nouveau-Brunswick');
INSERT INTO code_postal VALUES ('J0L1E2', 'Saint-Patrice-De-Sherrington', 'Qu??bec');


INSERT INTO personne VALUES (214757, 'G7B0A5', 'MENDOZA', '1970-06-12', 'Sciences de l education', '(450) 876-3889', 'Madison.MENDOZA2@umontreal.ca', 6481);
INSERT INTO prenoms VALUES (214757, 'Madison');
INSERT INTO prenoms VALUES (214757, 'Genesis');
INSERT INTO prenoms VALUES (214757, 'Evan');
INSERT INTO etudiant VALUES (214757, 'Orthodidactique des mathematiques', 107, 3.2);
INSERT INTO personne VALUES (3713691, 'J0P1R0', 'FOX', '1968-06-23', 'Ecole de sante publique', '(819) 843-7168', 'Evan.FOX3@umontreal.ca', 10798);
INSERT INTO prenoms VALUES (3713691, 'Evan');
INSERT INTO prenoms VALUES (3713691, 'Dominic');
INSERT INTO prenoms VALUES (3713691, 'Sean');
INSERT INTO prenoms VALUES (3713691, 'Trinity');
INSERT INTO etudiant VALUES (3713691, 'Epidemiologie', 30, 4.3);
INSERT INTO personne VALUES (7885636, 'J3V6E6', 'GOMEZ', '1974-11-12', 'Droit', '(450) 497-7259', 'Sofia.GOMEZ7@umontreal.ca', 7652);
INSERT INTO prenoms VALUES (7885636, 'Sofia');
INSERT INTO etudiant VALUES (7885636, 'Droit et travail', 75, 3.7);
INSERT INTO personne VALUES (93812687, 'G0A3W0', 'FRANKLIN', '2002-02-04', 'Medecine', '(514) 905-6311', 'Alexandra.FRANKLIN1@umontreal.ca', 5278);
INSERT INTO prenoms VALUES (93812687, 'Alexandra');
INSERT INTO etudiant VALUES (93812687, 'Sante mentale', 107, 3.5);
INSERT INTO personne VALUES (788460, 'G0X1S0', 'MCCOY', '1987-01-30', 'Arts et sciences', '(819) 770-4158', 'Amelia.MCCOY1@umontreal.ca', 8286);
INSERT INTO prenoms VALUES (788460, 'Amelia');
INSERT INTO etudiant VALUES (788460, 'Geographie environnementale', 65, 2.6);
INSERT INTO personne VALUES (6267377, 'J9T1A1', 'MOORE', '1974-03-01', 'Arts et sciences', '(514) 469-1525', 'Jeremiah.MOORE1@umontreal.ca', 204);
INSERT INTO prenoms VALUES (6267377, 'Jeremiah');
INSERT INTO etudiant VALUES (6267377, 'Cinema', 89, 3.9);
INSERT INTO personne VALUES (453458, 'J0B3E3', 'MILLS', '1973-11-01', 'Arts et sciences', '(438) 448-2338', 'Jaden.MILLS7@umontreal.ca', 3229);
INSERT INTO prenoms VALUES (453458, 'Jaden');
INSERT INTO etudiant VALUES (453458, 'Archeologie classique', 41, 4.2);
INSERT INTO personne VALUES (37833842, 'G0C1W0', 'DIAZ', '1967-04-18', 'Arts et sciences', '(514) 473-5589', 'Thomas.DIAZ5@umontreal.ca', 7207);
INSERT INTO prenoms VALUES (37833842, 'Thomas');
INSERT INTO prenoms VALUES (37833842, 'Claire');
INSERT INTO prenoms VALUES (37833842, 'Alexa');
INSERT INTO etudiant VALUES (37833842, 'Etudes allemandes et Histoire', 59, 4.3);
INSERT INTO personne VALUES (995261, 'J0B1S0', 'MEDINA', '1991-05-31', 'Medecine', '(450) 713-4103', 'Liam.MEDINA8@umontreal.ca', 2068);
INSERT INTO prenoms VALUES (995261, 'Liam');
INSERT INTO etudiant VALUES (995261, 'Physiologie', 51, 4.2);
INSERT INTO personne VALUES (4775605, 'J0R1V0', 'PAYNE', '1979-07-22', 'Medecine dentaire', '(514) 643-3686', 'Jeremiah.PAYNE2@umontreal.ca', 7808);
INSERT INTO prenoms VALUES (4775605, 'Jeremiah');
INSERT INTO etudiant VALUES (4775605, 'Medecine dentaire - Sciences buccodentaires', 109, 3.4);
INSERT INTO personne VALUES (4385874, 'R2L1P7', 'SHELTON', '1988-07-08', 'Arts et sciences', '(450) 535-9285', 'Madeline.SHELTON8@umontreal.ca', 6513);
INSERT INTO prenoms VALUES (4385874, 'Madeline');
INSERT INTO etudiant VALUES (4385874, 'Etudes hispaniques', 65, 4.0);
INSERT INTO personne VALUES (9263942, 'H7H2W7', 'CHANDLER', '1988-12-17', 'Arts et sciences', '(514) 875-3806', 'Henry.CHANDLER1@umontreal.ca', 827);
INSERT INTO prenoms VALUES (9263942, 'Henry');
INSERT INTO etudiant VALUES (9263942, 'Geomatique et cartographie dynamique', 64, 3.1);
INSERT INTO personne VALUES (41416448, 'G0N1M0', 'CARPENTER', '1992-05-18', 'Sciences de l education', '(450) 832-5150', 'Rachel.CARPENTER4@umontreal.ca', 12044);
INSERT INTO prenoms VALUES (41416448, 'Rachel');
INSERT INTO etudiant VALUES (41416448, 'Pedagogie universitaire des sciences medicales', 74, 3.2);
INSERT INTO personne VALUES (7985864, 'G0S3H0', 'BLAIR', '1988-08-26', 'Medecine', '(438) 694-4945', 'Ella.BLAIR2@umontreal.ca', 9134);
INSERT INTO prenoms VALUES (7985864, 'Ella');
INSERT INTO etudiant VALUES (7985864, 'Pathologie et biologie cellulaire', 77, 4.3);
INSERT INTO personne VALUES (480820, 'J0M1P0', 'TRAN', '1983-03-26', 'Sciences de l education', '(450) 591-5677', 'Jocelyn.TRAN8@umontreal.ca', 61);
INSERT INTO prenoms VALUES (480820, 'Jocelyn');
INSERT INTO etudiant VALUES (480820, 'Enseignement de l ethique et de la culture religieuse au second', 73, 3.7);
INSERT INTO personne VALUES (1055183, 'J0Y1W0', 'CARLSON', '1974-02-04', 'Arts et sciences', '(450) 742-5764', 'Taylor.CARLSON1@umontreal.ca', 8148);
INSERT INTO prenoms VALUES (1055183, 'Taylor');
INSERT INTO etudiant VALUES (1055183, 'Litterature', 64, 4.0);
INSERT INTO personne VALUES (8785998, 'J8L0A1', 'SCHNEIDER', '1994-12-02', 'Arts et sciences', '(450) 511-2656', 'Cameron.SCHNEIDER9@umontreal.ca', 7443);
INSERT INTO prenoms VALUES (8785998, 'Cameron');
INSERT INTO etudiant VALUES (8785998, 'Etudes autochtones', 51, 2.9);
INSERT INTO personne VALUES (8760673, 'J6Z1G0', 'PORTER', '1981-05-21', 'Arts et sciences', '(438) 545-5916', 'Brandon.PORTER3@umontreal.ca', 442);
INSERT INTO prenoms VALUES (8760673, 'Brandon');
INSERT INTO etudiant VALUES (8760673, 'Litterature comparee', 56, 2.6);
INSERT INTO personne VALUES (15708823, 'G8N4C5', 'VARGAS', '1984-10-08', 'Arts et sciences', '(819) 539-7648', 'Jackson.VARGAS3@umontreal.ca', 8233);
INSERT INTO prenoms VALUES (15708823, 'Jackson');
INSERT INTO prenoms VALUES (15708823, 'Isaac');
INSERT INTO prenoms VALUES (15708823, 'Gianna');
INSERT INTO prenoms VALUES (15708823, 'Emma');
INSERT INTO etudiant VALUES (15708823, 'Action communautaire', 37, 3.3);
INSERT INTO personne VALUES (64170043, 'G0E1C0', 'BENNETT', '1983-09-13', 'Medecine', '(438) 357-6773', 'Josiah.BENNETT8@umontreal.ca', 4770);
INSERT INTO prenoms VALUES (64170043, 'Josiah');
INSERT INTO etudiant VALUES (64170043, 'Pathologie moleculaire et medecine personnalisee', 30, 2.8);
INSERT INTO personne VALUES (86867902, 'J0E2N0', 'SPENCER', '1980-02-12', 'Amenagement', '(438) 804-5398', 'Madison.SPENCER2@umontreal.ca', 8256);
INSERT INTO prenoms VALUES (86867902, 'Madison');
INSERT INTO etudiant VALUES (86867902, 'Etudes individualisees ??? M.Sc.A.', 61, 3.8);
INSERT INTO personne VALUES (982080, 'G5L3J9', 'WASHINGTON', '1971-02-08', 'Arts et sciences', '(438) 598-8246', 'Jacob.WASHINGTON8@umontreal.ca', 1249);
INSERT INTO prenoms VALUES (982080, 'Jacob');
INSERT INTO etudiant VALUES (982080, 'Communication organisationnelle', 61, 3.7);
INSERT INTO personne VALUES (27766416, 'G0J1A0', 'WELCH', '1974-12-20', 'Medecine', '(514) 604-3161', 'Ariana.WELCH2@umontreal.ca', 6240);
INSERT INTO prenoms VALUES (27766416, 'Ariana');
INSERT INTO etudiant VALUES (27766416, 'Kinesiologie - Sciences de l activite physique', 114, 3.7);
INSERT INTO personne VALUES (9155424, 'J2A1A0', 'WELLS', '2001-01-20', 'Medecine', '(438) 775-0014', 'Jason.WELLS8@umontreal.ca', 3208);
INSERT INTO prenoms VALUES (9155424, 'Jason');
INSERT INTO etudiant VALUES (9155424, 'Physiotherapie - Reeducation perineale et pelvienne', 104, 2.6);
INSERT INTO personne VALUES (648654, 'G0S3H0', 'GARCIA', '1996-02-23', 'Arts et sciences', '(514) 549-8631', 'Mia.GARCIA4@umontreal.ca', 1586);
INSERT INTO prenoms VALUES (648654, 'Mia');
INSERT INTO etudiant VALUES (648654, 'Linguistique et Psychologie', 59, 2.7);
INSERT INTO personne VALUES (21586972, 'H9P1H9', 'ROBERTS', '1972-06-08', 'Sciences de l education', '(819) 819-2407', 'Bailey.ROBERTS3@umontreal.ca', 3067);
INSERT INTO prenoms VALUES (21586972, 'Bailey');
INSERT INTO etudiant VALUES (21586972, 'Administration de l education (D.Ed.)', 82, 4.0);
INSERT INTO personne VALUES (739758, 'J0B1G0', 'PETERS', '1981-04-14', 'Sciences de l education', '(819) 637-6289', 'Genesis.PETERS8@umontreal.ca', 12086);
INSERT INTO prenoms VALUES (739758, 'Genesis');
INSERT INTO etudiant VALUES (739758, 'Administration des systemes d education et de formation', 94, 3.3);
INSERT INTO personne VALUES (901542, 'G0X3E0', 'JOHNSTON', '1966-08-06', 'Arts et sciences', '(438) 543-7932', 'Grace.JOHNSTON4@umontreal.ca', 1167);
INSERT INTO prenoms VALUES (901542, 'Grace');
INSERT INTO etudiant VALUES (901542, 'Securite interieure', 75, 3.6);
INSERT INTO personne VALUES (4847119, 'G6K0A1', 'REYNOLDS', '1990-02-10', 'Medecine', '(438) 829-6905', 'Sarah.REYNOLDS2@umontreal.ca', 1889);
INSERT INTO prenoms VALUES (4847119, 'Sarah');
INSERT INTO prenoms VALUES (4847119, 'Caden');
INSERT INTO prenoms VALUES (4847119, 'Mariah');
INSERT INTO prenoms VALUES (4847119, 'Justin');
INSERT INTO etudiant VALUES (4847119, 'Sante mentale', 80, 3.8);
INSERT INTO personne VALUES (172756, 'J0L2X0', 'FITZGERALD', '1995-12-14', 'Arts et sciences', '(514) 450-7943', 'Aaliyah.FITZGERALD3@umontreal.ca', 10120);
INSERT INTO prenoms VALUES (172756, 'Aaliyah');
INSERT INTO prenoms VALUES (172756, 'Andrea');
INSERT INTO prenoms VALUES (172756, 'Kylie');
INSERT INTO etudiant VALUES (172756, 'Traduction', 120, 4.1);
INSERT INTO personne VALUES (57267374, 'J0R1V0', 'HIGGINS', '1984-12-22', 'Arts et sciences', '(438) 730-6120', 'Kaden.HIGGINS6@umontreal.ca', 4481);
INSERT INTO prenoms VALUES (57267374, 'Kaden');
INSERT INTO etudiant VALUES (57267374, 'Statistique', 115, 4.0);
INSERT INTO personne VALUES (7519505, 'H3Z2V4', 'MITCHELL', '1972-05-19', 'Ecole de sante publique', '(819) 664-5994', 'Jackson.MITCHELL8@umontreal.ca', 10901);
INSERT INTO prenoms VALUES (7519505, 'Jackson');
INSERT INTO prenoms VALUES (7519505, 'Nevaeh');
INSERT INTO etudiant VALUES (7519505, 'Bioethique', 113, 2.7);
INSERT INTO personne VALUES (3199042, 'J2B6X3', 'MILLER', '1994-10-05', 'Sciences de l education', '(450) 960-2507', 'Brayden.MILLER6@umontreal.ca', 1159);
INSERT INTO prenoms VALUES (3199042, 'Brayden');
INSERT INTO etudiant VALUES (3199042, 'Education prescolaire et enseignement primaire - Campus Laval', 43, 2.7);
INSERT INTO personne VALUES (696100, 'J0G1G0', 'COLLINS', '1989-08-23', 'Arts et sciences', '(819) 717-4957', 'Henry.COLLINS3@umontreal.ca', 2948);
INSERT INTO prenoms VALUES (696100, 'Henry');
INSERT INTO etudiant VALUES (696100, 'Psychologie - recherche et intervention - option Psychologie du', 91, 3.9);
INSERT INTO personne VALUES (3747669, 'G0J1N0', 'REYNOLDS', '1986-05-21', 'Medecine', '(450) 948-9199', 'Jonathan.REYNOLDS9@umontreal.ca', 10726);
INSERT INTO prenoms VALUES (3747669, 'Jonathan');
INSERT INTO etudiant VALUES (3747669, 'Sciences neurologiques', 55, 2.7);
INSERT INTO personne VALUES (99105013, 'J0P1L0', 'WARNER', '1988-04-26', 'Arts et sciences', '(438) 596-4819', 'Jordan.WARNER7@umontreal.ca', 11203);
INSERT INTO prenoms VALUES (99105013, 'Jordan');
INSERT INTO etudiant VALUES (99105013, 'Analyses environnementales et industrielles', 57, 2.9);
INSERT INTO personne VALUES (7422834, 'G2E1K9', 'CURTIS', '1969-06-08', 'Ecole de sante publique', '(514) 624-1822', 'Hannah.CURTIS4@umontreal.ca', 1649);
INSERT INTO prenoms VALUES (7422834, 'Hannah');
INSERT INTO etudiant VALUES (7422834, 'Administration des services de sante, option administration soc', 106, 3.6);
INSERT INTO personne VALUES (738210, 'J6N3C1', 'SANDERS', '1976-08-24', 'Arts et sciences', '(514) 857-1560', 'Grace.SANDERS6@umontreal.ca', 1646);
INSERT INTO prenoms VALUES (738210, 'Grace');
INSERT INTO etudiant VALUES (738210, 'Communication organisationnelle', 118, 3.2);
INSERT INTO personne VALUES (5221922, 'J0H1J0', 'THOMPSON', '1978-03-28', 'Ecole de sante publique', '(450) 514-6615', 'Ariana.THOMPSON5@umontreal.ca', 2351);
INSERT INTO prenoms VALUES (5221922, 'Ariana');
INSERT INTO etudiant VALUES (5221922, 'Administration des services de sante', 85, 4.0);
INSERT INTO personne VALUES (3614956, 'J2B6X3', 'WARREN', '1974-01-19', 'Ecole de sante publique', '(438) 387-3929', 'Jocelyn.WARREN8@umontreal.ca', 4344);
INSERT INTO prenoms VALUES (3614956, 'Jocelyn');
INSERT INTO etudiant VALUES (3614956, 'Analyse et evaluation des interventions en sante', 97, 3.7);
INSERT INTO personne VALUES (59959463, 'G0G2Y0', 'JIMENEZ', '1965-06-03', 'Sciences de l education', '(819) 917-0613', 'Addison.JIMENEZ7@umontreal.ca', 12020);
INSERT INTO prenoms VALUES (59959463, 'Addison');
INSERT INTO etudiant VALUES (59959463, 'Enseignement de l univers social au secondaire', 56, 3.9);
INSERT INTO personne VALUES (7554953, 'H9C2C2', 'SHARP', '1995-04-19', 'Arts et sciences', '(450) 928-0173', 'Luke.SHARP3@umontreal.ca', 4451);
INSERT INTO prenoms VALUES (7554953, 'Luke');
INSERT INTO etudiant VALUES (7554953, 'Chimie', 94, 4.0);
INSERT INTO personne VALUES (64890502, 'J0P1R0', 'BECK', '1965-06-17', 'Arts et sciences', '(450) 475-5848', 'Chloe.BECK1@umontreal.ca', 8724);
INSERT INTO prenoms VALUES (64890502, 'Chloe');
INSERT INTO etudiant VALUES (64890502, 'Litteratures de langue fran??aise et Linguistique', 95, 2.7);
INSERT INTO personne VALUES (285003, 'G0E1X0', 'BECK', '1990-04-02', 'Sciences de l education', '(450) 589-9524', 'Justin.BECK3@umontreal.ca', 9735);
INSERT INTO prenoms VALUES (285003, 'Justin');
INSERT INTO prenoms VALUES (285003, 'Isabelle');
INSERT INTO prenoms VALUES (285003, 'Alexander');
INSERT INTO prenoms VALUES (285003, 'Joshua');
INSERT INTO etudiant VALUES (285003, 'Enseignement en adaptation scolaire - Campus Laval', 79, 2.9);
INSERT INTO personne VALUES (793543, 'J0X2M0', 'RUIZ', '1994-11-30', 'Arts et sciences', '(514) 470-1777', 'Ashley.RUIZ9@umontreal.ca', 401);
INSERT INTO prenoms VALUES (793543, 'Ashley');
INSERT INTO etudiant VALUES (793543, 'Communication et Politique', 102, 3.8);
INSERT INTO personne VALUES (7032692, 'J0B2R0', 'PHILLIPS', '1986-05-05', 'Arts et sciences', '(514) 493-8732', 'Brady.PHILLIPS1@umontreal.ca', 2136);
INSERT INTO prenoms VALUES (7032692, 'Brady');
INSERT INTO etudiant VALUES (7032692, 'Litterature', 41, 3.4);
INSERT INTO personne VALUES (32452731, 'G7N0A1', 'COOPER', '1970-04-20', 'Medecine', '(450) 363-6421', 'Andrea.COOPER7@umontreal.ca', 5091);
INSERT INTO prenoms VALUES (32452731, 'Andrea');
INSERT INTO etudiant VALUES (32452731, 'Physiologie', 47, 2.7);
INSERT INTO personne VALUES (8634316, 'H7H2S4', 'BISHOP', '1981-04-07', 'Arts et sciences', '(450) 944-0613', 'Tyler.BISHOP4@umontreal.ca', 11606);
INSERT INTO prenoms VALUES (8634316, 'Tyler');
INSERT INTO etudiant VALUES (8634316, 'Travail social - Campus Montreal', 81, 3.6);
INSERT INTO personne VALUES (576760, 'J2W0A0', 'CUNNINGHAM', '1987-04-12', 'Arts et sciences', '(819) 573-2842', 'Jack.CUNNINGHAM3@umontreal.ca', 9113);
INSERT INTO prenoms VALUES (576760, 'Jack');
INSERT INTO prenoms VALUES (576760, 'James');
INSERT INTO prenoms VALUES (576760, 'Alexa');
INSERT INTO prenoms VALUES (576760, 'Madelyn');
INSERT INTO etudiant VALUES (576760, 'Geomatique et analyse spatiale', 58, 3.6);
INSERT INTO personne VALUES (42929910, 'G0A2M0', 'HOLMES', '1984-01-16', 'Sciences de l education', '(819) 895-1856', 'Kayla.HOLMES1@umontreal.ca', 8077);
INSERT INTO prenoms VALUES (42929910, 'Kayla');
INSERT INTO etudiant VALUES (42929910, 'Andragogie', 67, 3.9);




INSERT INTO personne VALUES (4767982, 'G0M1E0', 'KELLER', '1987-03-13', 'Medecine', '(819) 418-0843', 'Landon.KELLER8@umontreal.ca', 6554);
INSERT INTO prenoms VALUES (4767982, 'Landon');
INSERT INTO professeur VALUES (4767982, 'Pathologie et biologie cellul.');
INSERT INTO personne VALUES (2233107, 'G5R0A1', 'PADILLA', '1972-09-30', 'Sciences de l education', '(819) 608-0513', 'Madelyn.PADILLA5@umontreal.ca', 9579);
INSERT INTO prenoms VALUES (2233107, 'Madelyn');
INSERT INTO professeur VALUES (2233107, 'Psychopedagogie et andragogie');
INSERT INTO personne VALUES (2901329, 'G6G0A1', 'NELSON', '1994-09-02', 'Arts et sciences', '(819) 413-0426', 'Morgan.NELSON7@umontreal.ca', 4389);
INSERT INTO prenoms VALUES (2901329, 'Morgan');
INSERT INTO professeur VALUES (2901329, 'Litteratures/langues du monde');
INSERT INTO personne VALUES (20233809, 'J6J2A8', 'VAUGHN', '1969-04-10', 'Arts et sciences', '(450) 642-2339', 'Brayden.VAUGHN1@umontreal.ca', 2218);
INSERT INTO prenoms VALUES (20233809, 'Brayden');
INSERT INTO professeur VALUES (20233809, 'Litterature comparee,Philosophie');
INSERT INTO personne VALUES (168372, 'H1M3H7', 'MALDONADO', '1993-01-06', 'Sciences de l education', '(514) 958-6120', 'Audrey.MALDONADO9@umontreal.ca', 6216);
INSERT INTO prenoms VALUES (168372, 'Audrey');
INSERT INTO professeur VALUES (168372, 'Formation initiale des maitres');
INSERT INTO personne VALUES (41019719, 'G0W1Z0', 'DANIEL', '1972-05-07', 'Sciences de l education', '(450) 846-0536', 'Thomas.DANIEL8@umontreal.ca', 10514);
INSERT INTO prenoms VALUES (41019719, 'Thomas');
INSERT INTO professeur VALUES (41019719, 'Formation initiale des maitres');
INSERT INTO personne VALUES (35156102, 'G0L2M0', 'FLEMING', '2000-08-30', 'Arts et sciences', '(514) 498-8541', 'Liam.FLEMING2@umontreal.ca', 8295);
INSERT INTO prenoms VALUES (35156102, 'Liam');
INSERT INTO professeur VALUES (35156102, 'Litteratures lang. fran??aise');
INSERT INTO personne VALUES (36040903, 'H9X1P3', 'CARR', '1989-08-13', 'Medecine', '(438) 572-5763', 'Lily.CARR7@umontreal.ca', 1329);
INSERT INTO prenoms VALUES (36040903, 'Lily');
INSERT INTO professeur VALUES (36040903, 'Microbio. infectio. et immuno.');
INSERT INTO personne VALUES (617060, 'G0J3H0', 'PALMER', '2001-09-28', 'Arts et sciences', '(819) 432-4595', 'Eric.PALMER2@umontreal.ca', 9699);
INSERT INTO prenoms VALUES (617060, 'Eric');
INSERT INTO prenoms VALUES (617060, 'Evelyn');
INSERT INTO prenoms VALUES (617060, 'Colton');
INSERT INTO prenoms VALUES (617060, 'Abigail');
INSERT INTO professeur VALUES (617060, 'Mathematiques et statistique,Physique');
INSERT INTO personne VALUES (378852, 'G0C1Y0', 'GARNER', '1994-03-23', 'Arts et sciences', '(514) 607-9719', 'Zoey.GARNER3@umontreal.ca', 6274);
INSERT INTO prenoms VALUES (378852, 'Zoey');
INSERT INTO professeur VALUES (378852, 'Psychologie');


INSERT INTO entreprise VALUES (833506, 'Hydro-Qu??bec', 'hydro-quebec@communications.hydro.qc.ca', '(514)385-7252', True, '??nergie');
INSERT INTO adresses VALUES (833506, 'H1B5K8', 75, 'boulevard Ren??-L??vesque Ouest');
INSERT INTO entreprise VALUES (146970, 'Desjardins', 'contactdesjardins@desjardins.com', '(514)281-7101', True, 'Financier');
INSERT INTO adresses VALUES (146970, 'H1C0B2', 5, 'Rue Complexe Desjardins Bureau 226');
INSERT INTO entreprise VALUES (460554, 'Desjardins', 'contactdesjardins2@desjardins.com', '(418)833-5515', True, 'Financier');
INSERT INTO adresses VALUES (460554, 'G6V0M5', 995, 'boulevard Alphonse-Desjardins');
INSERT INTO entreprise VALUES (586929, 'Loto-Qu??bec', 'jeuxenligne@lotoquebec.com', '(866)611-5686', True, 'Jeux et loteries');
INSERT INTO adresses VALUES (586929, 'H1E1A7', 500, 'rue Sherbrooke Ouest');
INSERT INTO entreprise VALUES (483632, 'Mat??rio', 'emplois@materio.ca', '(450)438-9780', True, 'Mat??riel de construction');
INSERT INTO adresses VALUES (483632, 'J5L0A1', 2159, 'boulevard Cur??-Labelle');
INSERT INTO entreprise VALUES (120090, 'Poulet en Folie', 'pouletpoulet@poulet.qc.ca', '(438)444-1919', True, 'D??licieux poulet');
INSERT INTO adresses VALUES (120090, 'B3L5S8', 2020, 'rue du Finfin');
INSERT INTO entreprise VALUES (3578325, 'Aperture Science', 'dontbeshell@aperture.evil', '(514)555-5555', True, 'Science Exp??rimentale');
INSERT INTO adresses VALUES (3578325, 'B1G0B4', 666, 'Avenue GLaDOS');
INSERT INTO entreprise VALUES (933852, 'Big Metal Fan', 'pushit@toelev.en', '(819)832-1234', True, 'Acierie et musique');
INSERT INTO adresses VALUES (933852, 'G0Y1H0', 420, 'rang Enfum??');
INSERT INTO entreprise VALUES (99261207, 'Pas la Mafia', 'nousommes@legit.ok', '(666)123-0987', True, 'Do not ask');
INSERT INTO adresses VALUES (99261207, 'T0B4N1', 111, 'boulevard Sanglant');
INSERT INTO entreprise VALUES (5222182, 'Twiggs', 'sax@trompette.fwiiit', '(514)802-6969', True, 'Fabriquant instruments ?? vent');
INSERT INTO adresses VALUES (5222182, 'H2T3E2', 42, 'Place Gillespie');
INSERT INTO entreprise VALUES (2720226, 'Vric ?? Vrac', 'noixdegrenobles@vrac.com', '(450)889-2776', True, 'Alimentation');
INSERT INTO adresses VALUES (2720226, 'J0P1Y', 10092, 'Rang Profond');

INSERT INTO stage_1 values (120090, 6267377, 4767982, 'D??veloppeur full stack', '2021-06-02', '2021-09-03', 37.5);
INSERT INTO stage_2 values ('D??veloppeur full stack', 18.5);

INSERT INTO stage_1 values (460554, 15708823, 168372, 'Assassin de fraudeurs', '2019-01-12', '2019-01-13', 37.5);
INSERT INTO stage_2 values ('Assassin de fraudeurs', 128.5);

INSERT INTO stage_1 values (933852, 901542, 4767982, 'Guitariste en salle d op??ration', '2021-02-09', '2021-10-30', 18);
INSERT INTO stage_2 values ('Guitariste en salle d op??ration', 27.25);

INSERT INTO stage_1 values (933852, 901542, 4767982, 'Bassiste en profondeur', '2019-12-12', '2020-04-17', 22);
INSERT INTO stage_2 values ('Bassiste en profondeur', 32);

INSERT INTO stage_1 values (3578325, 42929910, 378852, 'Testeur de portails', '2002-01-27', '2222-01-27', 99);
INSERT INTO stage_2 values ('Testeur de portails', 0.01);

INSERT INTO stage_1 values (586929, 8785998, 41019719, 'Nettoyeur de boules 6/49', '2021-05-12', '2021-08-31', 12.25);
INSERT INTO stage_2 values ('Nettoyeur de boules 6/49', 18.5);

INSERT INTO stage_1 values (2720226, 99105013, 4767982, 'D??corticeur de noix de grenobles', '2018-11-04', '2019-04-17', 35);
INSERT INTO stage_2 values ('D??corticeur de noix de grenobles', 12);

INSERT INTO stage_1 values (99261207, 738210, 2233107, 'D??finitivement pas un nettoyeur de monnaie sale', '2021-03-21', '2021-09-13', 51.2);
INSERT INTO stage_2 values ('D??finitivement pas un nettoyeur de monnaie sale', 175);

INSERT INTO stage_1 values (833506, 172756, 2233107, 'Agent au lichage de batteries 9V', '2021-03-10', '2021-07-11', 24.5);
INSERT INTO stage_2 values ('Agent au lichage de batteries 9V', 42.15);

INSERT INTO stage_1 values (833506, 3199042, 4767982, 'Recocombulateur de lignes diaz??phanicothriptyches', '2021-09-01', '2022-04-28', 32);
INSERT INTO stage_2 values ('Recocombulateur de lignes diaz??phanicothriptyches', 55);

INSERT INTO stage_1 values (146970, 32452731, 36040903, 'Biochimiste en r??cup??ration de cartes bancaires', '1997-01-01', '2002-05-17', 3);
INSERT INTO stage_2 values ('Biochimiste en r??cup??ration de cartes bancaires', 17.25);

INSERT INTO stage_1 values (5222182, 788460, 2901329, 'Gosseur d anches doubles, sp??cialisation roseau', '2021-01-12', '2021-07-18', 29.75);
INSERT INTO stage_2 values ('Gosseur d anches doubles, sp??cialisation roseau', 33.3);


INSERT INTO personne VALUES (6084654, 'J0M1L0', 'CARR', '1967-05-28', 'Arts et sciences', '(438) 569-8987', 'Nathan.CARR7@umontreal.ca', 307);
INSERT INTO prenoms VALUES (6084654, 'Nathan');
INSERT INTO etudiant VALUES (6084654, 'Securite interieure', 75, 3.7);
INSERT INTO personne VALUES (6986300, 'J0V1T0', 'MURPHY', '1999-03-18', 'Arts et sciences', '(450) 738-2976', 'Andrew.MURPHY4@umontreal.ca', 8789);
INSERT INTO prenoms VALUES (6986300, 'Andrew');
INSERT INTO prenoms VALUES (6986300, 'Alexandra');
INSERT INTO etudiant VALUES (6986300, 'Securite interieure', 96, 4.3);

INSERT INTO personne VALUES (549168, 'J0L2X0', 'FLETCHER', '1967-06-20', 'Arts et sciences', '(450) 566-8813', 'Josiah.FLETCHER9@umontreal.ca', 5753);
INSERT INTO prenoms VALUES (549168, 'Josiah');
INSERT INTO etudiant VALUES (549168, 'Securite interieure', 46, 3.7);
INSERT INTO personne VALUES (695408, 'J0C1S0', 'PAGE', '1989-04-23', 'Arts et sciences', '(514) 699-8849', 'Hailey.PAGE8@umontreal.ca', 8455);
INSERT INTO prenoms VALUES (695408, 'Hailey');
INSERT INTO etudiant VALUES (695408, 'Securite interieure', 108, 2.8);
INSERT INTO personne VALUES (53409029, 'G0J1E0', 'DEAN', '1973-11-02', 'Arts et sciences', '(819) 422-0234', 'Charles.DEAN5@umontreal.ca', 5125);
INSERT INTO prenoms VALUES (53409029, 'Charles');
INSERT INTO etudiant VALUES (53409029, 'Securite interieure', 47, 3.9);
INSERT INTO personne VALUES (1822074, 'M4J1X7', 'WARD', '1986-01-12', 'Arts et sciences', '(450) 668-0266', 'Jason.WARD1@umontreal.ca', 12608);
INSERT INTO prenoms VALUES (1822074, 'Jason');
INSERT INTO etudiant VALUES (1822074, 'Securite interieure', 79, 3.2);
INSERT INTO personne VALUES (767357, 'J0B1T0', 'ZIMMERMAN', '1992-05-01', 'Arts et sciences', '(438) 398-1450', 'Alexis.ZIMMERMAN8@umontreal.ca', 12737);
INSERT INTO prenoms VALUES (767357, 'Alexis');
INSERT INTO etudiant VALUES (767357, 'Securite interieure', 59, 3.3);
INSERT INTO personne VALUES (505395, 'J0L1E2', 'BALL', '2000-06-26', 'Arts et sciences', '(819) 872-7595', 'Natalie.BALL3@umontreal.ca', 8627);
INSERT INTO prenoms VALUES (505395, 'Natalie');
INSERT INTO etudiant VALUES (505395, 'Securite interieure', 104, 2.7);
INSERT INTO personne VALUES (99731075, 'G0G2T0', 'FREEMAN', '1973-09-27', 'Arts et sciences', '(438) 581-4048', 'Sarah.FREEMAN9@umontreal.ca', 2871);
INSERT INTO prenoms VALUES (99731075, 'Sarah');
INSERT INTO etudiant VALUES (99731075, 'Securite interieure', 45, 2.8);
INSERT INTO personne VALUES (7517725, 'J5W4Z4', 'PAUL', '1994-08-25', 'Arts et sciences', '(819) 644-6077', 'Tyler.PAUL3@umontreal.ca', 10152);
INSERT INTO prenoms VALUES (7517725, 'Tyler');
INSERT INTO etudiant VALUES (7517725, 'Securite interieure', 57, 3.5);

INSERT INTO stage_1 values (5222182, 6084654, 4767982, 'Surveillant sp??cialis?? en singes', '2021-06-02', '2021-09-03', 37.5);
INSERT INTO stage_2 values ('Surveillant sp??cialis?? en singes', 18.5);

INSERT INTO stage_1 values (5222182, 6986300, 168372, 'Bloqueur d all??es', '2021-01-12', '2021-06-13', 37.5);
INSERT INTO stage_2 values ('Bloqueur d all??es', 128.5);

INSERT INTO stage_1 values (146970, 549168, 4767982, 'Faux-fr??re senior', '2021-02-09', '2021-10-30', 18);
INSERT INTO stage_2 values ('Faux-fr??re senior', 27.25);

INSERT INTO stage_1 values (146970, 695408, 4767982, 'Empecheur de tourner en rond', '2021-12-12', '2022-04-17', 22);
INSERT INTO stage_2 values ('Empecheur de tourner en rond', 32);

INSERT INTO stage_1 values (586929, 1822074, 378852, 'Oie', '2021-01-27', '2022-01-27', 99);
INSERT INTO stage_2 values ('Oie', 0.01);

INSERT INTO stage_1 values (586929, 767357, 41019719, 'Trappeur de moufette', '2021-05-12', '2021-08-31', 12.25);
INSERT INTO stage_2 values ('Trappeur de moufette', 18.5);




INSERT INTO visites values (5222182, 788460, '2021-01-12', '2021-07-18', '2021-02-02');
INSERT INTO visites values (5222182, 788460, '2021-01-12', '2021-07-18', '2021-03-05');
INSERT INTO visites values (5222182, 788460, '2021-01-12', '2021-07-18', '2021-06-18');

INSERT INTO visites values (99261207, 738210, '2021-03-10', '2021-07-11', '2021-03-12');
INSERT INTO visites values (99261207, 738210, '2021-03-10', '2021-07-11', '2021-05-15');

INSERT INTO visites values (833506, 3199042, '2021-09-01', '2022-04-28', '2021-10-12');
INSERT INTO visites values (833506, 3199042, '2021-09-01', '2022-04-28', '2022-02-24');

INSERT INTO visites values (833506, 172756, '2021-03-10', '2021-07-11', '2021-03-17');
INSERT INTO visites values (833506, 172756, '2021-03-10', '2021-07-11', '2021-06-29');

INSERT INTO visites values (2720226, 99105013, '2018-11-04', '2019-04-17', '2019-03-17');
INSERT INTO visites values (2720226, 99105013, '2018-11-04', '2019-04-17', '2018-12-14');

INSERT INTO visites values (3578325, 42929910, '2002-01-27', '2222-01-27', '2121-03-17');

INSERT INTO visites values (120090, 6267377, '2021-06-02', '2021-09-03', '2021-07-17');
INSERT INTO visites values (120090, 6267377, '2021-06-02', '2021-09-03', '2021-08-09');

INSERT INTO visites values (146970, 32452731, '1997-01-01', '2002-05-17', '1997-01-01');
INSERT INTO visites values (146970, 32452731, '1997-01-01', '2002-05-17', '1999-12-31');

commit;
