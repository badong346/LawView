package lv.backend.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import oracle.sql.TIMESTAMP;

public class ClientDTO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Timestamp birth;
	private String sbirth;

	public ClientDTO() {};
	public ClientDTO(String id, String pw, String name, String email, String phone, Timestamp birth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.sbirth = new SimpleDateFormat("YYYY-MM-dd").format(birth);
	}
	public ClientDTO(String id, String pw, String name, String email, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
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
