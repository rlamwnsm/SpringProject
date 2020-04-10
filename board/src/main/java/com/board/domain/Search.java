package com.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Search {
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
}
