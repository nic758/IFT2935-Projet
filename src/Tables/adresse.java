package Tables;

import java.io.Serializable;

public class adresse implements Serializable {
    private String id_entreprise;
    private String code_postal;
    private int no_entreprise;
    private String rue_entreprise;

    public String getId_entreprise() {
        return id_entreprise;
    }

    public void setId_entreprise(String id_entreprise) {
        this.id_entreprise = id_entreprise;
    }

    public String getCode_postal() {
        return code_postal;
    }

    public void setCode_postal(String code_postal) {
        this.code_postal = code_postal;
    }

    public int getNo_entreprise() {
        return no_entreprise;
    }

    public void setNo_entreprise(int no_entreprise) {
        this.no_entreprise = no_entreprise;
    }

    public String getRue_entreprise() {
        return rue_entreprise;
    }

    public void setRue_entreprise(String rue_entreprise) {
        this.rue_entreprise = rue_entreprise;
    }

    @Override
    public String toString() {
        return "{" +
                id_entreprise + ", " +
                code_postal + ", " +
                no_entreprise + ", "+
                rue_entreprise + ", " +
                '}';
    }
}
