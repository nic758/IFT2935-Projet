package Question;

public class Question {
    public static String query1 = "WITH\n" +
            "count_prenoms AS\n" +
            "(SELECT matricule, count(prenom) AS nb_prenoms FROM prenoms \n" +
            "GROUP BY matricule),\n" +
            "prenoms_gte_2 AS\n" +
            "(SELECT matricule FROM count_prenoms WHERE nb_prenoms >= 2),\n" +
            "mat_performants AS\n" +
            "(SELECT matricule FROM etudiant WHERE credits_completes >= 30 \n" +
            "AND gpa >= 3.7)\n" +
            "SELECT * FROM prenoms_gte_2 NATURAL JOIN mat_performants;\n";

    public static String query2 = "WITH\n" +
            "curr_stages AS\n" +
            "(SELECT matricule_professeur, matricule_etudiant, id_entreprise FROM stage_1 WHERE date_debut > '2021-01-01'),\n" +
            "nb_students_entreprises AS\n" +
            "(SELECT matricule_professeur, count(matricule_etudiant) AS nb_students, count(id_entreprise) AS nb_entreprises FROM curr_stages GROUP BY matricule_professeur),\n" +
            "busy_profs AS\n" +
            "(SELECT matricule_professeur AS matricule FROM nb_students_entreprises WHERE nb_students > 1 AND nb_entreprises > 1),\n" +
            "profs_mat_disciplines AS\n" +
            "(SELECT matricule, discipline FROM professeur), \n" +
            "busy_profs_discipline AS\n" +
            "(SELECT * FROM busy_profs NATURAL JOIN profs_mat_disciplines), \n" +
            "infos AS\n" +
            "(SELECT nom_personne, courriel_personne, matricule FROM personne) \n" +
            "SELECT matricule, nom_personne, courriel_personne, discipline FROM busy_profs_discipline NATURAL JOIN infos;\n";

    public static String query3 ="WITH\n" +
            "stages_5ans AS\n" +
            "(SELECT id_entreprise, matricule_etudiant, date_debut FROM stage_1 WHERE date_debut > '2016-01-01'),\n" +
            "etudiants_sec AS\n" +
            "(SELECT matricule FROM etudiant WHERE programme = 'Securite interieure'),\n" +
            "stages_etudiants_sec AS\n" +
            "(SELECT id_entreprise, matricule_etudiant, date_debut FROM stages_5ans INNER JOIN etudiants_sec ON (matricule = matricule_etudiant)),\n" +
            "nb_stagiaires AS\n" +
            "(SELECT id_entreprise, count(matricule_etudiant) AS nb_etudiants FROM stages_etudiants_sec GROUP BY id_entreprise),\n" +
            "id_entreprises AS\n" +
            "(SELECT id_entreprise FROM nb_stagiaires WHERE nb_etudiants >= 2),\n" +
            "code_postal_adresses AS\n" +
            "(SELECT id_entreprise, code_postal FROM adresses),\n" +
            "codes_quebec AS\n" +
            "(SELECT code_postal FROM code_postal WHERE province LIKE 'Qu%'),\n" +
            "id_quebec AS\n" +
            "(SELECT id_entreprise FROM code_postal_adresses NATURAL JOIN codes_quebec),\n" +
            "id_cp_selected_entreprises AS\n" +
            "(SELECT * FROM id_entreprises NATURAL JOIN id_quebec),\n" +
            "infos_entreprise AS\n" +
            "(SELECT id_entreprise, nom_entreprise, courriel_entreprise FROM entreprise)\n" +
            "SELECT * FROM id_cp_selected_entreprises NATURAL JOIN infos_entreprise;\n";

    public static String query4 = "WITH    \n" +
            "id_mat_stages AS\n" +
            "(SELECT id_entreprise, matricule_etudiant, matricule_professeur FROM stage_1),\n" +
            "id_mat_visites AS\n" +
            "(SELECT id_entreprise, matricule_etudiant, date_visite FROM visites),\n" +
            "stages_visites AS\n" +
            "(SELECT matricule_professeur, date_visite \n" +
            "FROM id_mat_stages NATURAL JOIN id_mat_visites),\n" +
            "count_visites AS\n" +
            "(SELECT matricule_professeur, count(date_visite) AS\n" +
            "nb_visites FROM stages_visites GROUP BY matricule_professeur),\n" +
            "visits_gt_3 AS\n" +
            "(SELECT matricule_professeur FROM count_visites\n" +
            "WHERE nb_visites > 3),\n" +
            "stages_mat_etudiant AS\n" +
            "(SELECT matricule_etudiant FROM stage_1),\n" +
            "etudiants_visites AS\n" +
            "(SELECT matricule_etudiant as matricule FROM visits_gt_3 NATURAL JOIN stages_mat_etudiant),\n" +
            "etudiants_programmes AS\n" +
            "(SELECT matricule, programme FROM etudiant),\n" +
            "etudiants_programmes_visites AS\n" +
            "(SELECT * FROM etudiants_visites NATURAL JOIN etudiants_programmes)\n" +
            "SELECT programme, count(matricule) AS nb_etudiants FROM etudiants_programmes_visites GROUP BY programme;\n";
}
