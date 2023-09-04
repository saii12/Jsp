package kr.co.farmstory2.service;

import java.util.List;


import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dto.ArticleDTO;

public enum ArticleService {
	
	instance;
	
	private ArticleDAO dao = new ArticleDAO();

	public void insertArticle() {
		dao.insertArticle();
	}
	public ArticleDTO selectArticle(ArticleDTO dto) {
		return dao.selectArticle(dto);
	}
	public List<ArticleDTO> selectArticles(int no) {
		return dao.selectArticles(no);
	}
	public void updateArticle(ArticleDTO dto) {
		dao.updateArticle(dto);
	}
	public void deleteArticle(int no) {
		dao.deleteArticle(no);
	}
}
