package de.tobject.findbugs.aspects;

import java.util.ArrayList;
import java.util.List;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import de.tobject.findbugs.view.BugInfoView;

/**
 * This aspect allows the execution of jUnit test cases at runtime
 *
 */
public aspect ViewTester {
//    
//    pointcut callBugInfoView(BugInfoView view) : execution(BugInfoView.new(..)) && target(view);
//    
//    before(BugInfoView view) : callBugInfoView(view){
//        
//        JUnitCore jUnitCore = new JUnitCore();
//        String prefix = "edu.umd.cs.findbugs.testcases.";
//        List<String> testClasses = new ArrayList<>();
//        
//        testClasses.add(prefix+"BugInstanceTest");
//        testClasses.add(prefix+"BugInstanceTestParameterized");
//        testClasses.add(prefix+"ClassScreenerTest");
//        testClasses.add(prefix+"IntAnnotationTest");
//        testClasses.add(prefix+"JavaVersionTest");
//        testClasses.add(prefix+"ObfuscateTest");
//        testClasses.add(prefix+"OpcodeStackItemTest");
//        testClasses.add(prefix+"SAXBugCollectionHandlerTest");
//        
//        testClasses.add(prefix+"architecture.PackageDependenciesTest");
//        
//        testClasses.add(prefix+"ba.FrameTest");
//        testClasses.add(prefix+"ba.MethodHashTest");
//        testClasses.add(prefix+"ba.NullnessAnnotationTest");
//        testClasses.add(prefix+"ba.SignatureParserTest");
//        
//        testClasses.add(prefix+"ba.generic.GenericSignatureParserTest");
//        testClasses.add(prefix+"ba.generic.GenericUtilitiesTest");
//        testClasses.add(prefix+"ba.generic.TestGenericObjectType");
//        
//        testClasses.add(prefix+"ba.npe.IsNullValueTest");
//        testClasses.add(prefix+"ba.npe.NonNullParamPropertyTest");
//        testClasses.add(prefix+"ba.npe.ReturnPathTypeTest");
//        
//        testClasses.add(prefix+"ba.type.TypeFrameModelingVisitorTest");
//        
//        testClasses.add(prefix+"classfile.TestClassDescriptor");
//        
////        testClasses.add(prefix+"classfile.impl.ClassFactoryTest");
//        testClasses.add(prefix+"classfile.impl.NoopAnalysisCache");
//        
//        testClasses.add(prefix+"config.ProjectFilterSettingsTest");
//        testClasses.add(prefix+"config.UserPreferencesTest");
//        
//        testClasses.add(prefix+"detect.FindSqlInjectionTest");
////        testClasses.add(prefix+"detect.IncompatMaskTest");
//        
//        testClasses.add(prefix+"filter.NameMatchTest");
//        testClasses.add(prefix+"filter.NotMatcherTest");
//        testClasses.add(prefix+"filter.RelationalOpTest");
//        testClasses.add(prefix+"filter.SignatureUtilTest");
//        testClasses.add(prefix+"filter.SourceMatcherTest");
//        
//        testClasses.add(prefix+"gui2.FilterFactoryTest");
////        testClasses.add(prefix+"gui2.SaveTypeTest");
//        
////        testClasses.add(prefix+"internalAnnotation.SlashedClassNameTest");
//        
////        testClasses.add(prefix+"io.IOTest");
//        
////        testClasses.add(prefix+"jaif.JAIFScannerTest");
//        
//        testClasses.add(prefix+"ml.SplitCamelCaseIdentifierTest");
//        
//        testClasses.add(prefix+"util.ClassNameTest");
//        testClasses.add(prefix+"util.StringsTest");
//        
//        testClasses.add(prefix+"visitclass.DismantleBytecodeTest");
//        testClasses.add(prefix+"visitclass.GetNumberArgumentsTest");
//        testClasses.add(prefix+"visitclass.PreorderVisitorTest");
//        
////        testClasses.add(prefix+"workflow.FindSeqNumTest");
//     
//        for(int i=0; i<2; i++) {
//            for(String testClass : testClasses) {
//                Result result;
//                try {
//                    result = jUnitCore.run(Class.forName(testClass));                            
//                    System.out.println("test class: "+testClass);
//                    System.out.println("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
//                    
//                    List<Failure> failures = result.getFailures();
//                    System.out.println(failures);
//                    
//                    if(!failures.isEmpty()) {
//                        for(Failure f : failures) {
//                            System.out.println(f.getTrace());
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
