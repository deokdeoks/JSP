package kr.or.ddit.zipcode.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;
import kr.or.ddit.zipcode.dao.IZipcodeDAO;
import kr.or.ddit.zipcode.dao.IZipcodeDAOImpl;

public class IZipcodeServiceImpl implements IZipcodeService {
	
	private static IZipcodeService service = new IZipcodeServiceImpl();
	
	private IZipcodeDAO dao;
	
	private IZipcodeServiceImpl() {
		dao =  IZipcodeDAOImpl.getInstance();
	}
	public static IZipcodeService getInstance() {
		
		return(service == null) ? service = new IZipcodeServiceImpl() : service;
		
	}

	@Override
	public List<ZipcodeVO> zipcodeList(Map<String, String> params) {
			List<ZipcodeVO> zipcodeList = null;
			try {
				zipcodeList =dao.zipcodeList(params);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return zipcodeList;
	}

}
