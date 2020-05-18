package lv.backend.dto;

public class FileDTO {
	private int seq;
	private String sysFileName;
	private String oriFileName;
	private int parent_seq;
	public FileDTO() {}
	public FileDTO(int seq, String sysFileName, String oriFileName, int parent_seq) {
		this.seq = seq;
		this.sysFileName = sysFileName;
		this.oriFileName = oriFileName;
		this.parent_seq = parent_seq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSysFileName() {
		return sysFileName;
	}
	public void setSysFileName(String sysFileName) {
		this.sysFileName = sysFileName;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
}
