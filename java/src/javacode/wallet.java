package javacode;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import org.apache.commons.codec.binary.Base64;
import com.google.gson.JsonObject;
import com.alibaba.fastjson.JSONObject;

public class wallet {
	public static Map<Integer, String> keyMap = new HashMap<Integer, String>();  //to store the pub and priv key
	public static String data = "12345";
	//a demo of the key
	private static String publicKeyStr = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/OpVr+aQu6B3stSUgsLcZWpaxatset8zTqat1FF543hoECcTnRqDXKwfX09J+RLCc/1fbITt0s4wUUwJNU7lKJSTGZp5/xHcEiFJjTa+XY6pQHQKvvZjAQMkyzC3H5tmaNTapKYJOAWw7u1dxcRNFdD3k5E+EiqSnlo30u7SLCwIDAQAB";
	private static String privateKeyStr = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAL86lWv5pC7oHey1JSCwtxlalrFq2x63zNOpq3UUXnjeGgQJxOdGoNcrB9fT0n5EsJz/V9shO3SzjBRTAk1TuUolJMZmnn/EdwSIUmNNr5djqlAdAq+9mMBAyTLMLcfm2Zo1Nqkpgk4BbDu7V3FxE0V0PeTkT4SKpKeWjfS7tIsLAgMBAAECgYBicjt4geV3TIITWVJK2Q76G3vWzIcP8lmdYgzl0l2sZdMI3yqiUeb9vqZkAyWrYZt2x7GoGxyrwL9Nu0pFGuQZFaZIrHRj6LoNq/dgGUpN5zviXUDq2RrhhP7dW4Zc2UbbZqtTzn4jgv8/dviT+LACBmbavojjbb6YZHO/YDml2QJBAPWWu7SkyqfHSDOBBYWyI0GON2ApqTOIsENpQ572IvjNzT8TcXsNRr1hy4o5JfJN4KutBSsJkxAv3+nCc7pvRo0CQQDHVefkgjyuCyQjTtm8WPeIP7Ny8Rul44SmoyaSOANiPufsjIAPvxtNwyvkyUKtI7AMx6XrAWltRMWWiByVH533AkBp87fTfWz46V7a6YTqYyoWtDZrxE19MDFrQ9SqleIMmS09UzQYNGgaeECJx5H5cWPGbQTXxm+uAhmGDiBDhJJZAkEAu84SR1b1OL1CdQmrVyszPGlX9ul3NRphNmbsxkKD3aKK/HF7jlptrRw/VLTSXzIKgl/v0LRp0gtDZgojc9RwDQJBAJ2d0E9huqG9yP0bA9q0lIFwqJogLnoRvQCkNW6hATUrA5b7lrZYniPbwRfSALW2jgweTeTaeouPBHPWbVz/ws8=";


	private static void generateKeyPair() throws NoSuchAlgorithmException {
		KeyPairGenerator keyPairGenerator;
		keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		keyPairGenerator.initialize(1024);//1024 bits long
		KeyPair keyPair = keyPairGenerator.generateKeyPair();
		PublicKey publicKey = keyPair.getPublic();
		publicKeyStr = new String(Base64.encodeBase64(publicKey.getEncoded()));
		PrivateKey privateKey = keyPair.getPrivate();
		privateKeyStr = new String(Base64.encodeBase64(privateKey.getEncoded()));
		keyMap.put(0, publicKeyStr); //pub
		keyMap.put(1, privateKeyStr);//private
	}

	private static PublicKey getPublicKey(String publicKey) throws Exception {
		byte[] keyBytes = Base64.decodeBase64(publicKey);
		X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		return keyFactory.generatePublic(keySpec);
	}


	private static PrivateKey getPrivateKey(String privateKey) throws Exception {
		byte[] keyBytes = Base64.decodeBase64(privateKey);
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		return keyFactory.generatePrivate(keySpec);
	}

