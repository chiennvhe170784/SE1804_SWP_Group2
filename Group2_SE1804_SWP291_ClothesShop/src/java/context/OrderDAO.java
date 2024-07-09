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
import model.Product;

/**
 *
 * @author chien
 */
public class OrderDAO extends DBContext {

    public void addOrder(User u, String address, String note, double totalPrice) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
      

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
            st.setDouble(2, totalPrice);
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
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void reduceWallet(User u, double totalMoney) {
        String sql = "UPDATE [dbo].[wallet]\n"
                + "   SET wallet = wallet - ?"
                + " WHERE uid = ? ";
        String sql1 = "UPDATE [dbo].[wallet]\n"
                + "   SET wallet = wallet + ?"
                + " WHERE uid = 1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setDouble(1, totalMoney);
            st.setInt(2, u.getUid());
            st.executeUpdate();
            
            PreparedStatement st1 = connection.prepareStatement(sql1);
            st1.setDouble(1, totalMoney);
            st1.executeUpdate();
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
            if (rs.next()) {
                return rs.getInt("wallet");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public boolean checkValidBuy(double totalMoney, User u) {
        return totalMoney <= getWalletByUId(u);
    }
    //Bơm tiền
    private void AddWallet(){
        String sql = "UPDATE [dbo].[wallet]\n"
                + "   SET wallet = 99999"
                + " WHERE uid = ? ";
           try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 4);
            st.executeUpdate();
  
        } catch (SQLException e) {
        }
    }

    public boolean checkValidProduct(Product p) {
        String sql = "select quantity from product where pid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getPid());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int numberP = rs.getInt("quantity");
                if (numberP > p.getQuantity()) {
                    return true;
                }
            }
        } catch (SQLException e) {
        }
        return false;
    }
    //validbuy = true thì trừ sản phẩm rồi thêm vào order

    public static void main(String[] args) {
        OrderDAO ord = new OrderDAO();
        ord.AddWallet();
        UserDAO ud = new UserDAO();
           LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        System.out.println(date);
    }
}
