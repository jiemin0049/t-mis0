package org.jz.spring.learn.beanlifecycle;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class Car2 implements BeanFactoryAware, BeanNameAware, InitializingBean,
        DisposableBean {

    private String brand;
    private String color;
    private int maxSpeed;
    private BeanFactory beanFactory;
    private String beanName;

    public Car2() {
        System.out.println("Car2 constructor");
    }

    public void setBrand(String br) {
        System.out.println("invoke setBrand()");
        brand = br;
    }

    public void introduce() {
        System.out.println("brand: " + brand + "; color: " + color
                + "; maxSpeed: " + maxSpeed);
    }

    @Override
    public void destroy() throws Exception {
        System.out.println("invok DisposableBean.destroy()");
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("invoke InitializingBean.afterPropertesSet()");
    }

    @Override
    public void setBeanName(String bName) {
        System.out.println("invoke BeanFactoryAware.setBeanFactory()");
        beanName = bName;
    }

    @Override
    public void setBeanFactory(BeanFactory bf) throws BeansException {
        System.out.println("invoke BeanFactoryAware.setBeanFactory()");
        beanFactory = bf;
    }

    public void myInit() {
        System.out
                .println("invoke config file init-method -> myInit(), set maxSpeed");
        maxSpeed = 240;
    }

    public void myDestroy() {
        System.out.println("invoke config file destroy-metod -> myDestroy()");
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(int maxSpeed) {
        this.maxSpeed = maxSpeed;
    }
}
