package edu.umd.cs.findbugs.aspects;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import edu.umd.cs.findbugs.BugInstance;
import edu.umd.cs.findbugs.BugInstanceTestParameterized;
import edu.umd.cs.findbugs.logger.SingletonLogger;


public aspect BugInstanceTester {

//    pointcut callSetProperty(BugInstance bi) : execution(* BugInstance.setProperty(String, String)) && target(bi);
//    
//    after(BugInstance bi) : callSetProperty(bi){
//        
//        Logger logger = SingletonLogger.getInstance();
//        
//        logger.info(bi.getInstanceKey());
//        
//        JUnitCore jUnitCore = new JUnitCore();
//        String prefix = "edu.umd.cs.findbugs.";
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
    
  pointcut callBugInstance(BugInstance bi) : execution(BugInstance.new(..)) && target(bi) && if(TestFlag.testing == false);
  
  after(BugInstance bi) : callBugInstance(bi){
      
      TestFlag.testing = true;
      
      Logger logger = SingletonLogger.getInstance();
      
      // logger.info(bi.toString());
      
      JUnitCore jUnitCore = new JUnitCore();
      Result result = jUnitCore.run(BugInstanceTestParameterized.class);
      
      logger.info("test class: BugInstanceTestParameterized");
      logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
      
      List<Failure> failures = result.getFailures();
    
      if(!failures.isEmpty()) {
          for(Failure f : failures) {
              logger.info(f.getTrace());
          }
      }
      
      TestFlag.testing = false;
      
      
  }
    
}
