package wumbo.model;

public class Course {
	String code;
	String name;
	float units;
	String coordinator; 
	Boolean available;
	String semester;
	String prerequisites;
	Float year;
	
	public Course(String code, String name, float units, String coordinator, Boolean available, String semester, String prerequisites, Float year){
		this.code = code;
		this.name = name;
		this.units = units;
		this.coordinator = coordinator; 
		this.available = available; 
		this.semester = semester;
		this.prerequisites = prerequisites;
		this.year = year;
		
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getUnits() {
		return units;
	}

	public void setUnits(int units) {
		this.units = units;
	}

	public String getCoordinator() {
		return coordinator;
	}

	public void setCoordinator(String coordinator) {
		this.coordinator = coordinator;
	}

	public Boolean getAvailable() {
		return available;
	}

	public void setAvailable(Boolean available) {
		this.available = available;
	}
	
	public String getSemester(){
		return semester;
	}
	
	public void setSemester(String semester){
		this.semester = semester;
	}
	
	public String getPrequisites(){
		return prerequisites;
	}
	
	public void setPrerequisite(String prerequisites){
		this.prerequisites = prerequisites;
	}
	
	public Float getYear(){
		return year;
	}
	
	public void setYear(Float year){
		this.year = year;
	}
	
}
