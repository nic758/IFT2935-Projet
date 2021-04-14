import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class QuestionWindow {
    public JPanel panel1;
    private JButton question1Button;
    private JButton question2Button;
    private JButton question3Button;
    private JButton question4Button;
    private JTextArea textArea1;
    private JButton[] questions = {question1Button, question2Button, question3Button, question4Button};
    private String[] queries = {"SELECT address FROM Person", "SELECT lastname FROM Person", "SELECT firstname FROM Person", "SELECT city FROM Person"};


    public QuestionWindow(Session s) {
        for (int i=0; i<4; i++){
            questions[i].addActionListener(new QuestionClickedHandler(i+1, queries[i], s));
        }
    }




    private class QuestionClickedHandler implements ActionListener {
        private int questionNum;
        private String query;
        Session s;

        public QuestionClickedHandler(int n, String q, Session s) {
            questionNum = n;
            query = q;
            this.s=s;
        }

        @Override
        public void actionPerformed(ActionEvent actionEvent) {
            System.out.println("Trying to query....");
            Query q = s.createQuery(query);
            List persons = q.list();

            textArea1.setText(persons.toString());
        }
    }
}
