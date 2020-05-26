package lv.backend.dto;

public class QuestionDTO {
	private int seq;
	private String title;
	private String answer;

	public QuestionDTO() {}

	public QuestionDTO(int seq, String title, String answer) {
		super();
		this.seq = seq;
		this.title = title;
		this.answer = answer;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}