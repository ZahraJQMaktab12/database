package drugstore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DrugDao {
	Statement stmt;
	Connection conn;
	ResultSet rs;
	ArrayList<Drug> lDrug = new ArrayList<Drug>();

	public DrugDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://127.0.0.1/drugstore?user=root&password=";
			conn = DriverManager.getConnection(url);
			stmt = conn.createStatement();
			if (conn == null) {
				System.out.println("connection null");
			}
		} catch (Exception e) {
			System.out.println("exception " + e);
		}

	}

	public Employee findEmployee(String user, String pass) {
		String firstName = null;
		String lastName = null;
		String userName = null;
		String password = null;
		int post = 0;
		try {
			rs = stmt.executeQuery(
					"select * from drugstore.employee where UserName='" + user + "' and password ='" + pass + "';");
			while (rs.next()) {
				firstName = rs.getString(1);
				lastName = rs.getString(2);
				userName = rs.getString(3);
				password = rs.getString(4);
				post = rs.getInt(5);
			}
		} catch (SQLException e) {
			System.out.println("exception " + e);
		}
		Employee e = new Employee(firstName, lastName, userName, password, post);
		return e;
	}

	public ArrayList<Drug> listOfDrug() {
		String DrugName = null;
		double DrugPrice = 0.0;
		int DrugId = 0;
		try {
			rs = stmt.executeQuery("SELECT * FROM drugstore.drug;");
			while (rs.next()) {
				DrugName = rs.getString(1);
				DrugPrice = rs.getDouble(2);
				DrugId = rs.getInt(3);
				Drug d = new Drug(DrugName, DrugPrice, DrugId);
				lDrug.add(d);
			}
		} catch (SQLException e) {
			System.out.println("exception " + e);
		}

		return lDrug;
	}

}// end class
