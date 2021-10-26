package tools;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.Serializable;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class CancelButton extends JFrame implements ActionListener, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	JButton buttonYes;
	JButton buttonNo;
	String messageForYes;
	String messageForNo;
	/*
	 * the idea of this class is to create the reusable framework for a button to be used in each jsp.
	 * Then, the only thing left for the jsp to add is the folder whwe
	 */
	
	
	public CancelButton(String messageForYes, String messageForNo)
	{
		this.messageForYes = messageForYes;
		this.messageForNo = messageForNo;
		
		
		buttonYes = new JButton();
		buttonYes.setBounds(80, 70, 55, 20);
		buttonYes.addActionListener(this);
		buttonYes.setText("Yes");
		
		buttonNo = new JButton();
		buttonNo.setBounds(150, 70, 55, 20);
		buttonNo.addActionListener(this);
		buttonNo.setText("No");
		
		JLabel label = new JLabel("Are you sure?");
		label.setAlignmentX(JLabel.CENTER_ALIGNMENT);
	    label.setAlignmentY(JLabel.CENTER_ALIGNMENT);
		
		
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLayout(null);
		this.setSize(300, 150);
		this.setVisible(true);
		this.setTitle("Are you sure?");
		this.add(buttonYes);
		this.add(buttonNo);
		this.add(label);
	}
	
	@Override
	public void actionPerformed(ActionEvent e)
	{
		if (e.getSource() == buttonYes)
		{
			System.out.println(this.messageForYes);
		}
		else if (e.getSource() == buttonNo)
		{
			System.out.println(this.messageForNo);
		}
	}
	
	
	public static void main(String[] args)
	{
		new CancelButton("fuck you", "no, you");
		
		//JOptionPane.showMessageDialog(null, "This info", "title", JOptionPane.PLAIN_MESSAGE);

	}
}
