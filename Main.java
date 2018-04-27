package drugstore;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		DrugDao dd=new DrugDao();
		ArrayList<Sick> sicks = dd.listOfSick();
		for (int i = 0; i <sicks.size(); i++) {
			System.out.println(sicks.get(i).getSickName()+" "+sicks.get(i).getSickId()+" "+sicks.get(i).getInsurance().getInsuranceId());
		}

//			
		
		

	}

}
