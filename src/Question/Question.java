package Question;

public class Question {
    public static String query1 = "\twith count_prenoms as (select matricule, count(prenom) as nb_prenoms from\n" +
            "    \tprenoms group by matricule),\n" +
            "\tprenoms_gte_2 as (select matricule from count_prenoms where\n" +
            "    \tnb_prenoms >= 2),\n" +
            "\tmat_performants as (select matricule from etudiant where\n" +
            "    \tcredits_completes >= 30 and gpa >= 3.7)\n" +
            "\tselect * from prenoms_gte_2 natural join mat_performants;\n";
    public static String query2 = "with curr_stages as (select matricule_professeur, matricule_etudiant,\n" +
            "    \tid_entreprise from stage_1 where date_debut > '2021-01-01'),\n" +
            "\tstudents_entreprises_gte_2 as (select matricule_professeur,\n" +
            "    \tcount(matricule_etudiant) as nb_students,\n" +
            "    \tcount(id_entreprise) as nb_entreprises\n" +
            "    \tfrom curr_stages group by matricule_professeur),\n" +
            "\tbusy_profs as (select matricule_professeur\n" +
            "    \tfrom students_entreprises_gte_2),\n" +
            "\tbusy_profs_discipline as (select matricule, discipline from\n" +
            "    \tbusy_profs join professeur\n" +
            "    \ton busy_profs.matricule_professeur = professeur.matricule),\n" +
            "\tbusy_profs_faculte as (select matricule, faculte from\n" +
            "    \tbusy_profs_discipline natural join programmes_departements),\n" +
            "\tinfos as (select nom_personne, courriel_personne, matricule from personne)\n" +
            "\tselect matricule, nom_personne, courriel_personne, faculte\n" +
            "\tfrom busy_profs_faculte natural join infos;\n";
    public static String query3 ="\twith stages_5ans as (select id_entreprise, matricule_etudiant from stage_1\n" +
            "    \twhere date_debut > '2016-01-01'),\n" +
            "\tetudiants_chimie as (select matricule from etudiant\n" +
            "    \twhere programme = 'Chimie'),\n" +
            "\tstages_etudiants_chimie as (select id_entreprise, matricule_etudiant\n" +
            "    \tfrom stages_5ans natural join etudiants_chimie),\n" +
            "\tnb_stagiaires as (select id_entreprise,\n" +
            "    \tcount(matricule_etudiant) as nb_etudiants from stages_etudiants_chimie\n" +
            "    \tgroup by id_entreprise),\n" +
            "\tid_entreprises as (select id_entreprise from nb_stagiaires\n" +
            "    \twhere nb_etudiants >= 2),\n" +
            "\tinfos_entreprise as (select id_entreprise, nom_entreprise,\n" +
            "    \tcourriel_entreprise from entreprise),\n" +
            "\tcodes_id as (select id_entreprise, code_postal from adresses),\n" +
            "\tcodes_quebec as (select code_postal from code_postal where\n" +
            "    \tprovince = 'Québec'),\n" +
            "\tid_quebec as (select id_entreprise from entreprise natural\n" +
            "    \tjoin codes_quebec),\n" +
            "\tinfos_quebec as (select id_entreprise, nom_entreprise,\n" +
            "    \tcourriel_entreprise from infos_entreprise natural join id_quebec)\n" +
            "\tselect * from infos_quebec natural join id_entreprises;\n";
    public static String query4 = "\twith id_mat_stages as (select id_entreprise, matricule_etudiant,\n" +
            "    \tmatricule_professeur from stage_1),\n" +
            "\tid_mat_visites as (select id_entreprise, matricule_etudiant, date_visite\n" +
            "\tfrom visites),\n" +
            "\tstages_visites as (select matricule_professeur, date_visite\n" +
            "    \tfrom id_mat_stages natural join id_mat_visites),\n" +
            "\tcount_visites as (select matricule_professeur, count(date_visite) as\n" +
            "    \tnb_visites from stages_visites group by matricule_professeur),\n" +
            "\tvisits_gt_3 as (select matricule_professeur from count_visites\n" +
            "    \twhere nb_visites > 3),\n" +
            "\tstages_mat_etudiant as (select matricule_etudiant from stage_1),\n" +
            "\tetudiants_visites as (select matricule_etudiant as matricule from visits_gt_3\n" +
            "    \tnatural join stages_mat_etudiant),\n" +
            "\tetudiants_programmes as (select matricule, programme from etudiant),\n" +
            "\tetudiants_programmes_visites as (select * from etudiants_visites natural join\n" +
            "\tetudiants_programmes)\n" +
            "\tselect programme, count(matricule) as nb_etudiants from etudiants_programmes_visites\n" +
            "\tgroup by programme;\n";
}
