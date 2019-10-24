package com.itwill.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwill.dao.BoardDAO;
import com.itwill.domain.BoardBean;
import com.itwill.domain.BoardCommentBean;
import com.itwill.domain.FileSettingBean;
import com.itwill.domain.JsonDataBean;
import com.itwill.domain.PageBean;

@Service
public class BoardServceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;
	@Inject
	private UtilService util;
	
	private ObjectMapper mapper = new ObjectMapper();

	public int write(BoardBean bb) {
		int result = boardDAO.write(bb);
//		if(result==1) {
//		 result = boardDAO.getSeq();
//		}
		return result;
	}

	// Ajax 로 데이터 가져오기
	@Override
	public String getAjaxData(Map<String, Object> map) throws JsonProcessingException {
		System.out.println("BoardServiceImpl getAjaxData!!!");
		JsonDataBean json = new JsonDataBean();
		String jsonStr="";
		
		// paramData 데이터를 Map 형식으로 리턴
		//Map<String, Object> map = util.getMap(map);
		
		// 데이터 가져오기
		List<Object> list = new ArrayList<Object>();
		if(map.get("call_type")!=null) {
			
			if(map.get("call_type").equals("getRecommendCountUp")){
				String recommend = boardDAO.getRecommendCountUp(map);

				// 가져온 데이터를 JsonDataBean 객체에 할당
//				json = util.setJsonListData(list); // 이거 스트링으로ㅓ 변경 
				return recommend;
			}
			else if(map.get("call_type").equals("getRecommendCountDown")){
				String recommend = boardDAO.getRecommendCountDown(map);

				// 가져온 데이터를 JsonDataBean 객체에 할당
//				json = util.setJsonListData(list); // 이거 스트링으로ㅓ 변경 
				return recommend;
			}
			else if(map.get("call_type").equals("getGalleryRecommendCount")){
				String recommend = boardDAO.getGalleryRecommendCount(map);

				// 가져온 데이터를 JsonDataBean 객체에 할당
//				json = util.setJsonListData(list); // 이거 스트링으로ㅓ 변경 
				return recommend;
			}
			else if(map.get("call_type").equals("getLike")){
				String like = boardDAO.getLike(map);

				// 가져온 데이터를 JsonDataBean 객체에 할당
//				json = util.setJsonListData(list); // 이거 스트링으로ㅓ 변경 
				return like;
			}
			else if(map.get("call_type").equals("getHate")){
				String hate = boardDAO.getHate(map);

				// 가져온 데이터를 JsonDataBean 객체에 할당
//				json = util.setJsonListData(list); // 이거 스트링으로ㅓ 변경 
				return hate;
			}
			else if(map.get("call_type").equals("comDelete")){
				String recommend = boardDAO.comDelete(map);

				// 가져온 데이터를 JsonDataBean 객체에 할당
//				json = util.setJsonListData(list); // 이거 스트링으로ㅓ 변경 
				return recommend;
			}
			else if(map.get("call_type").equals("getHotList")){
				// 가져온 데이터를 JsonDataBean 객체에 할당
				list = boardDAO.getHotList(map);
				json = util.setJsonListData(list);
			}
			else if(map.get("call_type").equals("getNoticeList")){
				// 가져온 데이터를 JsonDataBean 객체에 할당
				list = boardDAO.getNoticeList(map);
				json = util.setJsonListData(list);
			}
		}
		
		// JsonBean 객체의 내용을 json 형식으로 변경
		jsonStr = mapper.writeValueAsString(json);
				
		return jsonStr;
	}

//	@Override
//	public List<BoardBean> getBoardList() {
//		List<BoardBean> boardList = boardDAO.getBoardList();
//		
//		return boardList;
//	}

	@Override
	public BoardBean getArticle(int seq) {
		BoardBean article = boardDAO.getArticle(seq);

		return article;
	}

	@Override
	public void fileUpload(FileSettingBean fs) {

		boardDAO.fileUpload(fs);

	}

	@Override
	public List<FileSettingBean> getFile() {

		return boardDAO.getFile();
	}

	@Override
	public List<BoardBean> getBoardFile(String board_id) {
		return boardDAO.getBoardFile(board_id);
	}

	@Override
	public List<BoardBean> getBoardList(PageBean pageBean) {
		pageBean.setCurrentPage(Integer.parseInt(pageBean.getPageNum()));
		pageBean.setStartRow((pageBean.getCurrentPage() - 1) * pageBean.getPageSize());

		return boardDAO.getBoardList(pageBean);
	}

	@Override
	public Integer getBoardCount(PageBean pageBean) {
		return boardDAO.getBoardCount(pageBean);
	}

	@Override
	public void updateReadcount(int seq) {
		boardDAO.updateReadcount(seq);

	}

	@Override
	public List<BoardBean> getSubBoard(PageBean pageBean) {
		return boardDAO.getSubBoard(pageBean);
	}

	@Override
	public int getSubBoardCount(String board_id, String etc1) {
		return boardDAO.getSubBoardCount(board_id, etc1);
	}

	@Override
	public int getBoardCount(String board_id) {
		return boardDAO.getBoardCount(board_id);
	}

	@Override
	public int delete(int seq) {

		return boardDAO.delete(seq);
	}

	@Override
	public List<FileSettingBean> getFileById(String regi_id) {
		return boardDAO.getFileById(regi_id);
	}

	@Override
	public List<BoardBean> getBoardFileById(String board_id, String regi_id) {
		return boardDAO.getBoardFileById(board_id, regi_id);
	}

	@Override
	public int filenameCheck(String filename) {
		return boardDAO.filenameCheck(filename);
	}
	
	@Override
	public void insertComment(BoardCommentBean commentBean) {
		boardDAO.insertComment(commentBean);
		
	}

	@Override
	public List<BoardCommentBean> getCommentList(int seq) {
		return boardDAO.getCommentList(seq);
	}


	@Override
	public List<BoardBean> getBoardListById(PageBean pageBean) {
		pageBean.setCurrentPage(Integer.parseInt(pageBean.getPageNum()));
		pageBean.setStartRow((pageBean.getCurrentPage() - 1) * pageBean.getPageSize());
		
		return boardDAO.getBoardListById(pageBean);
	}

	@Override
	public int getBoardCountById(PageBean pageBean) {
		return boardDAO.getBoardCountById(pageBean);
	}

	// 글수정
	@Override
	public int contentUpdate(BoardBean bb) {
		return boardDAO.contentUpdate(bb);
	}

	@Override
	public List<BoardBean> getMainList(Map<String, Object> map) {
		return boardDAO.getMainList(map);
	}

	@Override
	public List<FileSettingBean> getFileBySeq(int board_seq) {
		return boardDAO.getFileBySeq(board_seq);
	}
	
	@Override
	public int imageDeleteFromFS(int seq) {
		return boardDAO.imageDeleteFromFS(seq);
	}
	
	@Override
	public int imageDeleteFromBoard(int seq) {
		return boardDAO.imageDeleteFromBoard(seq);
	}

	@Override
	public List<BoardBean> getBoardFileByOrder(String string) {
		return boardDAO.getBoardFileByOrder(string);
	}	
	
	

}
