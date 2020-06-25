package kr.or.ddit.utiles;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

public class CryptoGenerator {
   //암복호화를 하기 위해서 공개 키 + 비밀 키를 같이 만듦 (생성 시 동반생성, 1회활용 후 폐기)
   //반환값 : 공개키(가수부, 지수부 구분 저장 후 반환)
   //파라미터 : 비밀 키 세션 저장 
   
   public static Map<String, String> generatePairKey(HttpSession session){
      //공개키  + 비밀키 생성 
      KeyPairGenerator keyGenerator = null;
      //생성된 공개키 + 비밀키 취득 
      KeyPair keyPair = null;
      //공개키 취득
      PublicKey publicKey = null;
      //비밀키 취득
      PrivateKey privateKey = null;
      
      //공개키 = 가수부 + 지수부 
      KeyFactory keyFactory = null;
      
      Map<String, String> publicKeyMap = new HashMap<String, String>();
      
      try{
         keyGenerator = KeyPairGenerator.getInstance("RSA");
         //공개키 , 비밀 키 생성시 사이즈 설정 : byte단위 짝수 설정 
         keyGenerator.initialize(2048);
         //생성된 공개키, 비밀키 취득 
         keyPair = keyGenerator.generateKeyPair();
         //공개키 취득 
         publicKey = keyPair.getPublic();
         //비밀키 취득 
         privateKey = keyPair.getPrivate();
         //세션에 비밀키저장 
         session.setAttribute("privateKey", privateKey);
         
         //공개키(Double Type) : 가수부 + 지수부 => 클라이언트에 제공 
         //-143.12344556 
         //float(32bit 단정도 소수) : 부호비트 1bit(양수0 | 음수1) + 지수 8bit(소숫점 자릿수) + 가수 23bit(실수 표현)
         //double(64bit 배정도 소수) : 부호비트 1bit(양수0 | 음수1) + 지수 11bit(소숫점 자릿수) + 가수 52bit(실수 표현)
         keyFactory = keyFactory.getInstance("RSA");
         
         RSAPublicKeySpec publicKeySpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
         
         //공개 키의 가수부 
         String publicModulus = publicKeySpec.getModulus().toString(16);
         //공개 키의 지수부 
         String publicExponent = publicKeySpec.getPublicExponent().toString(16);
         
         publicKeyMap.put("publicModulus", publicModulus);
         publicKeyMap.put("publicExponent", publicExponent);
         
      }catch(NoSuchAlgorithmException e1){
         e1.printStackTrace();
      }catch(InvalidKeySpecException e2){
         e2.printStackTrace();
      }
      return publicKeyMap;
   }
   
   //암호문을 평문으로 복호화 
   public static String decyptRSA(HttpSession session, 
                           String secureValue){
      String returnValue = "";
      PrivateKey privateKey = (PrivateKey) session.getAttribute("privateKey");
      try {
         Cipher cipher = Cipher.getInstance("RSA");
         cipher.init(Cipher.DECRYPT_MODE, privateKey);
         
         //암호문은 짝수 단위로 바이너리 코드로 존재 
         byte[] targetByte = hextoByteArray(secureValue);
         byte[] beforeString = cipher.doFinal(targetByte);
         
         returnValue = new String(beforeString, "UTF-8");
      } catch (NoSuchAlgorithmException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (NoSuchPaddingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (InvalidKeyException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IllegalBlockSizeException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (BadPaddingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (UnsupportedEncodingException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return returnValue;
   }
   

   //암호문이 널이거나 짝수가 아니면 암호문이 암호화 에러 
   private static byte[] hextoByteArray(String secureValue) {
      if(secureValue == null || secureValue.length()%2 != 0){
         return new byte[]{};
      }
      byte[] bytes = new byte[secureValue.length()/2];
      
      for(int i=0; i<secureValue.length(); i+=2){
         byte value = (byte)Integer.parseInt(secureValue.substring(i, i+2), 16);
         bytes[(int)Math.floor(i/2)] = value; 
      }
      return bytes;
   }
}