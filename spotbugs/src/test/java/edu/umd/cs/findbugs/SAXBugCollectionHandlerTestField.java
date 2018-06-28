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
package edu.umd.cs.findbugs;

import static org.junit.Assert.assertTrue;

import java.util.Collection;
import java.util.Iterator;
import java.util.logging.Logger;

import org.junit.Before;
import org.junit.Test;

import edu.umd.cs.findbugs.aspects.TestStorage;
import edu.umd.cs.findbugs.logger.SingletonLogger;


public class SAXBugCollectionHandlerTestField {

    private SortedBugCollection sbc;

    @Before
    public void setUp() {
        if (TestStorage.sortedBugCollection != null) {
            sbc = TestStorage.sortedBugCollection;
        }
    }

    @Test
    public void testCollectionSize() throws Exception {

        // this test is called after SortedBugCollection.add(BugInstance) is called, so we expect the size to be at
        // least 1
        assertTrue(sbc.getCollection().size() >= 1);
    }

    @Test
    public void testCollectionRemove() throws Exception {

        Collection<BugInstance> collection = sbc.getCollection();
        int size = collection.size();
        Iterator<BugInstance> iterator = collection.iterator();
        BugInstance b = null;
        if (iterator.hasNext()) {
            b = iterator.next();
        }
        Logger logger = SingletonLogger.getInstance();
        logger.info(sbc.getCollection().size() + "");
        sbc.remove(b);
        logger.info(sbc.getCollection().size() + "");

        if (b != null) {
            assertTrue(sbc.getCollection().size() == (size - 1));
        }
    }

}
