package kr.or.ddit.prod.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.IProdDaoImpl;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;

public class IProdServiceImpl implements IProdService{
	
	private static IProdService service;
	private IProdDao dao;
	
	public static IProdService getInstance() { 
		if(service == null){
			service = new IProdServiceImpl();
		}
		return service;
		
	}

	private IProdServiceImpl() {
		dao = IProdDaoImpl.getInstance();
		
	}

	@Override
	public ProdVO prodInfo(Map<String, String> params) {
		ProdVO prodInfo = null;
		
		try {
			prodInfo = dao.prodInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return prodInfo;
	}

	@Override
	public List<ProdVO> prodList(Map<String, String> params) {
		List<ProdVO> prodList = null;
		
		try {
			prodList = dao.prodList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return prodList;
	}

	@Override
	public void deleteProdInfo(Map<String, String> params) {
		
		try {
			dao.deleteProdInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateProdInfo(ProdVO prodInfo) {
		
		try {
			dao.updateProdInfo(prodInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertProdInfo(ProdVO prodInfo) {
		
		try {
			dao.insertProdInfo(prodInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<LprodVO> lprodList() {
		List<LprodVO> lprodList = null;
		
		try {
			lprodList = dao.lprodList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lprodList;
	}
	
}
