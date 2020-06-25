package kr.or.ddit.zipcode.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipcodeVO;


public class IZipcodeDAOImpl implements IZipcodeDAO{
	private static IZipcodeDAO dao = new IZipcodeDAOImpl();
	private SqlMapClient client;
	private IZipcodeDAOImpl() {
		client = SqlMapClientFactory.getSqlMapClient();
		
	}
	public static IZipcodeDAO getInstance() {
		return (dao == null) ? dao = new IZipcodeDAOImpl() : dao;
		
	}
	
	
	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params) throws Exception {
		
		return client.queryForList("zipcode.zipcodeList", params);
	}

}
