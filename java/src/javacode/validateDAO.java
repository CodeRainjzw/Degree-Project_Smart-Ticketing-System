package javacode;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;

public class validateDAO {
//generation part
	//this part is to generate a string which will be encoded by QR
	public static String generateString(String username,int ticketHash) throws Exception {
		wallet.extractUserWallet(username);
		String pubkey=wallet.keyMap.get(0);
		String encrypt=wallet.encryptByPrivateKey(String.valueOf(ticketHash));
		JsonObject jsonContainer =new JsonObject();
		jsonContainer.addProperty("encrypt", encrypt);
		jsonContainer.addProperty("pubkey", pubkey);
		return jsonContainer.toString();
	}
	
//---------------------------------------------------------------------------------------------	
	
//validation part
	//this is to process the QR which is generated in current time
	public static String modelOne(String json) throws Exception {
		JSONObject jsonobject = JSONObject.parseObject(json);
		String encrypt=jsonobject.getString("encrypt");//get encrypted String
		String pubkey=jsonobject.getString("pubkey");
		String decrypt;
		try {
			decrypt=wallet.decryptByPublicKey(encrypt,pubkey);//decrypt String by public key
		}
		catch(Exception e) {
			decrypt="null";
		}
		String info;
		try {
			info=ClientApp.main(new String[]{"queryTicket",decrypt});//search for ticket by ticket hash
		}
		catch(Exception e){
			return null;
		}
		deleteTicket(pubkey,decrypt);
		return info;
	}
	
	//this is to process the QR which is generated in previous time
	//clients need to provide the uname as the identity card number
	public static String modelTwo(String json,String identity) throws Exception {
		JSONObject jsonobject = JSONObject.parseObject(json);
		String encrypt=jsonobject.getString("encrypt");
		String pubkey=jsonobject.getString("pubkey");
		identity=md5.MD5(identity);
		String decrypt;
		try {
			decrypt=wallet.decryptByPublicKey(encrypt,pubkey);
		}
		catch(Exception e) {
			decrypt="null";
		}
		String info;
		try {
			info=ClientApp.main(new String[]{"queryTicket",decrypt});
		}
		catch(Exception e){
			return null;
		}
		System.out.println("identity："+identity);
		System.out.println("wallet.getOwner(info)："+wallet.getOwner(info));
		if(identity==wallet.getOwner(info)) {
			deleteTicket(pubkey,decrypt);
			return info;
		}
		else {
			return null;
		}
	}
	
	public static void deleteTicket(String pub,String hash) throws Exception {
		String uname=userDAO.getUnamebypubkey(pub);
		cancelDAO.deleteTicketstoUser(uname,Integer.valueOf(hash));
		ClientApp.main(new String[] {"deleteTicket",hash});
	}

	
	public static void generateQR(String username,int ticketHash) throws Exception {
		
		generateQRcode.generateQRcodePic(generateString(username,ticketHash), 300,300,"jpg",String.valueOf(ticketHash));
	}
	//the username above is provided by the login information in web
	
	
	
	//this is a test place
	public static void main(String arg[]) throws Exception {
		generateQR("mu",123456);
	}
}
