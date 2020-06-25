package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FileItemVO;

public class IFileItemDAOImpl implements IFileItemDAO {
	private static IFileItemDAO dao = new IFileItemDAOImpl();
	private SqlMapClient smc;
	
	
	private IFileItemDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFileItemDAO getInstance() {
		return (dao == null) ? dao = new IFileItemDAOImpl() : dao;
	}
	@Override
	public void insertFileItem(List<FileItemVO> fileItemList) throws Exception {
		try {
			// iBatis 트랜잭션
			// Commit : startTransaction() => 쿼리 질의 (전체 성공)
			//			=> commitTransaction()
			//			=> endTransaction();
			//	Rollback : startTransaction() => 쿼리 질의 (일부 성공 후 에러)
			//			=> smc.endTransaction();
			smc.startTransaction();
		for(FileItemVO fileItemInfo : fileItemList) {
			smc.insert("fileitem.insertFileItem", fileItemInfo);
		}
			smc.commitTransaction();
		}finally {
			smc.endTransaction();
		}
		
	

	}

	@Override
	public FileItemVO fileitemInfo(Map<String, String> params) throws Exception {
		return (FileItemVO) smc.queryForObject("fileitem.fileitemInfo", params);
		}

}
