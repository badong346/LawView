package lv.backend.dto;

public class LawDTO {
	
	private int lawNo; // 검색 번호
	private String lawId; // 법령 ID
	private String lawName; // 법령 이름
	private String lawType; // 법령 종류
	private String lawDate; // 공포 일자
	private String lawActDate; // 시행 일자	
	
	

	public LawDTO(int lawNo, String lawId, String lawName, String lawType, String lawDate, String lawActDate) {
		super();
		this.lawNo = lawNo;
		this.lawId = lawId;
		this.lawName = lawName;
		this.lawType = lawType;
		this.lawDate = lawDate;
		this.lawActDate = lawActDate;
	}


	public int getLawNo() {
		return lawNo;
	}


	public void setLawNo(int lawNo) {
		this.lawNo = lawNo;
	}


	public String getLawId() {
		return lawId;
	}

	public void setLawId(String lawId) {
		this.lawId = lawId;
	}

	public String getLawName() {
		return lawName;
	}

	public void setLawName(String lawName) {
		this.lawName = lawName;
	}

	public String getLawType() {
		return lawType;
	}

	public void setLawType(String lawType) {
		this.lawType = lawType;
	}

	public String getLawDate() {
		return lawDate;
	}

	public void setLawDate(String lawDate) {
		this.lawDate = lawDate;
	}

	public String getLawActDate() {
		return lawActDate;
	}

	public void setLawActDate(String lawActDate) {
		this.lawActDate = lawActDate;
	}


	
	
}
