/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Model.DatabaseHelper;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Viral Ghosh
 */
public class UpdateServlet extends HttpServlet {

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
        DatabaseHelper dh = new DatabaseHelper();
        int id = Integer.parseInt(request.getParameter("id"));
        Customer c = dh.getRecord(id);
        HttpSession session = request.getSession(true);
        session.setAttribute("id", id);
        request.setAttribute("c", c);
        request.setAttribute("department", c.getDepartment());
        RequestDispatcher rd = request.getRequestDispatcher("updateRegistration.jsp");
        rd.forward(request, response);
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
         HttpSession session = request.getSession(true);
        int id = (int) session.getAttribute("id");response.setContentType("text/html;charset=UTF-8");
        DatabaseHelper dh = new DatabaseHelper();
        Customer c =new Customer();
        c.setName(request.getParameter("name"));
        c.setEmail(request.getParameter("email"));
        c.setGender(request.getParameter("gender"));
        c.setCompany(request.getParameter("company"));
        String[] departmentarr =request.getParameterValues("department");
        String department ="";
        if(departmentarr!= null){
        for (String departmentarr1 : departmentarr) {
            department += departmentarr1 + ",";
        }}
        c.setDepartment(department);
        c.setLoginid(id);
        int status = dh.updateRecord(c);
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
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
