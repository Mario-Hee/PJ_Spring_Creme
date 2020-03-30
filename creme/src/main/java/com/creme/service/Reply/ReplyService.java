package com.creme.service.Reply;

import java.util.List;

import com.creme.domain.ReplyDTO;

public interface ReplyService {

	public List<ReplyDTO> list(int bno);
	
	//댓글 등록
	//비즈니스 로직
	//해당 게시글에 댓글을 등록하고,
	//해당 게시글의 리플 reply_cnt +1함
	public void replyinsert(ReplyDTO rDto);
	
	//댓글 삭제
	//게시글 댓글수 -1
	public void delete(int rno, int bno);
	
	
}
