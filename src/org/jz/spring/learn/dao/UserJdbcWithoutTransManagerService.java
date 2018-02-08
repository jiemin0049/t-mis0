package org.jz.spring.learn.dao;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserJdbcWithoutTransManagerService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void addScore(String name, int id) {
        String sql = "UPDATE dd SET name =? WHERE id=?";
        jdbcTemplate.update(sql, name, id);
    }

    public static void main(String[] args) {
        ApplicationContext ctx = new ClassPathXmlApplicationContext(
                "org/jz/spring/learn/dao/jdbcWithoutTx.xml");
        UserJdbcWithoutTransManagerService service = (UserJdbcWithoutTransManagerService) ctx
                .getBean("userService");
        JdbcTemplate jdbcTemplate = (JdbcTemplate) ctx.getBean("jdbcTemplate");
        jdbcTemplate.execute("insert into dd(id, name) values(4,'tom')");
        service.addScore("tom + tom", 4);

        String name = jdbcTemplate.queryForObject(
                "SELECT name FROM dd WHERE id =4", String.class);
        System.out.println("name: " + name);
    }
}
