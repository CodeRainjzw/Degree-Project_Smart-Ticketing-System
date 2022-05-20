package javacode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;

public class transferDAO {
	public static void transferTicket(String ename,int seatnum,String ciphertext,String pubkey,int hash,String unameofoldowner,String unameofnewowner) throws NumberFormatException,Exception {
		String info=ClientApp.main(new String[] {"queryTicket",String.valueOf(hash)});
		String ID=wallet.getTicketID(info);
		String price=null;
		String de=wallet.decryptByPublicKey(ciphertext,pubkey);
		if(de.indexOf("Owner")!=-1) {
			//contains the owner
			String dehash = wallet.decryptByPublicKey(ID,pubkey);
			if (dehash.equals(String.valueOf(hash))) {
				float balance = buyDAO.getBalance(unameofnewowner);
				float tprice = buyDAO.PriceofTicket(ename, seatnum);
				if (balance>tprice) {
					String newID;
					wallet.extractUserWallet(unameofnewowner);
					newID=wallet.encryptByPrivateKey(String.valueOf(hash));
					ClientApp.main(new String[]{"changeTicketOwner", String.valueOf(hash), userDAO.getIdentitynum(unameofnewowner),newID});
					String vname = buyDAO.VnameofTicket(ename);
					String etime = buyDAO.TimeofTicket(ename);
					String address = eventDAO.getAddressofVenue(ename);
					int tickets = wallet.ticketHash(buyDAO.getTicket(seatnum, ename));
					buyDAO.insertintoTickets(unameofnewowner, seatnum, ename, tprice, vname, address, etime, tickets);
					deleteTicketstoUser(unameofoldowner, hash);
				}
				else {
					System.out.println("The new owner does not have enough money to buy");
				}} else{
				System.out.println("error");
			}

		} else {
			System.out.println("error");
		}
	}
	public static void insertTicketstoUser(String uname,int hash) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT into tickets values (?,?)");
			ps.setString(1, uname);
			ps.setInt(2, hash);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}catch (SQLException e) {
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

	public static void decreaseBalance(float tprice,String unameofnewowner) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE user SET balance = balance-? where uname=?");
			ps.setFloat(1, tprice);
			ps.setString(2, unameofnewowner);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static int userexist(String uname) throws Exception {
        Connection conn = null;
        
            conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM user WHERE uname='" + uname + "'");
            if (rs.next()) {
                return 1;//uname exists
            }else{
                return 0;//uname does not exist
            }
    }
}
