import context.HomeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class Dashboard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HomeDAO dao = new HomeDAO();
        int totalProductsInStock = dao.getTotalProductsInStock();
        double totalRevenue = dao.getTotalRevenue();
        int totalOrders = dao.getTotalOrders();
        
        // Assuming getMonthlyEarnings returns a Map<String, Double> with months as keys and earnings as values
        Map<String, Double> monthlyEarnings = dao.getMonthlyEarnings();
        
        request.setAttribute("totalProductsInStock", totalProductsInStock);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("monthlyEarnings", monthlyEarnings);
        request.getRequestDispatcher("dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
