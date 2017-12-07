/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phoneapplication;


import com.ericsson.otp.erlang.*;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class PhoneApplication {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        PhoneJFrame pjf = new PhoneJFrame();
        pjf.Init("frame1");
        pjf.show();
    }
    
}
