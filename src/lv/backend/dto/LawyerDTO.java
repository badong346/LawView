package lv.backend.dto;

public class LawyerDTO {

	//임시로 만든 DTO 실제 LawyerDTO 코드로 교체할것
	
	private int seq;
	private String name; 
	private String title;
	private String phone;
	private String specialty;
	private String office_name;
	private String office_phone;
	private String test;
	private String education;
	private String id;
	
	
	public LawyerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public LawyerDTO(int seq, String name, String title, String phone, String specialty, String office_name,
			String office_phone, String test, String education, String id) {
		super();
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.phone = phone;
		this.specialty = specialty;
		this.office_name = office_name;
		this.office_phone = office_phone;
		this.test = test;
		this.education = education;
		this.id = id;
	}




	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getOffice_name() {
		return office_name;
	}
	public void setOffice_name(String office_name) {
		this.office_name = office_name;
	}
	public String getOffice_phone() {
		return office_phone;
	}
	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
