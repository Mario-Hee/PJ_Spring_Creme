package com.creme.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.creme.domain.ReplyDTO;

public interface ReplyDAO {
	
	public List<ReplyDTO> list(@Param("bno") int bno);
	
	//댓글 등록
	public void reply_insert(ReplyDTO rDto);
	
	//댓글 등록시 해당 게시글 댓글 수 +1	
	public void replyCntPlus(@Param("bno") int bno);
}
