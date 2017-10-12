package com.sealinetech.test;

import com.sealinetech.tools.MybatisGenerator;
import com.sealinetech.tools.MybatisGeneratorFactory;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.sql.SQLException;

public class CreateMapper {
    public static void main(String[] args) {
        MybatisGeneratorFactory factory = new MybatisGeneratorFactory();
        MybatisGenerator generator=factory.createGenerator();
        try {
            generator.generate(null,null);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }
    }
}
