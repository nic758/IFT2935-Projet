package Models;

import enums.Faculte;
import enums.Programme;

public class etudiant_2 {
    private Programme programme;
    private Faculte faculte;

    public Programme getProgramme() {
        return programme;
    }

    public void setProgramme(Programme programme) {
        this.programme = programme;
    }

    public Faculte getFaculte() {
        return faculte;
    }

    public void setFaculte(Faculte faculte) {
        this.faculte = faculte;
    }
}
