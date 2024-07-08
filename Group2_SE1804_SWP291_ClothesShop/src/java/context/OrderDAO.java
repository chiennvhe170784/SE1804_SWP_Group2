/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.time.LocalDate;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author chien
 */
public class OrderDAO extends DBContext {

    public void addOrder(User u, String address, String note, int totalPrice) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //lay id user

            // add vào bảng Order
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([orderDate]\n"
                    + "           ,[totalPrice]\n"
                    + "           ,[address]\n"
                    + "           ,[status]\n"
                    + "           ,[note]\n"
                    + "           ,[uid])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, totalPrice);
            st.setString(3, address);
            st.setString(4, "0");
            st.setString(5, note);
            st.setInt(6, u.getUid());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void reduceNumberProduct(int pid, int numberP) {
        String sql = "UPDATE Product SET quantity = quantity - ? WHERE pid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, numberP);
            st.setInt(2, pid);
        } catch (SQLException e) {
        }
    }

    public double getWalletByUId(User u) {
        int uid = u.getUid();
        String sql = "SELECT wallet\n"
                + "  FROM [dbo].[wallet]\n"
                + "  where uid = ?";

        try {
             PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getInt("wallet");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public boolean checkValidBuy(int totalMoney, User u) {
        return totalMoney <= getWalletByUId(u);
    }
    
}
