package kr.or.ddit.buyer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

public interface IBuyerDao {
	public List<BuyerVO> buyerList (String name) throws Exception;
	public BuyerVO buyerInfo(Map<String, String> params) throws Exception;
	public void deleteBuyerInfo(Map<String, String> params) throws Exception;
	public void updateBuyerInfo(BuyerVO buyerInfo)throws Exception;
	public void insertBuyerInfo(BuyerVO buyerInfo)throws Exception;
	public List<HashMap<BuyerVO, LprodVO>> buyerAllList() throws Exception;
	public List<LprodVO> lprodList() throws Exception;
}
