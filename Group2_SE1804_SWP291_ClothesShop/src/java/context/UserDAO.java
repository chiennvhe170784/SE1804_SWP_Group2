/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.util.Base64;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import model.User;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author chien
 */
public class UserDAO extends DBContext {

    // set active of account
    public void changeActive(int uid, int active) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [active] = ?\n"
                + " WHERE [uid] =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, active);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //set role of account
    public void changeRole(int uid, int role) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [role] = ?\n"
                + " WHERE [uid] =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, role);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //resgister with customer
    public void registerAcc(User u) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([uid]\n"
                + "           ,[fullName]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[dob]\n"
                + "           ,[gender]\n"
                + "           ,[rid]\n"
                + "           ,[active])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getPhone());
            ps.setString(3, u.getAddress());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getUsername());
            ps.setString(6, u.getPassword());
            ps.setString(7, u.getDob());
            ps.setInt(8, u.getGender());
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public User checkUser(String user, String pass) {
        String sql = "SELECT [uid]\n"
                + "      ,[fullName]\n"
                + "      ,[phone]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[dob]\n"
                + "      ,[gender]\n"
                + "      ,[rid]\n"
                + "      ,[active]\n"
                + "  FROM [dbo].[User]\n"
                + "  where username =? and password = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getInt(11));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //sent code to email
    public static boolean verifyCode(String mailTo, String code) {
        final String from = "champion19042003@gmail.com";
        final String password = "uqqy hrpu monf efam";

        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com"); // Use the correct SMTP server
        props.setProperty("mail.smtp.port", "587");//Cổng smtp tls-587
        props.setProperty("mail.smtp.auth", "true");//xác định cần xác thực mail
        props.setProperty("mail.smtp.starttls.enable", "true");// Kích hoạt STARTTLS để bảo mật kết nối.

        //Authenticator: cugn cấp thông tin xác thực khi cần
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };
        Session session = Session.getInstance(props, auth);

        //using mail api, content send to mail.
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailTo, false));
            msg.setSubject("verifile code");
            msg.setSentDate(new Date());
            String emailContent = "<html>"
                    + "<head>"
                    + "<style>"
                    + "p { font-size: 16px; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<h1>This is your code: <h1 style=\"color: #33ff33\">" + code + "</h1></h1>"
                    + "<p>Thank you for using our service.</p>"
                    + "</body>"
                    + "</html>";
            msg.setContent(emailContent, "text/html; charset=UTF-8");
            Transport.send(msg);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //cretate random code send to email
    public static String getCode() {
        Random rd = new Random();
        int number = rd.nextInt(1000000);
        return String.format("%06d", number);
    }

    //encode string  
    public static String toSHA1(String str) {
        String tim_ho = "kaisd#$%^&*(sg~~sda";
        String result = null;

        str = str + tim_ho;
        try {
            byte[] dataByte = str.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] hashBytes = md.digest(dataByte);
            result = Base64.getEncoder().encodeToString(hashBytes);
        } catch (Exception e) {
        }
        return result;

    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        ud.verifyCode("chien19042003@gmail.com", ud.getCode());
//         System.out.println(ud.getCode());
//      System.out.println(ud.toSHA1("12345"));
    }
}
