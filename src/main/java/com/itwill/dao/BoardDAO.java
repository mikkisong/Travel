package com.itwill.dao;

import java.util.List;
import java.util.Map;

import com.itwill.domain.BoardBean;
import com.itwill.domain.BoardCommentBean;
import com.itwill.domain.FileSettingBean;
import com.itwill.domain.JsonDataBean;
import com.itwill.domain.PageBean;

public interface BoardDAO {
	public Integer maxNum();
	public int write(BoardBean bb);
	public List<BoardBean> getBoardList(PageBean pageBean);
	public BoardBean getArticle(int seq);
	public void fileUpload(FileSettingBean fs);
	public int getSeq();
	public List<FileSettingBean> getFile();
	public List<BoardBean> getBoardFile(String board_id);
	public Integer getBoardCount(PageBean pageBean);
	void updateReadcount(int seq);
	public List<BoardBean> getSubBoard(PageBean pageBean);
	public int getSubBoardCount(String board_id, String etc1);
	public int getBoardCount(String board_id);
	public int delete(int seq);
//	public String getRecommendCount(Map<String, Object> map);
	public List<Object> getHotList(Map<String, Object> map);
	List<Object> getNoticeList(Map<String, Object> map);
	public List<FileSettingBean> getFileById(String regi_id);
	public List<BoardBean> getBoardFileById(String board_id, String regi_id);
	public int filenameCheck(String filename);
	public void insertComment(BoardCommentBean commentBean);
	public List<BoardCommentBean> getCommentList(int seq);
	public String getRecommendCountUp(Map<String, Object> map);
	public String getRecommendCountDown(Map<String, Object> map);
	public String comDelete(Map<String, Object> map);
	public String getLike(Map<String, Object> map);
	public String getHate(Map<String, Object> map);
	public List<BoardBean> getBoardListById(PageBean pageBean);
	public int getBoardCountById(PageBean pageBean);
	public int contentUpdate(BoardBean bb);
	public List<BoardBean> getMainList(Map<String, Object> map);
	public List<FileSettingBean> getFileBySeq(int board_seq);
	String getGalleryRecommendCount(Map<String, Object> map);
	public int imageDeleteFromFS(int seq);
	public int imageDeleteFromBoard(int seq);
	public List<BoardBean> getBoardFileByOrder(String string);
}
