package org.jz.spring.learn.methodreplace;

import org.jz.spring.learn.Car;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

public class Boss3 {
    private Car car;

    public void setCar(Car car) {
        this.car = car;
    }

    public Car getCar() {
        Car car = new Car();
        car.setBrand("BMW Z4");
        return car;
    }

    public static void main(String[] args) throws Exception {
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource resource = resolver
                .getResource("classpath:org/jz/spring/learn/beans.xml");
        BeanFactory bf = new XmlBeanFactory(resource);
        Boss3 boss3 = bf.getBean("boss3", Boss3.class);
        System.out.println("Boss, your getCar is replaced! "
                + boss3.getCar().getBrand());
    }
}
