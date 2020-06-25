package kr.or.ddit.prod.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;


public class IProdDaoImpl implements IProdDao{
	
	private static IProdDao dao;
	
	private SqlMapClient smc;
	
	public static IProdDao getInstance() {
		if(dao == null) {
			dao = new IProdDaoImpl();
			
		}
		return dao;
		
	}
	
	public IProdDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}

	@Override
	public ProdVO prodInfo(Map<String, String> params) throws Exception {
		
		return (ProdVO) smc.queryForObject("prod.prodInfo", params);
	}

	@Override
	public List<ProdVO> prodList(Map<String, String> params) throws Exception {
		
		return smc.queryForList("prod.prodList", params);
	}

	@Override
	public void deleteProdInfo(Map<String, String> params) throws Exception {
		
		smc.update("prod.deleteProd", params);
		
	}

	@Override
	public void updateProdInfo(ProdVO prodInfo) throws Exception {
		
		smc.update("prod.updateProd", prodInfo);
		
	}

	@Override
	public void insertProdInfo(ProdVO prodInfo) throws Exception {
		smc.insert("prod.insertProd", prodInfo); 
		
	}

	@Override
	public List<LprodVO> lprodList() throws Exception {
		
		return smc.queryForList("prod.lprodList");
	}
	
	 
}
