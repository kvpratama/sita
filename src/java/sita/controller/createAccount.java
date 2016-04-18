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
import org.apache.log4j.Logger;
import sita.model.CheckScript;
import sita.model.InsertDB;

/**
 *
 * @author kpratama
 */
public class createAccount extends HttpServlet {

    private final static Logger log = Logger.getLogger(createAccount.class);

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CheckScript c = new CheckScript();
        String nim = c.checkScript(request.getParameter("nim"));
        String nama = c.checkScript(request.getParameter("nama"));
        String password = c.checkScript(request.getParameter("password"));
        if (log.isTraceEnabled()) {
            log.trace("Guest with nim " + nim + " try to create account");
        }
        if (nim.length() <= 8 || nim.substring(0, 3).equals("201")) {
            InsertDB i = new InsertDB();
            if (i.insertUser(nim, nama, password)) {
                if (log.isTraceEnabled()) {
                    log.trace("Guest with nim " + nim + " success to create account");
                }
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
            } else {
                if (log.isTraceEnabled()) {
                    log.trace("Guest with nim " + nim + " fail to create account");
                }
                RequestDispatcher view = request.getRequestDispatcher("CreateAccount.jsp");
                view.forward(request, response);
            }
        } else {
            if (log.isTraceEnabled()) {
                log.trace("Guest with nim " + nim + " fail to create account");
            }
            request.setAttribute("fail", "NIM not found. Please Try Again");
            RequestDispatcher view = request.getRequestDispatcher("CreateAccount.jsp");
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
