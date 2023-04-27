
package com.mycompany.mycart.servlet;

import com.mycompany.mycart.Dao.CategoryDao;
import com.mycompany.mycart.Dao.ProductDao;
import com.mycompany.mycart.entity.Category;
import com.mycompany.mycart.entity.Product;
import com.mycompany.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


public class ProductOperationServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
             String op = request.getParameter("operation");
            if(op.trim().equals("addcategory")){
            String title = request.getParameter("catTitle");
            String des =   request.getParameter("catDescription");
            
            Category category = new Category();
            category.setTitle(title);
            category.setDescription(des);
  /* add database */
           CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
           int catId= categoryDao.saveCategory(category);
           HttpSession httpsession = request.getSession();
           httpsession.setAttribute("message", "Category added successfully : " +catId);
           response.sendRedirect("admin.jsp");
           return;

 }else if(op.trim().equals("addPoduct")){
                
//                store  data in database
                String pName  =  request.getParameter("proName");
                String prodes = request.getParameter("proDec");
                Part part     = request.getPart("pPic");
                int price     = Integer.parseInt(request.getParameter("proprice"));
                int discount  = Integer.parseInt(request.getParameter("prodiscount"));
                int Quantity  = Integer.parseInt(request.getParameter("proqqoantity"));
                int catId     = Integer.parseInt(request.getParameter("catId"));
                Product p = new Product(); 
                 p.setpName(pName);
                 p.setpDec(prodes);
                 p.setpPrice(price);
                 p.setpDiscount(discount);
                 p.setpQuantity(Quantity);
                 p.setpPhoto(part.getSubmittedFileName());
                 
//                 get category by Id
               
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);
                
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                 pDao.saveProduct(p);
//                out.println("product save success........");
                
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Product added successfully : ");
                response.sendRedirect("admin.jsp");
                return;
                
        }
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
        processRequest(request, response);
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
