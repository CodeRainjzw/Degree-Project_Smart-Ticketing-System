package javacode;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class payDAO {
    public static float paybycard(int cardnum,String password){
            Connection conn=null;
            try {
                conn = JDBCTool.getConnection();
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT money FROM card WHERE password='"+password+"' AND cardnum="+cardnum);
                rs.next();
                float money=rs.getFloat("money");
                rs.close();
                st.close();
                conn.close();
                return money;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        return 0;
    }
}
