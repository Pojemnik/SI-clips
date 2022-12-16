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
        
        String evalStr = "(find-all-facts ((?f ui-template)) TRUE)";

        PrimitiveValue fv = clips.eval(evalStr);
        if(fv == null) {
        	System.out.println("null");
        }
		try {
			System.out.println(fv.get(0).getFactSlot("question").toString());
			List<PrimitiveValue> list = fv.get(0).getFactSlot("answers").multifieldValue();
			System.out.println(list.get(0));
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
}
