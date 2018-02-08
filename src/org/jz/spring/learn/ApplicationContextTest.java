package org.jz.spring.learn;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextTest {
public static void main(String[] args) {
    ApplicationContext ctx = new ClassPathXmlApplicationContext("org/jz/spring/learn/beans.xml");
    Car car =  (Car) ctx.getBean("car");
    System.out.println("car bean is ready for use! " + car.getBrand());
}
}
