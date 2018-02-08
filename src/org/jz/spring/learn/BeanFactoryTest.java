package org.jz.spring.learn;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

public class BeanFactoryTest {
    public static void main(String[] args) throws Exception {
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource resource = resolver
                .getResource("classpath:org/jz/spring/learn/beans.xml");
        BeanFactory bf = new XmlBeanFactory(resource);
        Car car = bf.getBean("car", Car.class);
        System.out.println("car bean is ready for use! " + car.getBrand());
    }
}
