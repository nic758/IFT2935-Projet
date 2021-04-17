package Handlers;

import org.hibernate.Query;
import org.hibernate.Session;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.List;

public class QuestionClicked implements ActionListener {
    private String query;
    private JTextArea textArea;
    Session s;

    public QuestionClicked(String q, Session s, JTextArea ta) {
        query = q;
        this.s=s;
        textArea = ta;
    }

    @Override
    public void actionPerformed(ActionEvent actionEvent) {
        //textArea.setText("");
        System.out.println("Trying to query....");
         Query q = s.createQuery(query);
        List data = q.list();

        textArea.setText(toString(data));
    }

    private <T> String toString(List<T> ls){
        String ret = "";
        int count = 0;
        for (T l :ls) {
            try {
                Object[] ob = (Object[])l;
                ret += Arrays.toString(ob) + "\n";
            }catch (Exception e){
               ret += l.toString() + "\n";
            }


            count++;
        }

        return ret;
    }
}
