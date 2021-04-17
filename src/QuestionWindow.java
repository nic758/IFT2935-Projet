import Handlers.QuestionClicked;
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
    private final JButton[] questions = {question1Button, question2Button, question3Button, question4Button};
    private final String[] queries = {"FROM adresse", "FROM Person", "FROM Etudiant", "FROM professeur"};


    public QuestionWindow(Session s) {
        for (int i=0; i<4; i++){
            questions[i].addActionListener(new QuestionClicked(queries[i], s, textArea1));
        }
    }


}


