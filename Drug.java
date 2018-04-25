package drugstore;

public class Drug {
	private String DrugName;
	private double DrugPrice;
	private int DrugId;

	public Drug(String drugName, double drugPrice, int drugId) {
		super();
		DrugName = drugName;
		DrugPrice = drugPrice;
		DrugId = drugId;
	}

	public Drug() {

	}

	public String getDrugName() {
		return DrugName;
	}

	public void setDrugName(String drugName) {
		DrugName = drugName;
	}

	public double getDrugPrice() {
		return DrugPrice;
	}

	public void setDrugPrice(double drugPrice) {
		DrugPrice = drugPrice;
	}

	public int getDrugId() {
		return DrugId;
	}

	public void setDrugId(int drugId) {
		DrugId = drugId;
	}

}
