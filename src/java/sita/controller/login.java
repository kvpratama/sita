/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import sita.model.Validate;
import sita.services.Search;

/**
 *
 * @author kpratama
 */
public class login extends HttpServlet {

    private final static Logger log = Logger.getLogger(login.class);

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
            out.println("<title>Servlet validateLogin</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet validateLogin at " + request.getContextPath () + "</h1>");
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
        boolean login = false;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (log.isTraceEnabled()) {
            log.trace("Username " + username + " try to login");
        }

        Validate validateLogin = new Validate();
        if (validateLogin.validateLogin(username, password)) {
            if (log.isTraceEnabled()) {
                log.trace("Username " + username + " success to login");
            }

            HttpSession session = request.getSession();
            if (username.equals("admin")) {
                session.setAttribute("login", username);
                session.setAttribute("role", "admin");
                RequestDispatcher view = request.getRequestDispatcher("adminHome.jsp");
                view.forward(request, response);
            } else {
                Search s = new Search();
                String nama = "Hello, " + s.getNamaMahasiswa(username);
                session.setAttribute("login", username);
                session.setAttribute("nama", nama);
                session.setAttribute("role", "mahasiswa");
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            }
        } else {
            if (log.isTraceEnabled()) {
                log.trace("Username " + username + " fail to login");
            }
            request.setAttribute("fail", "Username and password not match");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.forward(request, response);
        }
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
