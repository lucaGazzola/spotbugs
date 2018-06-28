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


import org.junit.Before;
import org.junit.Test;

import edu.umd.cs.findbugs.aspects.TestStorage;


public class SAXBugCollectionHandlerTestField {

    private SortedBugCollection sbc;

    @Before
    public void setUp() {
        if (TestStorage.sortedBugCollection != null) {
            sbc = TestStorage.sortedBugCollection;
        }
    }

    @Test
    public void testBugInstanceXmlPropsNoReviews() throws Exception {
        assertTrue(sbc.getCollection().size() >= 1);
    }

}
