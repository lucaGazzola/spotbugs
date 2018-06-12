package edu.umd.cs.findbugs.testcases;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.NoSuchElementException;

import org.apache.commons.lang.ArrayUtils;
import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExternalResource;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameter;
import org.junit.runners.Parameterized.Parameters;

import edu.umd.cs.findbugs.BugInstance;
import edu.umd.cs.findbugs.BugProperty;
import edu.umd.cs.findbugs.Priorities;

@RunWith(Parameterized.class)
public class BugInstanceTestParameterized {

    @Parameters
    public static Collection<Object[]> data() {
        BugInstance b;
        b = new BugInstance("NP_NULL_ON_SOME_PATH", Priorities.NORMAL_PRIORITY);
        b.setProperty("A", "a");
        b.setProperty("B", "b");
        b.setProperty("C", "c");
        return Arrays.asList(new Object[][] {
                { b, new String[] { "A", "B", "C" }, new String[] { "a", "b", "c" } }
           });
    }

    @Parameter // first data value (0) is default
    public /* NOT private */ BugInstance b;

    @Parameter(1)
    public /* NOT private */ String[] properties;

    @Parameter(2)
    public /* NOT private */ String[] propertiesLowerCase;

    @Test
    public void testPropertyIterator() {
        checkPropertyIterator(b.propertyIterator(), properties, propertiesLowerCase);
    }

    @Test
    public void testRemoveThroughIterator1() {
        removeThroughIterator(b.propertyIterator(), "A");
        properties = (String[]) ArrayUtils.removeElement(properties, "A");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "a");
        checkPropertyIterator(b.propertyIterator(), properties, propertiesLowerCase);
        b.setProperty("A", "a");
    }

    @Test
    public void testRemoveThroughIterator2() {
        removeThroughIterator(b.propertyIterator(), "B");
        properties = (String[]) ArrayUtils.removeElement(properties, "B");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "b");
        checkPropertyIterator(b.propertyIterator(), properties, propertiesLowerCase);
        b.setProperty("B", "b");
    }

    @Test
    public void testRemoveThroughIterator3() {
        removeThroughIterator(b.propertyIterator(), "C");
        properties = (String[]) ArrayUtils.removeElement(properties, "C");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "c");
        checkPropertyIterator(b.propertyIterator(), properties, propertiesLowerCase);
        b.setProperty("C", "c");
    }

    @Rule
    public ExternalResource externalResource = new ExternalResource() {

        @Override
        protected void before() {
            b = new BugInstance("NP_NULL_ON_SOME_PATH", Priorities.NORMAL_PRIORITY);
            b.setProperty("A", "a");
            b.setProperty("B", "b");
            b.setProperty("C", "c");
        }
    };

    @Test(expected = NoSuchElementException.class)
    public void testIterateTooFar() {
        Iterator<BugProperty> iter = b.propertyIterator();
        get(iter);
        get(iter);
        get(iter);
        iter.next();
    }

    @Test(expected = IllegalStateException.class)
    public void testMultipleRemove() {
        Iterator<BugProperty> iter = b.propertyIterator();
        iter.next();
        iter.remove();
        iter.remove();
    }

    @Test(expected = IllegalStateException.class)
    public void testRemoveBeforeNext() {
        Iterator<BugProperty> iter = b.propertyIterator();
        iter.remove();
    }

    @Test
    public void testRemoveAndAdd() {
        removeThroughIterator(b.propertyIterator(), "C");
        properties = (String[]) ArrayUtils.removeElement(properties, "C");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "c");
        b.setProperty("D", "d");
        properties = (String[]) ArrayUtils.add(properties, "D");
        propertiesLowerCase = (String[]) ArrayUtils.add(propertiesLowerCase, "d");
        checkPropertyIterator(b.propertyIterator(), properties, propertiesLowerCase);
        b.setProperty("E", "e");
        properties = (String[]) ArrayUtils.add(properties, "E");
        propertiesLowerCase = (String[]) ArrayUtils.add(propertiesLowerCase, "e");
        checkPropertyIterator(b.propertyIterator(), properties, propertiesLowerCase);
    }

    @Test
    public void testRemoveAll1() {
        removeThroughIterator(b.propertyIterator(), "A");
        properties = (String[]) ArrayUtils.removeElement(properties, "A");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "a");
        checkPropertyIterator(b.propertyIterator(), new String[] { "B", "C" }, new String[] { "b", "c" });
        removeThroughIterator(b.propertyIterator(), "B");
        properties = (String[]) ArrayUtils.removeElement(properties, "B");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "b");
        checkPropertyIterator(b.propertyIterator(), new String[] { "C" }, new String[] { "c" });
        removeThroughIterator(b.propertyIterator(), "C");
        properties = (String[]) ArrayUtils.removeElement(properties, "C");
        propertiesLowerCase = (String[]) ArrayUtils.removeElement(propertiesLowerCase, "c");
        checkPropertyIterator(b.propertyIterator(), new String[0], new String[0]);
    }

    private void get(Iterator<BugProperty> iter) {
        try {
            iter.next();
            // Good
        } catch (NoSuchElementException e) {
            Assert.assertTrue(false);
        }
    }

    private void checkPropertyIterator(Iterator<BugProperty> iter, String[] names, String[] values) {
        if (names.length != values.length) {
            throw new IllegalArgumentException();
        }
        for (int i = 0; i < names.length; ++i) {
            Assert.assertTrue(iter.hasNext());
            String name = names[i];
            String value = values[i];
            checkProperty(iter.next(), name, value);
        }
        Assert.assertFalse(iter.hasNext());
    }

    private void checkProperty(BugProperty property, String name, String value) {
        Assert.assertEquals(property.getName(), name);
        Assert.assertEquals(property.getValue(), value);
    }

    private void removeThroughIterator(Iterator<BugProperty> iter, String name) {
        while (iter.hasNext()) {
            BugProperty prop = iter.next();
            if (prop.getName().equals(name)) {
                iter.remove();
            }
        }
    }
}
