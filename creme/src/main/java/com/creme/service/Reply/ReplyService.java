package com.creme.service.Reply;

import java.util.List;

import com.creme.domain.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> list(int bno);
	
	//댓글 등록
	public void reply_insert(ReplyDTO rDto);
	
	//댓글 삭제
	//게시글 댓글수 -1
	public void delete(int rno, int bno);
	
	
}
