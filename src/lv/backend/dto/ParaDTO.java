package lv.backend.dto;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ParaDTO {
	
	private String paraContent;
	private Elements subs;
	private List<SubDTO> sublist = new ArrayList<>();
	
	public ParaDTO(String paraContent, Elements subs) {
		super();
		this.paraContent = paraContent;
		this.subs = subs;
		this.sublist = this.getSubList();
	}
	public String getParaContent() {
		return paraContent;
	}
	public void setParaContent(String paraContent) {
		this.paraContent = paraContent;
	}
	public Elements getSubs() {
		return subs;
	}
	public void setSubs(Elements subs) {
		this.subs = subs;
	}
	
	
	
	public List<SubDTO> getSublist() {
		return sublist;
	}
	public void setSublist(List<SubDTO> sublist) {
		this.sublist = sublist;
	}
	public List<SubDTO> getSubList(){
		
		List<SubDTO> sublist = new ArrayList<>();
		
		for(Element s : this.subs) {
			
			String subContent = s.select("호내용").text();
			Elements items = s.select("목내용");
			sublist.add(new SubDTO(subContent, items));
			
		}
		
		return sublist;
		
	}

	
	
}
