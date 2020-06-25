package kr.or.ddit.prod.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public interface IProdService {
	
	public ProdVO prodInfo(Map<String, String> params); 
	public List<ProdVO> prodList(Map<String, String> params);
	public void deleteProdInfo(Map<String, String> params);
	public void updateProdInfo(ProdVO prodInfo);
	public void insertProdInfo(ProdVO prodInfo);
	public List<LprodVO> lprodList();


}
