package Models;

import java.io.Serializable;

public class Etudiant implements Serializable {
    private String matricule;
    private String programme;
    private int credits_complete;
    private float gpa;

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
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

    @Override
    public String toString() {
        return "[" +
                matricule + ", " +
                programme + ", " +
                credits_complete + ", "+
                gpa +
                '}';
    }
}
