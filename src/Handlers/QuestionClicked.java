package Handlers;

import org.hibernate.Query;
import org.hibernate.Session;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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
        System.out.println("Trying to query....");
        Query q = s.createQuery(query);
        List persons = q.list();

        textArea.setText(persons.toString());
    }
}
