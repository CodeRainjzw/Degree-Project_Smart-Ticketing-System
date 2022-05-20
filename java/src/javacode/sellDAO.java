package javacode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class sellDAO {
    //get the tickets which are selling
    public static List<String> getSellingTickets() {
        List<String> sellingticket = new ArrayList<String>();
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT info,priceofsell,uname FROM tickets WHERE selling=1");
            while (rs.next()) {
                String info = rs.getString("info");
                sellingticket.add(info);
            }
            rs.close();
            st.close();
            conn.close();
            return sellingticket;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void defineprice(String uname, int tickets, float priceofsell) {
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET priceofsell = ? where (uname=? AND tickets=?)");
            ps.setFloat(1, priceofsell);
            ps.setString(2, uname);
            ps.setInt(3, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static float getoriginalprice(String uname, int tickets) {
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT info FROM tickets WHERE uname='"+uname+"' AND tickets="+tickets);
            rs.next();
            String info=rs.getString("info");
            rs.close();
            st.close();
            conn.close();
            String originalprice=wallet.getTicketPrice(info);
            return Float.valueOf(originalprice);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
    public static void savefirstprice(String uname, int tickets, float originalprice) {
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET firstprice= ? where (uname=? AND tickets=?)");
            ps.setFloat(1, originalprice);
            ps.setString(2, uname);
            ps.setInt(3, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    public static void saveoriginalprice(String uname, int tickets, float originalprice) {
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET originalprice= ? where (uname=? AND tickets=?)");
            ps.setFloat(1, originalprice);
            ps.setString(2, uname);
            ps.setInt(3, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static String changeInfo(String uname,int tickets, float priceofsell){
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT info,priceofsell FROM tickets WHERE uname='"+uname+"' AND tickets="+tickets);
            rs.next();
            String info=rs.getString("info");
            String newinfo=wallet.changeValue(info,"price",String.valueOf(priceofsell));
            rs.close();
            st.close();
            conn.close();
            return newinfo;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }
    public static void setnewinfo(String uname,String newinfo,int tickets){
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET info = ? where (uname=? AND tickets=?)");
            ps.setString(1, newinfo);
            ps.setString(2, uname);
            ps.setInt(3, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static float getResellPrice(String uname, int tickets) {
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT priceofsell FROM tickets where uname='"+uname+"' AND tickets="+tickets);
            rs.next();
            float priceofsell=rs.getFloat("priceofsell");
            rs.close();
            st.close();
            conn.close();
            return priceofsell;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    public static void setselling(String uname, int tickets) {
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET selling = 1 where (uname=? AND tickets=?)");
            ps.setString(1, uname);
            ps.setInt(2, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static void cancelsetselling(String uname, int tickets) {
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET selling = 0 where (uname=? AND tickets=?)");
            ps.setString(1, uname);
            ps.setInt(2, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static float gettheoriginalprice(String uname, int tickets) {
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT firstprice FROM tickets WHERE uname='"+uname+"' AND tickets="+tickets);
            rs.next();
            String originalprice=rs.getString("firstprice");
            rs.close();
            st.close();
            conn.close();
            return Float.valueOf(originalprice);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
    public static String changetooriginalInfo(String uname,int tickets, float firstprice){
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT info,firstprice FROM tickets WHERE uname='"+uname+"' AND tickets="+tickets);
            rs.next();
            String info=rs.getString("info");
            String originalinfo=wallet.changeValue(info,"price",String.valueOf(firstprice));
            rs.close();
            st.close();
            conn.close();
            return originalinfo;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }
    public static void setoriginalinfo(String uname,String originalinfo ,int tickets){
        try {
            Connection conn = JDBCTool.getConnection();
            PreparedStatement ps = conn.prepareStatement("UPDATE tickets SET info = ? where (uname=? AND tickets=?)");
            ps.setString(1, originalinfo);
            ps.setString(2, uname);
            ps.setInt(3, tickets);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void sellTicket(String uname,int tickets,String ciphertext) throws Exception {
        String pubkey=cancelDAO.getPubkey(uname);
        String info=ClientApp.main(new String[] {"queryTicket",String.valueOf(tickets)});
        String ID=wallet.getTicketID(info);
        String de=wallet.decryptByPublicKey(ciphertext,pubkey);
        if(de.indexOf("Sell")!=-1) {
            String dehash=wallet.decryptByPublicKey(ID,pubkey);//解密调取的从json里已经被加密的ID
            if(dehash.equals(String.valueOf(tickets))) {
                setselling(uname,tickets);
            }else{
                System.out.println("error");
            }
        }else{
            System.out.println("error");
        }
    }
    public static void cancelsellTicket(String uname,int tickets,String ciphertext) throws Exception {
        String pubkey=cancelDAO.getPubkey(uname);
        String info=ClientApp.main(new String[] {"queryTicket",String.valueOf(tickets)});
        String ID=wallet.getTicketID(info);
        String de=wallet.decryptByPublicKey(ciphertext,pubkey);
        if(de.indexOf("CancelSell")!=-1) {
            String dehash=wallet.decryptByPublicKey(ID,pubkey);//解密调取的从json里已经被加密的ID
            if(dehash.equals(String.valueOf(tickets))) {
                cancelsetselling(uname,tickets);
            }else{
                System.out.println("error");
            }
        }else{
            System.out.println("error");
        }
    }

    public static boolean check(String buyer,int tickets){
        try {
            Connection conn = JDBCTool.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT uname FROM tickets WHERE tickets="+tickets);
            rs.next();
            String uname=rs.getString("uname");
            rs.close();
            st.close();
            conn.close();
            if(uname.equals(buyer)){
                return false;
            }else{
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


}
