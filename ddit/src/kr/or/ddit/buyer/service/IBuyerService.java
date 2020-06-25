package kr.or.ddit.buyer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

public interface IBuyerService {
	public List<BuyerVO> buyerList (String name);

	public BuyerVO buyerInfo(Map<String, String> params);
	public void deleteBuyerInfo(Map<String, String> params) ;
	public void updateBuyerInfo(BuyerVO buyerInfo);
	public void insertBuyerInfo(BuyerVO buyerInfo);
	public List<HashMap<BuyerVO, LprodVO>> buyerAllList();
	public List<LprodVO> lprodList();
}
