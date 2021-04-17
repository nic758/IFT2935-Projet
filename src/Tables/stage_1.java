package Tables;

import java.sql.Date;

public class stage_1 {
    private String id_entreprise;
    private String matricule_etudiant;
    private String matricule_professeur;
    private String poste;
    private Date date_debut;
    private Date date_fin;
    private int heures_travailles;

    public String getId_entreprise() {
        return id_entreprise;
    }

    public void setId_entreprise(String id_entreprise) {
        this.id_entreprise = id_entreprise;
    }

    public String getMatricule_etudiant() {
        return matricule_etudiant;
    }

    public void setMatricule_etudiant(String matricule_etudiant) {
        this.matricule_etudiant = matricule_etudiant;
    }

    public String getMatricule_professeur() {
        return matricule_professeur;
    }

    public void setMatricule_professeur(String matricule_professeur) {
        this.matricule_professeur = matricule_professeur;
    }

    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public Date getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public int getHeures_travailles() {
        return heures_travailles;
    }

    public void setHeures_travailles(int heures_travailles) {
        this.heures_travailles = heures_travailles;
    }

    @Override
    public String toString() {
        return "{" +
                id_entreprise + ", " +
                matricule_etudiant + ", " +
                matricule_professeur + ", " +
                poste + ", " +
                date_debut + ", "+
                date_fin + ", " +
                heures_travailles +
                '}';
    }
}
