/*
 * Contributions to SpotBugs
 * Copyright (C) 2018, luca
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
package edu.umd.cs.findbugs.aspects;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import edu.umd.cs.findbugs.logger.SingletonLogger;
import edu.umd.cs.findbugs.BugInstance;
import edu.umd.cs.findbugs.SAXBugCollectionHandlerTestField;
import edu.umd.cs.findbugs.SortedBugCollection;
import java.io.Reader;

/**
 * @since ?
 *
 */
public aspect SAXBugCollectionHandlerTester {
    
    pointcut callSortedBugCollection(SortedBugCollection sbc) : execution(public boolean SortedBugCollection.add(BugInstance)) && target(sbc) && if(TestFlag.SAXBugCollectionHandlerTesting == false);
    
    after(SortedBugCollection sbc) : callSortedBugCollection(sbc){
        
        if(TestFlag.instrumentation) {
        
            TestFlag.SAXBugCollectionHandlerTesting = true;
            
            TestStorage.sortedBugCollection = sbc;
            
            Logger logger = SingletonLogger.getInstance();
                  
            JUnitCore jUnitCore = new JUnitCore();
            Result result = jUnitCore.run(SAXBugCollectionHandlerTestField.class);
            
            logger.info("test class: "+sbc.toString());
            logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
            
            List<Failure> failures = result.getFailures();
          
            if(!failures.isEmpty()) {
                for(Failure f : failures) {
                    logger.info(f.getTrace());
                }
            }
            
            TestFlag.SAXBugCollectionHandlerTesting = false;
        }
        
    }

}
