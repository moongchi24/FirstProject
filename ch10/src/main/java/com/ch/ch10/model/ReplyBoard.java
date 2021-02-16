package com.ch.ch10.model;
import java.sql.Date;
import lombok.Data;
@Data
public class ReplyBoard {
	private int rno;          // 자동 1씩 증가
	private int bno;          // 원 게시글 번호
	private String replytext; // 답글
	private String replyer;   // 답글 작설자
	private Date regdate;     // 작성일
	private Date updatedate;  // 수정일
	private String del;       // 삭제 여부
}