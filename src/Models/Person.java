package Models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.sql.Date;

public class Person implements Serializable {
    private String matricule;
    private String code_postal;
    private String nom_personne;
    private Date date_naissance;
    private String faculte;
    private String telephone_personne;
    private String courriel_personne;
    private int no_personne;

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getCode_postal() {
        return code_postal;
    }

    public void setCode_postal(String code_postal) {
        this.code_postal = code_postal;
    }

    public String getNom_personne() {
        return nom_personne;
    }

    public void setNom_personne(String nom_personne) {
        this.nom_personne = nom_personne;
    }

    public Date getDate_naissance() {
        return date_naissance;
    }

    public void setDate_naissance(Date date_naissance) {
        this.date_naissance = date_naissance;
    }

    public String getFaculte() {
        return faculte;
    }

    public void setFaculte(String faculte) {
        this.faculte = faculte;
    }

    public String getTelephone_personne() {
        return telephone_personne;
    }

    public void setTelephone_personne(String telephone_personne) {
        this.telephone_personne = telephone_personne;
    }

    public String getCourriel_personne() {
        return courriel_personne;
    }

    public void setCourriel_personne(String courriel_personne) {
        this.courriel_personne = courriel_personne;
    }

    public int getNo_personne() {
        return no_personne;
    }

    public void setNo_personne(int no_personne) {
        this.no_personne = no_personne;
    }

    @Override
    public String toString() {
        return "["
                + matricule + ","
                + code_postal + ", "
                + nom_personne + ", "
                + date_naissance + ", "
                + faculte + ", "
                + telephone_personne + ", "
                + courriel_personne + ", "
                + no_personne +
                ']';
    }
}
