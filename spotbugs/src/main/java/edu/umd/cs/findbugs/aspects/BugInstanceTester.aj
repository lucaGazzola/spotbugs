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
    
  pointcut callBugInstance(BugInstance bi) : execution(BugInstance.new(..)) && target(bi) && if(TestFlag.testing == false);
  
  after(BugInstance bi) : callBugInstance(bi){
      
      TestFlag.testing = true;
      
      Logger logger = SingletonLogger.getInstance();
            
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
