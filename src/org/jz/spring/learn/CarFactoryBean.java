package org.jz.spring.learn;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

public class CarFactoryBean implements FactoryBean<Car> {
    private String carInfo;

    public String getCarInfo() {
        return carInfo;
    }

    public void setCarInfo(String info) {
        carInfo = info;
    }

    @Override
    public Car getObject() throws Exception {
        Car car = new Car();
        if (carInfo != null) {
            String[] infos = carInfo.split(",");
            car.setBrand(infos[0]);
            car.setMaxSpeed(Integer.parseInt(infos[1]));
            car.setColor(infos[2]);
        }
        return car;
    }

    @Override
    public Class<Car> getObjectType() {
        return Car.class;
    }

    @Override
    public boolean isSingleton() {
        return false;
    }

    public static void main(String[] args) throws Exception {
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource resource = resolver
                .getResource("classpath:org/jz/spring/learn/beans.xml");
        BeanFactory bf = new XmlBeanFactory(resource);
        Car car = bf.getBean("carFactoryBean", Car.class);
        System.out.println(car.getBrand());
        
    }
}
