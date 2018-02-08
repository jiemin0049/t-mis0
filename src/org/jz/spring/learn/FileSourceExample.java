package org.jz.spring.learn;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

public class FileSourceExample {
    public static void main(String[] args) {
        String filePath = "D:/Entwicklung/workspace/t-mis0/WebContent/WEB-INF/config/db.xml";
        Resource res1 = new FileSystemResource(filePath);

        //D:\Entwicklung\workspace\t-mis0\build\classes
        Resource res2 = new ClassPathResource("conf/file1.txt");

        try {
            FileSourceExample f = new FileSourceExample();
            System.out.println(f.getClass().getResource("/").getPath());
            
            InputStream ins1 = res1.getInputStream();
            InputStream ins2 = res2.getInputStream();
            System.out.println(res1.getFilename());
            System.out.println(res2.getFilename());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
