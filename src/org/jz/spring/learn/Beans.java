package org.jz.spring.learn;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Beans {
    @Bean(name = "car")
    public Car buildCar() {
        Car car = new Car();
        car.setBrand("red flag");
        car.setMaxSpeed(200);
        return car;
    }
}
