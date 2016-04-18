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
import sita.domain.UserRole;
import sita.domain.t_log;
import sita.model.SearchTA;
import sita.services.Search;

/**
 *
 * @author kpratama
 */
public class search extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("search") != null) {
            String keyword = request.getParameter("search");

            SearchTA searchTA = new SearchTA();
            int row = searchTA.countRow(keyword);
            ArrayList<TASearchResult> ta = searchTA.search(keyword);

            request.setAttribute("row", row);
            request.setAttribute("keyword", keyword);
            request.setAttribute("result", ta);

            RequestDispatcher view = request.getRequestDispatcher("search.jsp");
            view.forward(request, response);
        } else if (request.getParameter("nim") != null) {
            Search s = new Search();
            ArrayList<t_log> log = s.getLog(request.getParameter("nim"));
            request.setAttribute("log", log);
            RequestDispatcher view = request.getRequestDispatcher("showLog.jsp");
            view.forward(request, response);
        } else if (request.getParameter("role") != null) {
            Search s = new Search();
            ArrayList<UserRole> user = s.getUser(request.getParameter("role"));
            request.setAttribute("user", user);
            request.setAttribute("role", request.getParameter("role"));
            RequestDispatcher view = request.getRequestDispatcher("manageUser.jsp");
            view.forward(request, response);
        } else if (request.getParameter("ta") != null) {
            Search s = new Search();
            ArrayList<TA> ta = s.search("select nim, judul, nama_mahasiswa, tahun, abstrak, path, status from ta natural join mahasiswa");
            request.setAttribute("ta", ta);
            RequestDispatcher view = request.getRequestDispatcher("manageTA.jsp");
            view.forward(request, response);
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
        processRequest(request, response);
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
