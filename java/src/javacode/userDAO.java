package javacode;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javacode.wallet;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class userDAO {
	//log-in:
	public static user Login(String uname, String password) {
		Connection conn=null;
		try {
			conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM user WHERE uname='"+uname+"' AND password='"+password+"'");
			if(rs.next()) {
				String uname1 = rs.getString("uname");
				String password1 = rs.getString("password");
				String pubkey=rs.getString("pubkey");
				float balance =rs.getFloat("balance");
                String identitynum=rs.getString("identitynum");
				user u = new user(uname1,password1,pubkey,balance,identitynum);
				rs.close();
				st.close();
				conn.close();
				return u;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    //get the identitynum by uname
    public static String getIdentitynum (String uname){
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT identitynum FROM user where uname='"+uname+"' ");
            rs.next();
            String identitynum=rs.getString("identitynum");
            rs.close();
            st.close();
            conn.close();
            return identitynum;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }
	//get the tickets' information
	public static List <String> getTickets(String uname) {
		List<String> information = new ArrayList<String>();
		try{
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT info FROM tickets WHERE uname='"+uname+"' AND selling=0");
			while(rs.next()) {
				String info=rs.getString("info");
				information.add(info);
			}
			rs.close();
			st.close();
			conn.close();
			return information;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
    public static List <String> getmySellingTickets(String uname) {
        List<String> information = new ArrayList<String>();
        try{
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT info FROM tickets WHERE uname='"+uname+"' AND selling=1");
            while(rs.next()) {
                String info=rs.getString("info");
                information.add(info);
            }
            rs.close();
            st.close();
            conn.close();
            return information;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

	//register the user account
    public static boolean CreateUser(String uname,String password,String identity) throws Exception {
		  Connection conn = null;
		  try {
		   conn = JDBCTool.getConnection();
		   Statement st = conn.createStatement();
		   ResultSet rs = st.executeQuery("SELECT * FROM user WHERE uname='"+uname+"'");

		   if(rs.next()) {
		    return false;
		   }
		   else {
		    rs.close();
		    st.close();
		    String pub = wallet.registerUser(uname);
		    String i=md5.MD5(identity);

		    PreparedStatement ps = conn.prepareStatement("insert into user (uname,password,pubkey,identitynum) values (?,?,?,?)");
		    ps.setString(1,uname);
		    ps.setString(2,password);
		    ps.setString(3,pub);
		    ps.setString(4,i);
		    ps.executeUpdate();

		    return true;
		   }

		  } catch (SQLException | NoSuchAlgorithmException | IOException e) {

		   e.printStackTrace();
		  }
		  finally {
		   if(conn!=null)
		    try {
		     conn.close();
		    } catch (SQLException e) {
		     e.printStackTrace();
		    }
		  }
		  return false;
		 }

	//increase the balance
	public static void increaseBalance(float num,String uname) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE user SET balance = balance+? where uname=?");
			ps.setFloat(1, num);
			ps.setString(2, uname);
			ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//transfer the ticket
	public static void userconfirmtransfer(String ename,int seatnum,String olduname,String newuname,int tickets) throws Exception {
		wallet.extractUserWallet(olduname);
		String pubkey=wallet.keyMap.get(0);
		String ciphertext= wallet.encryptByPrivateKey("Owner");
		transferDAO.transferTicket(ename,seatnum,ciphertext,pubkey,tickets,olduname,newuname);
	}

	public static int getIDofTicket(String uname, String info) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT tickets FROM tickets where uname='"+uname+"' AND info=\'"+info+"'");
			rs.next();
			int tickets=rs.getInt("tickets");
			rs.close();
			st.close();
			conn.close();
			return tickets;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//cancel the ticket
	public static void userconfirmcancel(String uname, int tickets) throws Exception {
		//get pub key
		wallet.extractUserWallet(uname);
		String pubkey = wallet.keyMap.get(0);
		//encrypt by private key
		String ciphertext = wallet.encryptByPrivateKey("Cancel");
		String info = ClientApp.main(new String[]{"queryTicket", String.valueOf(tickets)});
		float price = Float.parseFloat(wallet.getTicketPrice(info));
		int seat = Integer.valueOf(wallet.getTicketSeat(info));
		String ename = wallet.getTicketename(info);
		cancelDAO.cancelTicket(uname, ename, seat, tickets, price, ciphertext, pubkey);
		//}
	}
	public static void userconfirmcancelsell(String uname, int tickets) throws Exception {
		wallet.extractUserWallet(uname);
		String pubkey = wallet.keyMap.get(0);
		String ciphertext = wallet.encryptByPrivateKey("CancelSell");
		sellDAO.cancelsellTicket(uname,tickets,ciphertext);
	}
    public static void userconfirmsell(String uname, int tickets) throws Exception {
        wallet.extractUserWallet(uname);
        String pubkey = wallet.keyMap.get(0);
        String ciphertext = wallet.encryptByPrivateKey("Sell");
        sellDAO.sellTicket(uname,tickets,ciphertext);
    }
	public static int getHashbyinfo(String info) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT tickets FROM tickets where info='"+info+"'");
			rs.next();
			int hash=rs.getInt("tickets");
			rs.close();
			st.close();
			conn.close();
			return hash;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static String getUnamebypubkey(String pubkey) {
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT uname FROM user where pubkey='"+pubkey+"'");
            rs.next();
            String uname=rs.getString("uname");
            rs.close();
            st.close();
            conn.close();
            return uname;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}






