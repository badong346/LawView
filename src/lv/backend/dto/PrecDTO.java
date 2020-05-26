package lv.backend.dto;

public class PrecDTO {
	
	private int precNo;
	private String precId; // 판례 일련 번호
	private String precName; // 판례 이름
	private String precCourt; // 법원 종류
	private String precType; // 사건 유형
	private String precDate; // 선고 일자


	public PrecDTO(int precNo, String precId, String precName, String precCourt, String precType, String precDate) {
		super();
		this.precNo = precNo;
		this.precId = precId;
		this.precName = precName;
		this.precCourt = precCourt;
		this.precType = precType;
		this.precDate = precDate;
	}
	
	

	
	public int getPrecNo() {
		return precNo;
	}




	public void setPrecNo(int precNo) {
		this.precNo = precNo;
	}




	public String getPrecId() {
		return precId;
	}

	public void setPrecId(String precId) {
		this.precId = precId;
	}

	public String getPrecName() {
		return precName;
	}

	public void setPrecName(String precName) {
		this.precName = precName;
	}

	public String getPrecCourt() {
		return precCourt;
	}

	public void setPrecCourt(String precCourt) {
		this.precCourt = precCourt;
	}

	public String getPrecType() {
		return precType;
	}

	public void setPrecType(String precType) {
		this.precType = precType;
	}

	public String getPrecDate() {
		return precDate;
	}

	public void setPrecDate(String precDate) {
		this.precDate = precDate;
	}
	
	

}
