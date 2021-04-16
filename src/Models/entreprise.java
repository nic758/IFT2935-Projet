package Models;

public class entreprise {
    private String id_entreprise;
    private String nom_entreprise;
    private String courriel_entreprise;
    private String telephone_entreprise;
    private boolean participante;
    private String domaine;

    public String getId_entreprise() {
        return id_entreprise;
    }

    public void setId_entreprise(String id_entreprise) {
        this.id_entreprise = id_entreprise;
    }

    public String getNom_entreprise() {
        return nom_entreprise;
    }

    public void setNom_entreprise(String nom_entreprise) {
        this.nom_entreprise = nom_entreprise;
    }

    public String getCourriel_entreprise() {
        return courriel_entreprise;
    }

    public void setCourriel_entreprise(String courriel_entreprise) {
        this.courriel_entreprise = courriel_entreprise;
    }

    public String getTelephone_entreprise() {
        return telephone_entreprise;
    }

    public void setTelephone_entreprise(String telephone_entreprise) {
        this.telephone_entreprise = telephone_entreprise;
    }

    public boolean isParticipante() {
        return participante;
    }

    public void setParticipante(boolean participante) {
        this.participante = participante;
    }

    public String getDomaine() {
        return domaine;
    }

    public void setDomaine(String domaine) {
        this.domaine = domaine;
    }
}
