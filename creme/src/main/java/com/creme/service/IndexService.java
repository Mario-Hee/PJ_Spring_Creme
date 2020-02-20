package com.creme.service;

import java.util.List;

import com.creme.domain.ProductDTO;

public interface IndexService {
	// 베스트상품을 5건 출력
	public List<ProductDTO> bestPdtList();
	
	// 신상품을 5건 출력
	public List<ProductDTO> newPdtList();
}