	public static String encryptByPublicKey(String content,String pub) throws Exception {
		PublicKey publicKey = getPublicKey(pub);
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] cipherText = cipher.doFinal(content.getBytes());
		String cipherStr = new String(Base64.encodeBase64(cipherText));
		return cipherStr;
	}

	public static String encryptByPrivateKey(String content) throws Exception {
		PrivateKey privateKey = getPrivateKey(keyMap.get(1));//the key is got by keyMap
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, privateKey);
		byte[] cipherText = cipher.doFinal(content.getBytes());
		String cipherStr = new String(Base64.encodeBase64(cipherText));
		return cipherStr;
	}

	public static String decryptByPrivateKey(String content) throws Exception {
		PrivateKey privateKey = getPrivateKey(keyMap.get(1));//the key is got by keyMap
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] cipherText = Base64.decodeBase64(content);
		byte[] decryptText = cipher.doFinal(cipherText);
		return new String(decryptText);
	}

	public static String decryptByPublicKey(String content,String pub) throws Exception {
		PublicKey publicKey = getPublicKey(pub);//the key is got by input String
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, publicKey);
		byte[] cipherText = Base64.decodeBase64(content);
		byte[] decryptText = cipher.doFinal(cipherText);
		return new String(decryptText);
	}

	public static int ticketHash(ticket t) {
		JsonObject jsonContainer =new JsonObject();
		jsonContainer.addProperty("ename", t.getEname());
		jsonContainer.addProperty("position", t.getSeat());
		return jsonContainer.hashCode();
	}

	public static String getTicketID(String jsonStr) {
		JSONObject jsonobject = JSONObject.parseObject(jsonStr );
		String s = jsonobject.getString("iD");
		return s;
	}

	public static String getTicketPrice(String jsonStr) {
		JSONObject jsonobject = JSONObject.parseObject(jsonStr );
		String s = jsonobject.getString("price");
		return s;
	}

	public static String getTicketSeat(String jsonStr) {
		JSONObject jsonobject = JSONObject.parseObject(jsonStr );
		String s = jsonobject.getString("position");
		return s;
	}

	public static String getTicketename(String jsonStr) {
		JSONObject jsonobject = JSONObject.parseObject(jsonStr );
		String s = jsonobject.getString("name");
		return s;
	}

	public static String getOwner(String jsonStr) {
		JSONObject jsonobject = JSONObject.parseObject(jsonStr );
		String s = jsonobject.getString("owner");
		return s;
	}

	public static String ticketInfo(int seatnum, String ename,float price,String vname,String address,String etime) {
		JsonObject jsonContainer =new JsonObject();
		jsonContainer.addProperty("seatnum", seatnum);
		jsonContainer.addProperty("ename", ename);
		jsonContainer.addProperty("price", price);
		jsonContainer.addProperty("vname", vname);
		jsonContainer.addProperty("address", address);
		jsonContainer.addProperty("etime", etime);
		return jsonContainer.toString();
	}

	//the registerUser() is used when a user registers
	public static String registerUser(String username) throws NoSuchAlgorithmException, IOException {
		createUserWallet(username);
		return wallet.keyMap.get(0);

	}

	public static void createUserWallet(String username) throws IOException, NoSuchAlgorithmException {
		String directory = "G:\\JZW\\STUDY\\2022_Spring\\Project\\DPworkspace\\java\\wallet";
		String filename = username+".txt";

		File file = new File(directory);
		if (!file.exists()) {
			file.mkdirs();
		}
		File file2 = new File(directory, filename);
		if (!file2.exists()) {
			try {
				file2.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		FileOutputStream fos = new FileOutputStream(directory + "\\" + filename);
		generateKeyPair();
		String str = keyMap.get(0) + "\n" +keyMap.get(1);
		byte[] bytes = str.getBytes();
		fos.write(bytes);
		fos.close();
	}

	//extractUserWallet() is to put the key in wallet into the keyMap
	public static void extractUserWallet(String username) throws IOException {
		File file = new File("G:\\JZW\\STUDY\\2022_Spring\\Project\\DPworkspace\\java\\wallet\\"+username+".txt");
		BufferedReader br = new BufferedReader(new FileReader(file));
		String str1=null;
		String str2=null;
		str1 = br.readLine();
		keyMap.put(0, str1);
		System.out.println("public key is: "+ str1);
		str2 = br.readLine();
		keyMap.put(1, str2);
		System.out.println("private key is: "+ str2);
		br.close();
	}

	//this is a test place
	public static void main(String[] args) throws Exception {
		String a="123456";
		wallet.extractUserWallet("lst");
		System.out.print(wallet.encryptByPublicKey(a,wallet.keyMap.get(0)));


	}

	public static String getValuebyKey(String jsonStr,String key) {
		JSONObject jsonobject = JSONObject.parseObject(jsonStr );
		String s = jsonobject.getString(key);
		return s;
	}

	public static String changeValue(String json,String key,String value) {
		JSONObject jsonContainer = JSONObject.parseObject(json );
		jsonContainer.put(key, value);
		return jsonContainer.toString();
	}


}
