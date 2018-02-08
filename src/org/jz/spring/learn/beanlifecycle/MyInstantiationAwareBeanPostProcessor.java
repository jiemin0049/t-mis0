package org.jz.spring.learn.beanlifecycle;

import java.beans.PropertyDescriptor;

import org.springframework.beans.BeansException;
import org.springframework.beans.PropertyValues;
import org.springframework.beans.factory.config.InstantiationAwareBeanPostProcessorAdapter;

public class MyInstantiationAwareBeanPostProcessor extends
        InstantiationAwareBeanPostProcessorAdapter {

    public Object postProcessBeforeInstantiation(Class beanClass,
            String beanName) {
        if ("car2".equals(beanName)) {
            System.out
                    .println("InstantiationAware BeanPostProcessor.postProcessBeforeInstantiation");
        }
        return null;
    }

    public boolean postProcessAfterInstantiation(Object bean, String beanName)
            throws BeansException {
        if ("car2".equals(beanName)) {
            System.out
                    .println("InstantiationAware BeanPostProcessor.postProcessAfterInstantiation");
        }
        return true;
    }

    public PropertyValues postProcessPropertyValues(PropertyValues pvs,
            PropertyDescriptor[] pds, Object bean, String beanName) {
        if ("car2".equals(beanName)) {
            System.out
                    .println("Instantiation AwareBeanPostProcessor.postProcessPropertyValues");
        }
        return pvs;
    }
}
