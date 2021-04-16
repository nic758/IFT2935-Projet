package Models;

import enums.Discipline;
import enums.Faculte;

public class professeur_2 {
    private Discipline discipline;
    private Faculte faculte;

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }

    public Faculte getFaculte() {
        return faculte;
    }

    public void setFaculte(Faculte faculte) {
        this.faculte = faculte;
    }
}
