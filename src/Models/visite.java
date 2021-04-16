package Models;

import java.sql.Date;

public class visite {
    private String id_entreprise;
    private String matricule_etudiant;
    private Date date_debut;
    private Date date_fin;

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
}
