package edu.umd.cs.findbugs.testcases.config;

import org.junit.Assert;
import org.junit.Test;

import edu.umd.cs.findbugs.config.UserPreferences;

public class UserPreferencesTest {

    @Test
    public void testClone() {
        UserPreferences sut = UserPreferences.createDefaultUserPreferences();

        UserPreferences clone = sut.clone();

        Assert.assertEquals(sut, clone);
        Assert.assertEquals(sut.getClass(), clone.getClass());
    }
}
