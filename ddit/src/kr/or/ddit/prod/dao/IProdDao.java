package kr.or.ddit.prod.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public interface IProdDao {
	
	public ProdVO prodInfo(Map<String, String> params) throws Exception;
	public List<ProdVO> prodList(Map<String, String> params) throws Exception;
	public void deleteProdInfo(Map<String, String> params) throws Exception;
	public void updateProdInfo(ProdVO prodInfo)throws Exception;
	public void insertProdInfo(ProdVO prodInfo)throws Exception;
	public List<LprodVO> lprodList() throws Exception;
	

}
