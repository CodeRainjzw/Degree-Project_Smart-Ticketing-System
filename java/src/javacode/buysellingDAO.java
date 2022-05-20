package javacode;

import java.io.IOException;
import java.sql.*;

public class buysellingDAO {
    //buy the resale ticket
    public static int buysellingticket(String ename,int seatnum,String buyer, int tickets,float firstprice,float priceofselling,String seller) throws Exception {
        float money=buyDAO.getBalance(buyer);
        if(money>priceofselling){
        increaseBalanceforbuysellingticket(priceofselling,seller);
        decreaseBalanceforbuysellingticket(priceofselling,buyer);
            wallet.extractUserWallet(buyer);
            String newID = wallet.encryptByPrivateKey(String.valueOf(tickets));
            ClientApp.main(new String[]{"changeTicketOwner", String.valueOf(tickets), buyer,newID});
            String vname = buyDAO.VnameofTicket(ename);
            String etime = buyDAO.TimeofTicket(ename);
            String address = eventDAO.getAddressofVenue(ename);
            int ticketshash = wallet.ticketHash(buyDAO.getTicket(seatnum, ename));
            buyDAO.insertintoTickets(buyer, seatnum, ename,firstprice, vname, address, etime, ticketshash);
            transferDAO.deleteTicketstoUser(seller, tickets);
            return 1;
        }else{
            return 0;
        }

    }

    public static void increaseBalanceforbuysellingticket(float num,String uname) {
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
    public static void decreaseBalanceforbuysellingticket(float tprice,String unameofnewowner) {
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

    public static String getSeller(String info) {
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT uname FROM tickets WHERE info='"+info+"'");
            rs.next();
            String seller=rs.getString("uname");
            rs.close();
            st.close();
            conn.close();
            return seller;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
