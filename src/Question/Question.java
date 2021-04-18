package Question;

public class Question {
    public static String query1 = "with count_prenoms as (select matricule, count(prenom) as nb_prenoms from\n" +
            "prenoms group by matricule),\nprenoms_gte_2 as (select matricule from count_prenoms where\n" +
            "nb_prenoms >= 2),\nmat_performants as (select matricule from etudiant where\n" +
            "credits_completes >= 30 and gpa >= 3.7)\n select * from prenoms_gte_2 natural join mat_performants;\n";

    public static String query2 = "with curr_stages as (select matricule_professeur, matricule_etudiant, id_entreprise " +
            "from stage_1 where date_debut > '2021-01-01'),\nnb_students_entreprises as (select matricule_professeur, " +
            "count(matricule_etudiant) as nb_students, count(id_entreprise) as nb_entreprises from curr_stages group by " +
            "matricule_professeur), \nbusy_profs as (select matricule_professeur as matricule from " +
            "nb_students_entreprises where nb_students > 1 and nb_entreprises > 1), \nprofs_mat_disciplines as " +
            "(select matricule, discipline from professeur), \nbusy_profs_discipline as (select * from busy_profs " +
            "natural join profs_mat_disciplines), busy_profs_faculte as (select matricule, faculte from " +
            "busy_profs_discipline natural join programmes_departements), \ninfos as (select nom_personne, " +
            "courriel_personne, matricule from personne)\n" +
            "select matricule, nom_personne, courriel_personne, faculte from busy_profs_faculte natural join infos;\n";

    public static String query3 ="with stages_5ans as (select id_entreprise, matricule_etudiant, date_debut from " +
            "stage_1\nwhere date_debut > '2016-01-01'),\netudiants_sec  as (select matricule from etudiant " +
            "where programme = 'Securite interieure'),\nstages_etudiants_sec as (select id_entreprise, " +
            "matricule_etudiant, date_debut from stages_5ans inner join etudiants_sec on (matricule = " +
            "matricule_etudiant)),\nnb_stagiaires as (select id_entreprise, count(matricule_etudiant) as " +
            "nb_etudiants from stages_etudiants_sec group by id_entreprise),\nid_entreprises as (select id_entreprise " +
            "from nb_stagiaires where nb_etudiants >= 1),\ninfos_entreprise as (select entreprise.id_entreprise, " +
            "nom_entreprise, courriel_entreprise, code_postal from entreprise inner join adresses on " +
            "(entreprise.id_entreprise = adresses.id_entreprise)),\n codes_quebec as (select code_postal from " +
            "code_postal where province like 'Qu%'),\nid_quebec as (select id_entreprise from infos_entreprise natural " +
            "join codes_quebec),\ninfos_quebec as (select infos_entreprise.id_entreprise, nom_entreprise, " +
            "courriel_entreprise from infos_entreprise natural join id_quebec)\nselect * from infos_quebec natural " +
            "join id_entreprises;";

    public static String query4 = "with id_mat_stages as (select id_entreprise, matricule_etudiant, " +
            "matricule_professeur from stage_1),\nid_mat_visites as (select id_entreprise, matricule_etudiant, " +
            "date_visite from visites),\nstages_visites as (select matricule_professeur, date_visite from id_mat_stages" +
            " natural join id_mat_visites),\ncount_visites as (select matricule_professeur, count(date_visite) as\n" +
            "nb_visites from stages_visites group by matricule_professeur),\nvisits_gt_3 as " +
            "(select matricule_professeur from count_visites where nb_visites > 3),\n" +
            "stages_mat_etudiant as (select matricule_etudiant from stage_1),\netudiants_visites as (select " +
            "matricule_etudiant as matricule from visits_gt_3 natural join stages_mat_etudiant),\n" +
            "etudiants_programmes as (select matricule, programme from etudiant),\n" +
            "etudiants_programmes_visites as (select * from etudiants_visites natural join etudiants_programmes)\n" +
            "select programme, count(matricule) as nb_etudiants from  Etudiants_programmes_visites group by programme;\n";
}
