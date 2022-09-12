package edu.nlu.ogani_jsp.util;

import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

public class DBUtilTest {

    @Test
    public void testConnection() throws SQLException {
        Connection conn = DBUtil.makeConnection();
        DatabaseMetaData dm = conn.getMetaData();
        System.out.println("Driver name: " + dm.getDriverName());
        System.out.println("Driver version: " + dm.getDriverVersion());
        conn.close();
    }
}