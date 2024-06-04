/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Brand;

import context.BrandDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;


/**
 *
 * @author chien
 */
public class listBrand extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet listBrand</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listBrand at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         BrandDAO cd = new BrandDAO();

        String indexPage = request.getParameter("index");
        String searchBrand = request.getParameter("searchBrand");

        if (indexPage == null) {
            indexPage = "1";
        }

        if (searchBrand == null) {
            int index1 = Integer.parseInt(indexPage);
            int count = cd.count();
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Brand> listB = cd.pagging(index1);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listB", listB);
            request.setAttribute("searchCate", searchBrand);
            request.getRequestDispatcher("category_brand/listBrand.jsp").forward(request, response);

        } else {
            int index1 = Integer.parseInt(indexPage);
            int count = cd.count2(searchBrand);
            int endPage = count / 5;
            if (count % 5 != 0) {
                endPage++;
            }
            List<Brand> listB = cd.search(searchBrand, index1);
            request.setAttribute("endPage", endPage);
            request.setAttribute("listB", listB);
            request.setAttribute("searchCate", searchBrand);
            request.getRequestDispatcher("category_brand/listBrand.jsp").forward(request, response);
        }

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
