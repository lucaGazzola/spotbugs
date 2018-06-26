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

import edu.umd.cs.findbugs.IntAnnotation;
import edu.umd.cs.findbugs.IntAnnotationTestField;
import edu.umd.cs.findbugs.logger.SingletonLogger;

/**
 * @since ?
 *
 */
public aspect IntAnnotationTester {
    
    pointcut callIntAnnotation(IntAnnotation ia) : execution(IntAnnotation.new(..)) && target(ia) && if(TestFlag.intAnnotationTesting == false);
    
    after(IntAnnotation ia) : callIntAnnotation(ia){
        
        if(TestFlag.instrumentation) {
        
            TestFlag.intAnnotationTesting = true;
            TestStorage.intAnnotation = ia;
            
            Logger logger = SingletonLogger.getInstance();
            
            JUnitCore jUnitCore = new JUnitCore();
            Result result = jUnitCore.run(IntAnnotationTestField.class);
            
            logger.info("test class: "+TestStorage.intAnnotation.toString());
            logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
            
            List<Failure> failures = result.getFailures();
            
            if(!failures.isEmpty()) {
                for(Failure f : failures) {
                    logger.info(f.getTrace());
                }
            }
            
            TestFlag.intAnnotationTesting = false;
        }
    }

}
