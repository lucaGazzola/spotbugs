package de.tobject.findbugs.aspects;

import java.util.ArrayList;
import java.util.List;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import edu.umd.cs.findbugs.BugInstance;

/**
 * @since ?
 *
 */
public aspect BugInstanceTester {

    pointcut callNewBugInstance(BugInstance bi) : execution(BugInstance.new(..)) && target(bi);
    
    before(BugInstance bi) : callNewBugInstance(bi){
        
        JUnitCore jUnitCore = new JUnitCore();
        String prefix = "edu.umd.cs.findbugs.testcases.";
        List<String> testClasses = new ArrayList<>();
        
        testClasses.add(prefix+"BugInstanceTestParameterized");
        
        for(int i=0; i<2; i++) {
            for(String testClass : testClasses) {
                Result result;
                try {
                    result = jUnitCore.run(Class.forName(testClass));                            
                    System.out.println("test class: "+testClass);
                    System.out.println("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
                    
                    List<Failure> failures = result.getFailures();
                    System.out.println(failures);
                    
                    if(!failures.isEmpty()) {
                        for(Failure f : failures) {
                            System.out.println(f.getTrace());
                        }
                    }
                    
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
}
