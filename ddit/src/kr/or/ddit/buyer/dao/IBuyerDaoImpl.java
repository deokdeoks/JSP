package kr.or.ddit.buyer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

public class IBuyerDaoImpl implements IBuyerDao {

	private static IBuyerDao dao = new IBuyerDaoImpl();
	private SqlMapClient client;
	private IBuyerDaoImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
		
	}
	public static IBuyerDao getInstance() {
	return (dao == null) ? dao = new IBuyerDaoImpl() : dao;
}
	
	@Override
	public List<BuyerVO> buyerList(String name) throws Exception {
		
		return client.queryForList("buyer.buyerList", name);
	}
	@Override
	public BuyerVO buyerInfo(Map<String, String> params) throws Exception {
		
		return (BuyerVO) client.queryForObject("buyer.buyerInfo", params);
	}
	@Override
	public void deleteBuyerInfo(Map<String, String> params) throws Exception {
	
		client.update("buyer.deleteBuyer", params);
		
	}
	@Override
	public void updateBuyerInfo(BuyerVO buyerInfo) throws Exception {
		
		client.update("buyer.updateBuyer", buyerInfo);
		
	}
	@Override
	public void insertBuyerInfo(BuyerVO buyerInfo) throws Exception {
		
		client.insert("buyer.insertBuyer", buyerInfo);
		
	}
	@Override
    public List<HashMap<BuyerVO, LprodVO>> buyerAllList() throws Exception {
		
		return client.queryForList("buyer.buyerAllList");
	}
	@Override
	public List<LprodVO> lprodList() throws Exception {
		
		return client.queryForList("buyer.lprodList");
	}
	

}
