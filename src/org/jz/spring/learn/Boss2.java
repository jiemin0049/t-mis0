package org.jz.spring.learn;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

public class Boss2 {
    private Car car = new Car();

    public void setCar(Car car) {
        this.car = car;
    }

    public Car getCar() {
        return car;
    }

    public static void main(String[] args) throws Exception {
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource resource = resolver
                .getResource("classpath:org/jz/spring/learn/beans.xml");
        BeanFactory bf = new XmlBeanFactory(resource);
        Boss2 boss2 = bf.getBean("boss2", Boss2.class);
        System.out.println("Boss, your car bean is ready for use! "
                + boss2.getCar().getBrand());
    }
}
