package context;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Category;
import model.Gender;
import model.News;
import model.Product;
import model.Size;

public class HomeDAO extends DBContext {

    public ArrayList<Category> getAllCate() {
        ArrayList<Category> listCate = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listCate.add(new Category(rs.getInt("cid"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCate;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("pid"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("img"),
                        rs.getDate("releaseDate"),
                        new Category(rs.getInt("cid"), rs.getString("name")),
                        new Brand(rs.getInt("bid"), rs.getString("name")),
                        new Gender(rs.getInt("gid"), rs.getString("name")),
                        getSizesByProductId(rs.getInt("pid"))
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Gender getGenderById(int id) {
        Gender gender = null;
        try {
            String sql = "SELECT * FROM gender WHERE gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                String description = rs.getString("description");
                gender = new Gender(id, description);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return gender;
    }

    public List<Size> getSizesByProductId(int productId) {
        List<Size> sizes = new ArrayList<>();
        String sql = "SELECT s.sid, s.name, s.description, s.gid FROM size s INNER JOIN product_size ps ON s.sid = ps.sid WHERE ps.pid = ?";
        try ( PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, productId);
            try ( ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    int sid = rs.getInt("sid");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    int genderId = rs.getInt("gid");
                    Gender gender = getGenderById(genderId);
                    sizes.add(new Size(sid, name, description, gender));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sizes;
    }

    public List<String> getRandomImages(int count) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT TOP (?) img FROM product ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, count);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                images.add(rs.getString("img"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public List<Product> getLatestProducts(int limit) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM product ORDER BY releaseDate DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("pid"),
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("describe"),
                        rs.getString("img"),
                        rs.getDate("releaseDate"),
                        new Category(rs.getInt("cid"), rs.getString("name")),
                        new Brand(rs.getInt("bid"), rs.getString("name")),
                        new Gender(rs.getInt("gid"), rs.getString("name")),
                        getSizesByProductId(rs.getInt("pid"))
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        for (Product p : products) {
            System.out.println(p.getName());
        }
        return products;
    }

    public List<News> getLatestNews(int limit) {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT TOP (?) * FROM news WHERE status = 1 ORDER BY updateDate DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, limit);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                News news = new News(
                        rs.getInt("nId"),
                        rs.getString("title"),
                        rs.getString("body"),
                        rs.getInt("author"),
                        rs.getDate("updateDate"),
                        rs.getBoolean("status"),
                        rs.getString("authorName")
                );
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public static void main(String[] args) {
        // Create an instance of HomeDAO
        HomeDAO homeDAO = new HomeDAO();

        // Call the getLatestProducts method to fetch the latest products
        List<Product> latestProducts = homeDAO.getLatestProducts(6);

        // Print the details of each product
        System.out.println("Number of latest products: " + latestProducts.size());
        for (Product product : latestProducts) {
            System.out.println("Product ID: " + product.getPid());
            System.out.println("Product Name: " + product.getName());
            System.out.println("Product Price: " + product.getPrice());
            System.out.println("Product Release Date: " + product.getReleaseDate());
            System.out.println("Product Image: " + product.getImg());
            System.out.println("-----------------------------");
        }
    }
}
