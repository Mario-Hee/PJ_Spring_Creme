package com.creme.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.creme.domain.ReplyDTO;

public interface ReplyDAO {
	
	//목록 페이지 나누기
	public List<ReplyDTO> list(@Param("bno") int bno);
	
	//댓글 등록
	public void replyinsert(ReplyDTO rDto);
	
	//댓글 등록시 해당 게시글 댓글 수 +1	
	public void replyCntPlus(@Param("bno") int bno);

	//댓글 삭제
	public void delete(@Param("rno") int rno);
	
	//게시글 댓글 -1
	public void replyCntUpdate(@Param("map") HashMap<String, Object>map);

}
