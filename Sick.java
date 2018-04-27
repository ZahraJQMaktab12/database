package drugstore;

public class Sick {
	private String SickName;
	private String SickLastName;
	private int SickId;
	private Insurance Insurance;

	public Sick(String sickName, String sickLastName, int sickId, drugstore.Insurance insurance) {
		super();
		SickName = sickName;
		SickLastName = sickLastName;
		SickId = sickId;
		Insurance = insurance;
	}

	public Sick() {

	}

	public String getSickName() {
		return SickName;
	}

	public void setSickName(String sickName) {
		SickName = sickName;
	}

	public String getSickLastName() {
		return SickLastName;
	}

	public void setSickLastName(String sickLastName) {
		SickLastName = sickLastName;
	}

	public int getSickId() {
		return SickId;
	}

	public void setSickId(int sickId) {
		SickId = sickId;
	}

	public Insurance getInsurance() {
		return Insurance;
	}

	public void setInsurance(Insurance insurance) {
		Insurance = insurance;
	}

}
