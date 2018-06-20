package de.tobject.findbugs.aspects;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import edu.umd.cs.findbugs.BugInstance;


public aspect BugInstanceTester {

//    pointcut callNewBugInstance(BugInstance bi) : execution(BugInstance.new(..)) && target(bi);
//    
//    before(BugInstance bi) : callNewBugInstance(bi){
//        
//        Logger logger = Logger.getLogger("MyLog");  
//        FileHandler fh;    
//        
//        try {  
//
//            // This block configure the logger with handler and formatter  
//            fh = new FileHandler("/Users/luca/work/spotbugs_logs/testLog.log");  
//            logger.addHandler(fh);
//            SimpleFormatter formatter = new SimpleFormatter();  
//            fh.setFormatter(formatter); 
//            
//            logger.info("test");
//
//        } catch (SecurityException e) {  
//            e.printStackTrace();  
//        } catch (IOException e) {  
//            e.printStackTrace();  
//        }
//        
//        logger.info("test");
//        
//        JUnitCore jUnitCore = new JUnitCore();
//        String prefix = "edu.umd.cs.findbugs.testcases.";
//        List<String> testClasses = new ArrayList<>();
//        
//        testClasses.add(prefix+"BugInstanceTestParameterized");
//        
//        for(int i=0; i<2; i++) {
//            for(String testClass : testClasses) {
//                Result result;
//                try {
//                    result = jUnitCore.run(Class.forName(testClass));                            
//                    logger.info("test class: "+testClass);
//                    logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
//                    
//                    List<Failure> failures = result.getFailures();
//                    
//                    if(!failures.isEmpty()) {
//                        for(Failure f : failures) {
//                            logger.info(f.getTrace());
//                        }
//                    }
//                    
//                } catch (ClassNotFoundException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
    
}
