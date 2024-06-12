/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Category;

import context.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;

/**
 *
 * @author chien
 */
public class listCate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet listCate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listCate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cd = new CategoryDAO();

        String indexPage = request.getParameter("index");
        String searchCate = request.getParameter("searchCate");

        if (indexPage == null) {
            indexPage = "1";
        }

        if (searchCate == null) {
            int index1 = Integer.parseInt(indexPage);
            int count = cd.count();
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Category> listC = cd.pagging(index1);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listC", listC);
            request.setAttribute("searchCate", searchCate);
            request.getRequestDispatcher("category_brand/listCate.jsp").forward(request, response);

        } else {
            int index1 = Integer.parseInt(indexPage);
            int count = cd.count2(searchCate);
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Category> listC = cd.search(searchCate, index1);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listC", listC);
            request.setAttribute("searchCate", searchCate);
            request.getRequestDispatcher("category_brand/listCate.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        CategoryDAO cd = new CategoryDAO();
//        String searchCate = request.getParameter("searchCate");
//        String indexPage = request.getParameter("index");
//        if (indexPage == null) {
//            indexPage = "1";
//        }
//        int index1 = Integer.parseInt(indexPage);
//        int count = cd.count();
//        int endPage = count / 5;
//        if (count % 5 != 0) {
//            endPage++;
//        }
//        List<Category> listC = cd.search(searchCate, index1);
//        request.setAttribute("endPage", endPage);
//        request.setAttribute("listC", listC);
//        request.getRequestDispatcher("category_brand/showCate.jsp").forward(request, response);
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
