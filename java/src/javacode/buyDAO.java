package javacode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class buyDAO {
	//buy ticket
	public static  int  buyTicket(int seatnum, String ename,String uname) throws Exception {
		float balance = getBalance(uname);
		float tprice = PriceofTicket(ename, seatnum);
		if (balance>=tprice) {
			String vname = VnameofTicket(ename);
			String etime = TimeofTicket(ename);
			String address = eventDAO.getAddressofVenue(ename);
			int tickets = wallet.ticketHash(getTicket(seatnum, ename));
			insertintoTickets(uname, seatnum, ename, tprice, vname, address, etime, tickets);
			decreaseBalance(tprice, uname);
			setTicketStatus(seatnum, ename);
			createTicket(ename, seatnum, uname);
			return 1;
		}else{
			return 0;
		}

	}
	//pay by the card
	public static int buyTicketbycard(int seatnum, String ename,String uname,int cardnum,String password) throws Exception {
		float tprice = PriceofTicket(ename, seatnum);
		Connection conn=null;
		conn = JDBCTool.getConnection();
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT money FROM card WHERE password='"+password+"' AND cardnum="+cardnum);
		rs.next();
		float money=rs.getFloat("money");
		rs.close();
		st.close();
		conn.close();
		if (money>=0) {
			String vname = VnameofTicket(ename);
			String etime = TimeofTicket(ename);
			String address = eventDAO.getAddressofVenue(ename);
			int tickets = wallet.ticketHash(getTicket(seatnum, ename));
			insertintoTickets(uname, seatnum, ename, tprice, vname, address, etime, tickets);
			setTicketStatus(seatnum, ename);
			createTicket(ename, seatnum, uname);
			return 1;
		}else{
			return 0;
		}

	}
	//get the balance of the user
	public static float getBalance(String uname){
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT balance FROM user where uname='"+uname+"'");
			rs.next();
			float b=rs.getFloat("balance");
			rs.close();
			st.close();
			conn.close();
			return b;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//decrease the balance
	public static void decreaseBalance(float tprice,String uname) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE user SET balance = balance-? where uname=?");
			ps.setFloat(1, tprice);
			ps.setString(2, uname);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//when buy the ticket then change its status
	public static void setTicketStatus(int seatnum,String ename) {
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE ticket SET status = 0 where (seat=? AND ename=?)");
			ps.setInt(1, seatnum);
			ps.setString(2, ename);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void insertintoTickets(String uname, int seatnum, String ename,float price,String vname,String address,String etime,int hash){
		String info=wallet.ticketInfo(seatnum, ename, price, vname, address, etime);
		try {
			Connection conn = JDBCTool.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT into tickets (uname,tickets,info) values(?,?,?)");
			ps.setString(1, uname);
			ps.setInt(2, hash);
			ps.setString(3, info);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//get the time of the event
	public static String TimeofTicket(String ename) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT time FROM event where ename='"+ename+"'");
			rs.next();
			String time=rs.getString("time");
			rs.close();
			st.close();
			conn.close();
			return time;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	//get the price of event
	public static float PriceofTicket(String ename,int seatnum) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT price FROM ticket where ename='"+ename+"' AND seat="+seatnum);
			rs.next();
			float price=rs.getFloat("price");
			rs.close();
			st.close();
			conn.close();
			return price;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	//get venue name.
	public static String VnameofTicket(String ename) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT vname FROM event where ename='"+ename+"'");
			rs.next();
			String vanme=rs.getString("vname");
			rs.close();
			st.close();
			conn.close();
			return vanme;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "NULL";
	}


	//invoke the blockchain to creatTicket
	public static void createTicket(String ename,int seatnum,String uname) throws Exception {
		int hash=wallet.ticketHash(getTicket(seatnum,ename));
		wallet.extractUserWallet(uname);
		String ID=wallet.encryptByPrivateKey(String.valueOf(hash));
		String price=String.valueOf(PriceofTicket(ename,seatnum));
		String time=TimeofTicket(ename);
		String i=userDAO.getIdentitynum(uname);
		ClientApp.main(new String[] {"createTicket",String.valueOf(hash),ID,ename,time,String.valueOf(seatnum),price,i});
	}

	public static ticket getTicket(int seatnum,String ename) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM ticket where ename='"+ename+"' AND seat="+seatnum);
			if(rs.next()){
				int status =rs.getInt("status");
				float price=rs.getFloat("price");
				int seat =rs.getInt("seat");
				int key=rs.getInt("key");
				ticket t = new ticket(status,price,seat,key);
				t.setEname(ename);
				t.setTime(TimeofTicket(ename));
				rs.close();
				st.close();
				conn.close();
				return t;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}


