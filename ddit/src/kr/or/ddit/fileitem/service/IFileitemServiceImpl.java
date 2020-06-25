package kr.or.ddit.fileitem.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.vo.FileItemVO;
import sun.security.jca.GetInstance;

public class IFileitemServiceImpl implements IFileItemService, IFileItemDAO {
	private static IFileItemService service = new IFileitemServiceImpl();
	private IFileItemDAO dao;
	
	
	private IFileitemServiceImpl() {
		dao = IFileItemDAOImpl.getInstance();
	}
	public static IFileItemService getInstance() {
		return(service == null) ? service = new IFileitemServiceImpl() : service;
	}
	
	@Override
	public void insertFileItem(List<FileItemVO> fileItemList) {
		

	}

	@Override
	public FileItemVO fileitemInfo(Map<String, String> params) {
		FileItemVO fileitemInfo = null;
		try {
			fileitemInfo = dao.fileitemInfo(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileitemInfo;
	}

}
