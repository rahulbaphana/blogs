package com.equalexperts;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    public void testBlogPageStructure() {
        WebDriver driver = new FirefoxDriver();
        driver.get("http://www.equalexperts.com/blog/");

        assertEquals(driver.findElement(By.className("author-name")).getText(), "Louis Abel");
        driver.close();
    }
}
