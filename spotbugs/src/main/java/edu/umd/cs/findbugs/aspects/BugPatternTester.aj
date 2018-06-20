package edu.umd.cs.findbugs.aspects;


import java.util.logging.Logger;

import edu.umd.cs.findbugs.BugPattern;
import edu.umd.cs.findbugs.logger.SingletonLogger;


public aspect BugPatternTester {

//    pointcut callBugPattern(BugPattern bp) : execution(BugPattern.new(..)) && target(bp);
//    
//    after(BugPattern bp) : callBugPattern(bp){
//        
//        Logger logger = SingletonLogger.getInstance();
//        
//        logger.info(bp.getLongDescription());
//        
//    }
    
}
