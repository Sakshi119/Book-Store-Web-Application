package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnector {
	private Connection con = null;

	public Connection getConnection() {
		try {
			Class.forName(DBConfig.DRIVER_CLASS);
			con = DriverManager.getConnection(DBConfig.url, DBConfig.username, DBConfig.password);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}

	public Statement getStatement() {
		Statement stmt = null;
		try {
			con = getConnection();
			stmt = con.createStatement();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return stmt;
	}

	public PreparedStatement getPreparedStatement(String query) {
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}
		return pstmt;
	}

	public ResultSet getResultSet(String query) {
		ResultSet rs = null;
		try {
			Statement stmt = getStatement();
			rs = stmt.executeQuery(query);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return rs;
	}

	public void closeConnection() {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

}
