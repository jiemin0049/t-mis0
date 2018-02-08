package org.jz.spring.learn.beanlifecycle;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;

public class MyBeanPostProcessor implements BeanPostProcessor {

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName)
            throws BeansException {
        if (beanName.equals("car2")) {
            Car2 car = (Car2) bean;
            if (car.getMaxSpeed() >= 200) {
                System.out
                        .println("Invoke BeanPostProcessor.postProcessAfterInitialization(), set maxSpeed to 200");
                car.setMaxSpeed(200);
            }
        }
        return bean;
    }

    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName)
            throws BeansException {
        if (beanName.equals("car2")) {
            Car2 car = (Car2) bean;
            if (car.getColor() == null) {
                System.out
                        .println("invoke BeanPostProcessor.postProcessBeforeInitialization(), color is null, set default BLACK");
                car.setColor("BLACK");
            }
        }
        return bean;
    }

}
