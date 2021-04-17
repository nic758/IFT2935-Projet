package Tables;

public class programmes_departements {
    private String programme;
    private String faculte;
    private String discipline;

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public String getFaculte() {
        return faculte;
    }

    public void setFaculte(String faculte) {
        this.faculte = faculte;
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
                programme + ", " +
                faculte + ", " +
                discipline +
                '}';
    }
}
