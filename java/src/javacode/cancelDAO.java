package javacode;

import java.sql.*;
import java.time.Year;

public class cancelDAO {
	//make the ticket can be sold
	public static void setTicketStatustobeone(int seatnum,String ename) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE ticket SET status = 1 where (seat=? AND ename=?)");
			ps.setInt(1, seatnum);
			ps.setString(2, ename);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void increaseBalanceaftercancel(float num,String uname) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE user SET balance = balance+? -1 where uname=?");
			ps.setFloat(1, num);
			ps.setString(2, uname);
			ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void deleteTicketstoUser(String uname,int hash) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE from tickets where (uname=? AND tickets=?)");
			ps.setString(1, uname);
			ps.setInt(2, hash);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static String getPubkey(String uname){
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT pubkey FROM user where uname='"+uname+"'");
			rs.next();
			String pubkey=rs.getString("pubkey");
			rs.close();
			st.close();
			conn.close();
			return pubkey;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void cancelTicket(String uname,String ename,int seat,int hash,float price,String ciphertext, String pubkey) throws Exception {
		String info=ClientApp.main(new String[] {"queryTicket",String.valueOf(hash)});
		String ID=wallet.getTicketID(info);
		String de=wallet.decryptByPublicKey(ciphertext,pubkey);
		if(de.indexOf("Cancel")!=-1) {
			String dehash=wallet.decryptByPublicKey(ID,pubkey);
			if(dehash.equals(String.valueOf(hash))) {
				//pass the check
				setTicketStatustobeone(seat,ename);
				increaseBalanceaftercancel(price,uname);
				deleteTicketstoUser(uname,hash);
				System.out.println("The step over the Cancel!!");
				try {
					ClientApp.main(new String[] {"deleteTicket",String.valueOf(hash)});

				}catch (Exception e){

				}

			}
			else{
				System.out.println("error");
			}
		}else{
			System.out.println("error");
		}

	}

}
