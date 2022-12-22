import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.BreakIterator;

import java.util.Locale;
import java.util.ResourceBundle;
import java.util.MissingResourceException;

import CLIPSJNI.*;

class WhatShouldIEat implements ActionListener
{
    JLabel displayLabel;
    JButton nextButton;
    JPanel choicesPanel;
    JPanel imagesPanel;
    ButtonGroup choicesButtons;
    ResourceBundle resources;
    String question;
    boolean lastScreen = false;
    Environment clips;
    boolean isExecuting = false;
    Thread executionThread;

    WhatShouldIEat()
    {
        try
        {
        	resources = ResourceBundle.getBundle("resources.Resources",Locale.getDefault());
        }
        catch (MissingResourceException mre)
        {
            mre.printStackTrace();
            return;
        }

        JFrame jfrm = new JFrame(resources.getString("WhatShouldIEat"));

        jfrm.getContentPane().setLayout(new GridLayout(4,1));

        jfrm.setSize(800,800);

        jfrm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel displayPanel = new JPanel();
        displayLabel = new JLabel();
        displayPanel.add(displayLabel);

        choicesPanel = new JPanel();
        choicesButtons = new ButtonGroup();

        JPanel buttonPanel = new JPanel();

        nextButton = new JButton(resources.getString("Next"));
        nextButton.setActionCommand("Next");
        buttonPanel.add(nextButton);
        nextButton.addActionListener(this);
        
        imagesPanel = new JPanel();

        jfrm.getContentPane().add(displayPanel);
        jfrm.getContentPane().add(imagesPanel);
        jfrm.getContentPane().add(choicesPanel);
        jfrm.getContentPane().add(buttonPanel);

        clips = new Environment();

        clips.load("clips/what_should_i_eat.clp");

        clips.reset();

        runWhatShouldIEat();

        jfrm.setVisible(true);
    }


    private void nextUIState() throws Exception
    {
        String evalStr = "(find-all-facts ((?f ui-template)) TRUE)";

        PrimitiveValue fv = clips.eval(evalStr).get(0);

        PrimitiveValue image = fv.getFactSlot("image");
        
        if(image.size() > 0)
        {
        	lastScreen = true;
            try 
            {
            	for(int i = 0; i < image.size(); i++)
            	{
            		String path = "../res/Photo/" + resources.getString(image.get(i).toString().replace("\"", ""));
            		BufferedImage img = ImageIO.read(new File(path));		
            		JLabel pic = new JLabel(new ImageIcon(img));
            		imagesPanel.add(pic);
            	}
    		} 
            catch (IOException e) 
            {
    			e.printStackTrace();
    		}
        }
        choicesPanel.removeAll();
    	choicesButtons = new ButtonGroup();
        if(!lastScreen)
        {
        	PrimitiveValue pv = fv.getFactSlot("answers");

        	for (int i = 0; i < pv.size(); i++)
        	{
        		PrimitiveValue bv = pv.get(i);
        		String answer = bv.toString().replace("\"", "");
        		JRadioButton rButton;

        		rButton = new JRadioButton(resources.getString(answer),false); 

        		rButton.setActionCommand(answer);
        		choicesPanel.add(rButton);
        		choicesButtons.add(rButton);
        	}
        }
        choicesPanel.repaint();

        String questionResource = "Your result:";
        if (!lastScreen)
        {
        	question = fv.getFactSlot("question").toString().replace("\"", "");
        	questionResource = resources.getString(question);
        }
        else
        {
        	nextButton.setText("Restart");
        }

        wrapLabelText(displayLabel, questionResource);

        executionThread = null;

        isExecuting = false;
        
        clips.assertString("(clean)");
        clips.run();
    }

    
    public void actionPerformed(ActionEvent ae)
    {
        try
        { 
        	onActionPerformed(ae); 
        }
        catch (Exception e)
        { 
        	e.printStackTrace(); 
        }
    }
    

    public void runWhatShouldIEat()
    {
        Runnable runThread =
                new Runnable()
                {
                    public void run()
                    {
                        clips.run();

                        SwingUtilities.invokeLater(
                                new Runnable()
                                {
                                    public void run()
                                    {
                                        try
                                        {
                                        	nextUIState(); 
                                        }
                                        catch (Exception e)
                                        { 
                                        	e.printStackTrace();
                                        }
                                    }
                                });
                    }
                };

        isExecuting = true;

        executionThread = new Thread(runThread);

        executionThread.start();
    }

    public void onActionPerformed(ActionEvent ae) throws Exception
    {
        if (isExecuting) return;
        
        if (lastScreen)
        {
        	lastScreen = false;
        	clips.reset();
        	imagesPanel.removeAll();
        	imagesPanel.repaint();
        	System.out.println("Reset");
        	nextButton.setText(resources.getString("Next"));
        }
        else
        {
            String assertion = "(" + question + choicesButtons.getSelection().getActionCommand() + ")";
            //System.out.println(assertion);
            clips.assertString(assertion);
        }
        runWhatShouldIEat();

    }

    private void wrapLabelText(
            JLabel label,
            String text)
    {
        FontMetrics fm = label.getFontMetrics(label.getFont());
        Container container = label.getParent();
        int containerWidth = container.getWidth();
        int textWidth = SwingUtilities.computeStringWidth(fm,text);
        int desiredWidth;

        if (textWidth <= containerWidth)
        {
        	desiredWidth = containerWidth;
        }
        else
        {
            int lines = (int) ((textWidth + containerWidth) / containerWidth);

            desiredWidth = (int) (textWidth / lines);
        }

        BreakIterator boundary = BreakIterator.getWordInstance();
        boundary.setText(text);

        StringBuffer trial = new StringBuffer();
        StringBuffer real = new StringBuffer("<html><center>");

        int start = boundary.first();
        for (int end = boundary.next(); end != BreakIterator.DONE;
             start = end, end = boundary.next())
        {
            String word = text.substring(start,end);
            trial.append(word);
            int trialWidth = SwingUtilities.computeStringWidth(fm,trial.toString());
            if (trialWidth > containerWidth)
            {
                trial = new StringBuffer(word);
                real.append("<br>");
                real.append(word);
            }
            else if (trialWidth > desiredWidth)
            {
                trial = new StringBuffer("");
                real.append(word);
                real.append("<br>");
            }
            else
            {
            	real.append(word); 
            	}
        }

        real.append("</html>");

        label.setText(real.toString());
    }

}
