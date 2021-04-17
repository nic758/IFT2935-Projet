package Tables;

import java.io.Serializable;

public class professeur implements Serializable {

    private String matricule;
    private String discipline;

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    @Override
    public String toString() {
        return "[" +
                matricule + ", " +
                discipline +
                '}';
    }
}
