package org.jz.spring.learn.beanlifecycle;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class LifeCycleBean {
    private static void LifeCycleBeanFactory() {

        Resource res = new ClassPathResource("org/jz/spring/learn/beans.xml");
        BeanFactory bf = new XmlBeanFactory(res);

        ((ConfigurableBeanFactory) bf)
                .addBeanPostProcessor(new MyBeanPostProcessor());

        ((ConfigurableBeanFactory) bf)
                .addBeanPostProcessor(new MyInstantiationAwareBeanPostProcessor());

        Car2 car_1 = (Car2) bf.getBean("car2");
        car_1.introduce();
        car_1.setColor("red");

        Car2 car_2 = (Car2) bf.getBean("car2");
        System.out.println("car_1==car_2: " + (car_1 == car_2));
        ((XmlBeanFactory) bf).destroySingletons();
    }

    public static void main(String[] args) {
        LifeCycleBeanFactory();
    }
}
