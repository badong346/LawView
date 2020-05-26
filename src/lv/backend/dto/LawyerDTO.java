package lv.backend.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import oracle.sql.TIMESTAMP;

public class LawyerDTO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String office_name;
	private String office_phone;
	private String office_zipcode;
	private String office_addr1;
	private String office_addr2;
	private String test;
	private String test_num;
	private String approval;
	private String gender;
	private Timestamp birth;
	private String sbirth;

	public LawyerDTO() {};
	public LawyerDTO(String id, String pw, String name, String email, String phone, String office_name,
			String office_phone, String office_zipcode, String office_addr1, String office_addr2, String test,
			String test_num,String approval, String gender, Timestamp birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.office_name = office_name;
		this.office_phone = office_phone;
		this.office_zipcode = office_zipcode;
		this.office_addr1 = office_addr1;
		this.office_addr2 = office_addr2;
		this.test = test;
		this.test_num = test_num;
		this.approval = approval;
		this.gender = gender;
		this.birth = birth;
		this.sbirth = new SimpleDateFormat("YYYY-MM-dd").format(birth);
	}





	public LawyerDTO(String id, String pw, String name, String email, String phone, String office_name,
			String office_phone, String office_zipcode, String office_addr1, String office_addr2, String test,
			String test_num, String approval, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.office_name = office_name;
		this.office_phone = office_phone;
		this.office_zipcode = office_zipcode;
		this.office_addr1 = office_addr1;
		this.office_addr2 = office_addr2;
		this.test = test;
		this.test_num = test_num;
		this.approval = approval;
		this.gender = gender;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getOffice_zipcode() {
		return office_zipcode;
	}
	public void setOffice_zipcode(String office_zipcode) {
		this.office_zipcode = office_zipcode;
	}
	public String getOffice_addr1() {
		return office_addr1;
	}
	public void setOffice_addr1(String office_addr1) {
		this.office_addr1 = office_addr1;
	}
	public String getOffice_addr2() {
		return office_addr2;
	}
	public void setOffice_addr2(String office_addr2) {
		this.office_addr2 = office_addr2;
	}
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public String getTest_num() {
		return test_num;
	}
	public void setTest_num(String test_num) {
		this.test_num = test_num;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public String getSbirth() {
		return sbirth;
	}
	public void setSbirth(String sbirth) {
		this.sbirth = sbirth;
	}





}
