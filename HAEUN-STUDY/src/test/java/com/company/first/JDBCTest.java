package com.company.first;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@haeundb_high?TNS_ADMIN=C://Users//miso//Downloads//Wallet_haeundb";
	private static final String USER = "admin";

	private static final String PWD = "Bean667485??";


	@Test
	public void testConn() throws Exception{

		Class.forName(DRIVER);

		try(Connection conn = DriverManager.getConnection(URL, USER, PWD)){
			System.out.println(conn);
		}catch(Exception e){

			e.printStackTrace();

		}

	}



}
