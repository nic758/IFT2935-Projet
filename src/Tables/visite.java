package Tables;

import java.io.Serializable;
import java.sql.Date;

public class visite implements Serializable {
    private String id_entreprise;
    private String matricule_etudiant;
    private Date date_debut;
    private Date date_fin;
    private Date date_visite;

    public Date getDate_visite() {
        return date_visite;
    }

    public void setDate_visite(Date date_visite) {
        this.date_visite = date_visite;
    }

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

    @Override
    public String toString() {
        return "{" +
                id_entreprise + ", " +
                matricule_etudiant + ", " +
                date_debut +", " +
                date_fin +", "+
                date_visite +", "+
                '}';
    }
}
