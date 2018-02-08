package org.jz.spring.learn.methodreplace;

import java.lang.reflect.Method;

import org.jz.spring.learn.Car;
import org.springframework.beans.factory.support.MethodReplacer;

public class BossReplace implements MethodReplacer {

    @Override
    public Object reimplement(Object arg0, Method arg1, Object[] arg2)
            throws Throwable {
        Car car = new Car();
        car.setBrand("Jaguar");
        return car;
    }

}
