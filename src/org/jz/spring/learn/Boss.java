package org.jz.spring.learn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

public class Boss {
    private Car car;
    private List<String> favorites = new ArrayList<String>();
    private Set<String> hobby = new HashSet<String>();
    private Map<String, String> jobs = new HashMap<String, String>();

    public Set<String> getHobby() {
        return hobby;
    }

    public Map<String, String> getJobs() {
        return jobs;
    }

    public void setJobs(Map<String, String> jobs) {
        this.jobs = jobs;
    }

    public void setHobby(Set<String> hobby) {
        this.hobby = hobby;
    }

    public List getFavorites() {
        return favorites;
    }

    public void setFavorites(List favorites) {
        this.favorites = favorites;
    }

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
        Boss boss = bf.getBean("boss", Boss.class);
        System.out.println("Boss, your car bean is ready for use! "
                + boss.getCar().getBrand());
        System.out.println("Boss, your favorites: " + boss.getFavorites());
        System.out.println("Boss, your hobbies: " + boss.getHobby());
        System.out.println("Boss, your jobs: " + boss.getJobs());
    }
}
