package Models;

import enums.Programme;

public class etudiant_1 {
    private String matricule;
    private Programme programme;
    private int credits_complete;
    private float gpa;

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public Programme getProgramme() {
        return programme;
    }

    public void setProgramme(Programme programme) {
        this.programme = programme;
    }

    public int getCredits_complete() {
        return credits_complete;
    }

    public void setCredits_complete(int credits_complete) {
        this.credits_complete = credits_complete;
    }

    public float getGpa() {
        return gpa;
    }

    public void setGpa(float gpa) {
        this.gpa = gpa;
    }
}
