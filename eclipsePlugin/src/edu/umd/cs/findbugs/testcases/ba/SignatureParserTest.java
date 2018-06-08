package edu.umd.cs.findbugs.testcases.ba;

import java.util.Iterator;

import org.junit.Assert;
import org.junit.Test;

import edu.umd.cs.findbugs.ba.SignatureParser;

public class SignatureParserTest {

    @Test
    public void testNoParams() {
        SignatureParser sut = new SignatureParser("()V");
        Iterator<String> i = sut.parameterSignatureIterator();
        Assert.assertFalse(i.hasNext());
    }

    @Test
    public void testManyParams() {
        SignatureParser sut = new SignatureParser("(IJFDZLjava/lang/String;B)Ljava/lang/Object;");
        Iterator<String> i = sut.parameterSignatureIterator();
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "I");
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "J");
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "F");
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "D");
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "Z");
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "Ljava/lang/String;");
        Assert.assertTrue(i.hasNext());
        Assert.assertEquals(i.next(), "B");
        Assert.assertFalse(i.hasNext());
    }
}
