import CLIPSJNI.*;

import java.util.List;

public class Application
{
    private Environment clips;

    public void run()
    {
        clips = new Environment();
        clips.load("clips/what_should_i_eat.clp");
        clips.reset();
        clips.run();
        
        String evalStr = "(find-all-facts ((?f hobbit)) TRUE)";

        PrimitiveValue fv = clips.eval(evalStr);
        if(fv == null) {
        	System.out.println("null");
        }
		try {
			System.out.println(fv.get(0).getFactSlot("imie").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
}
