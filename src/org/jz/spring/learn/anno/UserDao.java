package org.jz.spring.learn.anno;

import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

    public String getUserName() {
        return "jz";
    }
}
