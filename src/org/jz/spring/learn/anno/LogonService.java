package org.jz.spring.learn.anno;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

@Service
public class LogonService {
    @Autowired
    private LogDao logDao;
    @Autowired(required = false)
    private UserDao userDao;

    public String getUserName() {
        return userDao.getUserName();
    }

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(
                LogonService.class);
        UserDao uDao = ctx.getBean("userDao", UserDao.class);
        System.out.println(uDao.getUserName());
    }
}
