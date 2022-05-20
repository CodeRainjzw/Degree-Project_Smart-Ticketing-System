package javacode;


import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class md5 {

    public static String MD5(String data) {
    	data=data+"add_salt";//add salt
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] md5 = md.digest(data.getBytes(StandardCharsets.UTF_8));

            // 将字节数据转换为十六进制
            for (byte b : md5) {
                sb.append(Integer.toHexString(b & 0xff));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String password = "123237";
        String md5HexStr = MD5(password);
        System.out.println("==> MD5 加密前: " + password);
        System.out.println("==> MD5 加密后: " + md5HexStr);
    }
}
