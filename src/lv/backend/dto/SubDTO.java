package lv.backend.dto;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SubDTO {
	
	private String subContent;
	private Elements items;
	private String itemlist;
	
	public SubDTO(String subContent, Elements items) {
		super();
		this.subContent = subContent;
		this.items = items;
		this.itemlist = this.getItemList();
	}

	public String getSubContent() {
		return subContent;
	}

	public void setSubContent(String subContent) {
		this.subContent = subContent;
	}

	public Elements getItems() {
		return items;
	}

	public void setItems(Elements items) {
		this.items = items;
	}
	
	public String getItemlist() {
		return itemlist;
	}

	public void setItemlist(String itemlist) {
		this.itemlist = itemlist;
	}

	public String getItemList() {
		
		StringBuilder sb = new StringBuilder();
		
		for(Element i : items) {
			sb.append(Jsoup.parse(i.text()) + "<br>");
		}
		
		return sb.toString();
		
	}
	

}
