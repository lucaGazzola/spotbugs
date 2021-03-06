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

import edu.umd.cs.findbugs.BugInstance;
import edu.umd.cs.findbugs.ClassScreener;
import edu.umd.cs.findbugs.IntAnnotation;
import edu.umd.cs.findbugs.JavaVersion;
import edu.umd.cs.findbugs.OpcodeStack;
import edu.umd.cs.findbugs.SortedBugCollection;

/**
 * @since ?
 *
 */
public class TestStorage {

    public static BugInstance bugInstance;
    public static ClassScreener classScreener;
    public static IntAnnotation intAnnotation;
    public static JavaVersion javaVersion;
    public static OpcodeStack.Item opcodeStackItem;
    public static SortedBugCollection sortedBugCollection;

}
