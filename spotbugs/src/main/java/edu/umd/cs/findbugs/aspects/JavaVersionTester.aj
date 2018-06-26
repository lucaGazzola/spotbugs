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

import edu.umd.cs.findbugs.JavaVersion;
import edu.umd.cs.findbugs.JavaVersionTestField;
import edu.umd.cs.findbugs.logger.SingletonLogger;

/**
 * @since ?
 *
 */
public aspect JavaVersionTester {
    
pointcut callJavaVersion(JavaVersion jv) : execution(JavaVersion.new(..)) && target(jv) && if(TestFlag.javaVersionTesting == false);
    
    after(JavaVersion jv) : callJavaVersion(jv){
        
        if(TestFlag.instrumentation) {
        
            TestFlag.javaVersionTesting = true;
            TestStorage.javaVersion = jv;
            
            Logger logger = SingletonLogger.getInstance();
            
            JUnitCore jUnitCore = new JUnitCore();
            Result result = jUnitCore.run(JavaVersionTestField.class);
            
            logger.info("test class: "+TestStorage.javaVersion.toString());
            logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
            
            List<Failure> failures = result.getFailures();
            
            if(!failures.isEmpty()) {
                for(Failure f : failures) {
                    logger.info(f.getTrace());
                }
            }
            
            TestFlag.javaVersionTesting = false;
        }
    }

}
