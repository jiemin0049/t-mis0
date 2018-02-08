package org.jz.spring.learn.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Savepoint;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class DataSourceTest {

    public static void main(String[] args) {
        DriverManagerDataSource ds = new DriverManagerDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setUrl("jdbc:postgresql://localhost:5432/mis0");
        ds.setUsername("postgres");
        ds.setPassword("admin");
        try {
            Connection conn = ds.getConnection();
            conn.setAutoCommit(false);
            PreparedStatement stmt = conn
                    .prepareStatement("insert into dd(id, name) values(?,?)");
            stmt.setInt(1, 3);
            stmt.setString(2, "hello");
            Savepoint svpt = conn.setSavepoint("savepoint 1");
            stmt.execute();
            conn.commit();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
        } finally {

        }
    }
}
