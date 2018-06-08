package de.tobject.findbugs.view;

import java.util.ArrayList;
import java.util.List;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;


/**
 * This aspect allows the execution of jUnit test cases at runtime
 *
 */
public aspect ViewTester {
    
    pointcut callBugInfoView(BugInfoView view) : execution(BugInfoView.new(..)) && target(view);
    
    before(BugInfoView view) : callBugInfoView(view){
        JUnitCore jUnitCore = new JUnitCore();
        String prefix = "edu.umd.cs.findbugs.testcases.";
        List<String> testClasses = new ArrayList<>();
        
        testClasses.add(prefix+"BugInstanceTest");
        testClasses.add(prefix+"ClassScreenerTest");
        testClasses.add(prefix+"IntAnnotationTest");
        testClasses.add(prefix+"JavaVersionTest");
        testClasses.add(prefix+"ObfuscateTest");
        testClasses.add(prefix+"OpcodeStackItemTest");
        testClasses.add(prefix+"SAXBugCollectionHandlerTest");
//        
//        testClasses.add(prefix+"architecture.PackageDependenciesTest");
//        
//        testClasses.add(prefix+"ba.FrameTest");
//        testClasses.add(prefix+"ba.MethodHashTest");
//        testClasses.add(prefix+"ba.NullnessAnnotationTest");
//        testClasses.add(prefix+"ba.SignatureParserTest");
//        
//        testClasses.add(prefix+"generic.GenericSignatureParserTest");
        testClasses.add(prefix+"generic.GenericUtilitiesTest");
//        testClasses.add(prefix+"generic.TestGenericObjectType");
        
        for(int i=0; i<2; i++) {
            for(String testClass : testClasses) {
                Result result;
                try {
                    result = jUnitCore.run(Class.forName(testClass));                            
                    System.out.println("test class: "+testClass);
                    System.out.println("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
                    
                    List<Failure> failures = result.getFailures();
                    System.out.println(failures);
                    
//                    if(!failures.isEmpty()) {
//                        for(int j=0; j<failures.size(); j++) {
//                            System.out.println(failures.get(j).toString());
//                        }
//                    }
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
    }

       

}
