package kr.or.ddit.freeboard.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.freeboard.dao.IFreeboardDAO;
import kr.or.ddit.freeboard.dao.IFreeboardDAOImpl;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardVO;
import sun.security.jca.GetInstance;

public class IFreeboardServiceImpl implements IFreeboardService {
	
	private static IFreeboardService service = new IFreeboardServiceImpl();
	private IFreeboardDAO freeboardDAO;
	private SqlMapClient smc;
	private IFileItemDAO fileitemDAO;
	
	private IFreeboardServiceImpl() {
		freeboardDAO = IFreeboardDAOImpl.getInstance();
		fileitemDAO = IFileItemDAOImpl.getInstance();
	}
	
	public static IFreeboardService getInstance() {
		return(service == null) ? service = new IFreeboardServiceImpl() : service;
	}

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) {
		List<FreeboardVO> freeboardList = null;
		try {
		freeboardList = freeboardDAO.freeboardList(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeboardList;
	}

	@Override
	public String insertFreeboard(FreeboardVO freeboardInfo, FileItem[] items) {
		String bo_no = null;
		try {
		bo_no = freeboardDAO.insertFreeboard(freeboardInfo);
		List<FileItemVO> fileItemList =  AttachFileMapper.mapper(items, bo_no);
		fileitemDAO.insertFileItem(fileItemList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bo_no;
	}
	@Override
	public String insertFreeboardReply(FreeboardVO freeboardInfo) {
		String bo_no = null;
		try {
			bo_no = freeboardDAO.insertFreeboardReply(freeboardInfo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bo_no;
	}

	@Override
	public FreeboardVO freeboardInfo(Map<String, String> params) {
		FreeboardVO freeboardInfo = null;
		try {
		freeboardInfo = freeboardDAO.freeboardInfo(params);
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return freeboardInfo;
	}

	@Override
	public void deleteFreeboard(Map<String, String> params) {
		
		try {
			freeboardDAO.deleteFreeboard(params);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public void updateFreeboard(FreeboardVO freeboardInfo) {
		try {
			freeboardDAO.updateFreeboard(freeboardInfo);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	

}
