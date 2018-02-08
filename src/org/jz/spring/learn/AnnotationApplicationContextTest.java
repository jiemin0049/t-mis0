package org.jz.spring.learn;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class AnnotationApplicationContextTest {
    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(
                Beans.class);
        Car car = ctx.getBean("car", Car.class);
        System.out.println(car.getBrand() + " " + car.getMaxSpeed());
    }
}
