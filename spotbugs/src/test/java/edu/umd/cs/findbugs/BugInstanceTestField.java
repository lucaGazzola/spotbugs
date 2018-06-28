package edu.umd.cs.findbugs;

import java.util.Iterator;
import java.util.NoSuchElementException;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import edu.umd.cs.findbugs.aspects.TestStorage;

public class BugInstanceTestField {

    private BugInstance b;

    @Before
    public void setUp() {
        if (TestStorage.bugInstance != null) {
            b = TestStorage.bugInstance;
        }
    }

    @Test
    public void testPropertyIterator() {
        checkPropertyIterator(b.propertyIterator());
    }

    @Test
    public void testRemoveThroughIterator() {
        removeThroughIterator(b.propertyIterator());
        checkEmptyPropertyList(b.propertyIterator());
    }

    @Test(expected = NoSuchElementException.class)
    public void testIterateTooFar() {
        Iterator<BugProperty> iter = b.propertyIterator();
        while (iter.hasNext()) {
            get(iter);
        }
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
        removeThroughIterator(b.propertyIterator());
        b.setProperty("testProperty", "testValue");
        checkPropertyIterator(b.propertyIterator());
    }

    private void get(Iterator<BugProperty> iter) {
        try {
            iter.next();
        } catch (NoSuchElementException e) {
            Assert.assertTrue(false);
        }
    }

    private void checkPropertyIterator(Iterator<BugProperty> iter) {
        while (iter.hasNext()) {
            checkProperty(iter.next());
        }
        Assert.assertFalse(iter.hasNext());
    }

    private void checkProperty(BugProperty property) {
        Assert.assertTrue(property.getName() != null);
        Assert.assertTrue(property.getValue() != null);
    }

    private void removeThroughIterator(Iterator<BugProperty> iter) {
        while (iter.hasNext()) {
            BugProperty prop = iter.next();
            iter.remove();
        }
    }

    private void checkEmptyPropertyList(Iterator<BugProperty> propertyIterator) {

        Assert.assertTrue(!propertyIterator.hasNext());

    }

}
