package Models;

public class Prenom {

    private String matricule;
    private String prenom;

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

//    @Override
//    public String toString() {
//        return "[" +
//                matricule + ", " +
//                prenom + ", " +
//                ']';
//    }
}
