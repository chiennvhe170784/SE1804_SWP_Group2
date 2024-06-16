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

    //_____________________________Reset Password_____________________________
    public void changePassByEmail(String email, String pass) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET \n"
                + "[password] = ?\n"
                + " WHERE [email] = ?";
        try {
            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setString(1, pass);
            pst.setString(2, email);
            pst.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //___________________________Active User_________________________
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

    //_____________________________________Register Account______________________________
    //resgister with customer
    public void registerAcc(String name, String phone, String address, String email, String username, String password, String dbo, int gender) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([fullName]\n"
                + "           ,[phone]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[dob]\n"
                + "           ,[gender])\n"
                + "     VALUES\n"
                + "    (?, ?, ?, ?, ?, ?, ?, ?);";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setString(7, dbo);
            ps.setInt(8, gender);
            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public User checkUser(String user, String pass) {
        String sql = "    [fullName]\n"
                + "      ,[phone]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[dob]\n"
                + "      ,[gender]\n"
                + "  FROM [dbo].[User]\n"
                + "  where username =? and password = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
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
    public boolean checkUsername(String username) {
    String sql = "SELECT [username] FROM [dbo].[User] WHERE [username] = ?";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Username already exists in the database
            return false;
        }
    } catch (SQLException e) {
        e.printStackTrace();  // Print the stack trace for debugging
    }
    return true;
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
//        ud.verifyCode("chien19042003@gmail.com", ud.getCode());
//         System.out.println(ud.getCode());
//      System.out.println(ud.toSHA1("12345"));
//ud.changePassByEmail("chien19042003@gmail.com", "12345");
//        System.out.println(ud.checkUser("admin", ud.toSHA1("123")));
       
//        ud.registerAcc("123", "00000000", "123", "123", "123", "123", "1985-05-15", 1);
System.out.println(ud.checkUsername("admin"));
    }
}
