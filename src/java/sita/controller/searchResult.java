/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sita.domain.TA;
import sita.domain.TASearchResult;
import sita.model.SearchTA;

/**
 *
 * @author kpratama
 */
public class searchResult extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchResult</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchResult at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
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
        String param = request.getParameter("judul");
        
        SearchTA sta = new SearchTA();
        ArrayList<TASearchResult> ta= sta.searchByJudul(param);
        request.setAttribute("judul", ta.get(0).getJudul());
        request.setAttribute("nama", ta.get(0).getNama());
        request.setAttribute("tahun", ta.get(0).getTahun());
        request.setAttribute("dosen1", ta.get(0).getDosen1());
        request.setAttribute("dosen2", ta.get(0).getDosen2());
        request.setAttribute("abstrak", ta.get(0).getAbstrak());
        request.setAttribute("path", ta.get(0).getPath());
        request.setAttribute("size", ta.size());
        
        RequestDispatcher view = request.getRequestDispatcher("searchResult.jsp");
        view.forward(request, response);
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
