package kr.or.ddit.buyer.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.dao.IBuyerDaoImpl;

import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;

public class IBuyerServiceImpl implements IBuyerService{
   // 싱글톤 패턴
      private static IBuyerService service;
      private IBuyerDao dao;

      public static IBuyerService getInstance() {
         if (service == null) {
            service = new IBuyerServiceImpl();
         }
         return service;
      }

      private IBuyerServiceImpl() {
         dao = IBuyerDaoImpl.getInstance();
      }




   @Override
   public List<BuyerVO> buyerList(String name) {
      List<BuyerVO> list = new ArrayList<BuyerVO>();
      try{
         list = dao.buyerList(name);
      }catch (Exception e){
         e.printStackTrace();
      }
      return list;
   }

@Override
public BuyerVO buyerInfo(Map<String, String> params) {
	BuyerVO buyerInfo = null;
	
	try {
		buyerInfo = dao.buyerInfo(params);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return buyerInfo;
}

@Override
public void deleteBuyerInfo(Map<String, String> params) {
	
	try {
		dao.deleteBuyerInfo(params);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

@Override
public void updateBuyerInfo(BuyerVO buyerInfo) {
	
	try {
		dao.updateBuyerInfo(buyerInfo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

@Override
public void insertBuyerInfo(BuyerVO buyerInfo) {
	try {
		dao.insertBuyerInfo(buyerInfo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

@Override
public List<HashMap<BuyerVO, LprodVO>> buyerAllList() {
	  List<HashMap<BuyerVO, LprodVO>> list = null;
      try{
         list = dao.buyerAllList();
      }catch (Exception e){
         e.printStackTrace();
      }
      return list;
   }

@Override
public List<LprodVO> lprodList() {
	List<LprodVO> lprodList = null;
	
		try {
			lprodList = dao.lprodList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return lprodList;
}

}