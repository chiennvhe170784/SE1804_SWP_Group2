
package context;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Gender;
import model.Product;

/**
 *
 * @author KieuTuanPC
 */
public class HomeDAO extends DBContext{
    public ArrayList<Category> getAllCate() {
        ArrayList<Category> listCate = new ArrayList<>();
        String sql = "select * from category";
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
                        new Category(rs.getInt("category_id"), rs.getString("category_name")), // Assuming foreign key and name are present
                        new Brand(rs.getInt("brand_id"), rs.getString("brand_name")), // Assuming foreign key and name are present
                        new Gender(rs.getInt("gender_id"), rs.getString("gender_name")), // Assuming foreign key and name are present
                        new ArrayList<>() // Placeholder for sizes
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
