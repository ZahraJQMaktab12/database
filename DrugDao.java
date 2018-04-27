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
	ArrayList<Insurance> lInsurance = new ArrayList<Insurance>();
	ArrayList<Sick> lSick = new ArrayList<Sick>();

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
	public ArrayList<Sick> listOfSick(){
		String SickName=null;
		String SickLastName=null;
		int SickId=0;
		Insurance Insurance=new Insurance();
		try {
			rs = null;
			rs = stmt.executeQuery("SELECT * FROM drugstore.sick;");
			while (rs.next()) {
				SickName=rs.getString(1);
				SickLastName=rs.getString(2);
				SickId=rs.getInt(3);
				Insurance.setInsuranceId(rs.getInt(4));
				Sick s=new Sick(SickName,SickLastName,SickId,Insurance);
				lSick.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lSick;
	}
	public  Insurance showInsurance(int idinsurance){
		String InsuranceKind=null;
		try {
			rs = stmt.executeQuery("select * from  drugstore.insurance where InsuranceId=" + idinsurance + ";");
			while(rs.next()){
				InsuranceKind=rs.getString(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Insurance i=new Insurance();
		i.setInsuranceId(idinsurance);
		i.setInsuranceKind(InsuranceKind);
		return i;
	}
	
	
	
	
	
	

	public ArrayList<Insurance> listOfInsurance() {
		int InsuranceId = 0;
		String InsuranceKind = null;
		try {
			rs = stmt.executeQuery("SELECT * FROM drugstore.insurance;");
			while (rs.next()) {
				InsuranceKind = rs.getString(1);
				InsuranceId = rs.getInt(2);
				Insurance i = new Insurance(InsuranceId, InsuranceKind);
				lInsurance.add(i);
			}
		} catch (SQLException e) {
			System.out.println("exception " + e);
		}
		return lInsurance;
	}

	public void updateDrug(Drug d) {
		try {
			stmt.executeUpdate("update drugstore.drug set DrugName='" + d.getDrugName() + "', DrugPrice="
					+ d.getDrugPrice() + " where DrugId=" + d.getDrugId() + ";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Drug showDrug(int drugid) {
		String DrugName = null;
		double DrugPrice = 0.0;
		try {
			rs = stmt.executeQuery("select * from  drugstore.drug where DrugId=" + drugid + ";");
			while (rs.next()) {
				DrugName = rs.getString(1);
				DrugPrice = rs.getDouble(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Drug d = new Drug();
		d.setDrugName(DrugName);
		d.setDrugPrice(DrugPrice);
		d.setDrugId(drugid);
		return d;
	}

	public Integer addDrug(Drug d) {
		try {
			stmt.executeUpdate("insert into drugstore.drug (DrugName,DrugPrice) value('" + d.getDrugName() + "',"
					+ d.getDrugPrice() + ");");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return getlastIdDrug();
	}

	public Integer getlastIdDrug() {
		try {
			rs = stmt.executeQuery("select max(drug.DrugId) as drugId from drugstore.drug;");
			if (rs.next())
				return rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}// end class
