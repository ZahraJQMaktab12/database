package drugstore;

public class Insurance {
	private int InsuranceId;
	private String InsuranceKind;
	// private Drug[] Drugs;
	// private double[] Percentageofinsurancesupport;

	public Insurance(int insuranceId, String insuranceKind) {
		super();
		InsuranceId = insuranceId;
		InsuranceKind = insuranceKind;
	}

	public Insurance() {

	}

	public String getInsuranceKind() {
		return InsuranceKind;
	}

	public void setInsuranceKind(String insuranceKind) {
		InsuranceKind = insuranceKind;
	}

	public int getInsuranceId() {
		return InsuranceId;
	}

	public void setInsuranceId(int insuranceId) {
		InsuranceId = insuranceId;
	}

}
