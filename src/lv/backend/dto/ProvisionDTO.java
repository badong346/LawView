package lv.backend.dto;

import java.util.List;

public class ProvisionDTO {
	
	private int proId; // 조문 번호
	private String proName; // 조문 이름
	private String proContent; // 조문 내용
	private List<ParaDTO> paras;
	
	public ProvisionDTO(int proId, String proName, String proContent, List<ParaDTO> paras) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.proContent = proContent;
		this.paras = paras;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
	}
	public List<ParaDTO> getParas() {
		return paras;
	}
	public void setParas(List<ParaDTO> paras) {
		this.paras = paras;
	}
	
	

	
}
