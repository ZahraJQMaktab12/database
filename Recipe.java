package drugstore;

import java.util.ArrayList;

public class Recipe {

	private ArrayList<Integer> NumberOfDrug = new ArrayList<Integer>();
	private ArrayList<Drug> Drugs = new ArrayList<Drug>();
	private ArrayList<Sick> Sick = new ArrayList<Sick>();
	private String ReferDate;
	private int RecipeId;

	public Recipe(String referDate, int recipeId) {
		ReferDate = referDate;
		RecipeId = recipeId;
	}

	public Recipe() {

	}

	public ArrayList<Integer> getNumberOfDrug() {
		return NumberOfDrug;
	}

	public void setNumberOfDrug(ArrayList<Integer> numberOfDrug) {
		NumberOfDrug = numberOfDrug;
	}

	public ArrayList<Drug> getDrugs() {
		return Drugs;
	}

	public void setDrugs(ArrayList<Drug> drugs) {
		Drugs = drugs;
	}

	public ArrayList<Sick> getSick() {
		return Sick;
	}

	public void setSick(ArrayList<Sick> sick) {
		Sick = sick;
	}

	public String getReferDate() {
		return ReferDate;
	}

	public void setReferDate(String referDate) {
		ReferDate = referDate;
	}

	public int getRecipeId() {
		return RecipeId;
	}

	public void setRecipeId(int recipeId) {
		RecipeId = recipeId;
	}

}
