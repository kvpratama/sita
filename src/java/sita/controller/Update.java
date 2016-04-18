/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sita.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sita.model.UpdateModel;

/**
 *
 * @author kpratama
 */
public class Update extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("username") != null) {
            if (request.getParameter("status").equals("active")) {
                UpdateModel um = new UpdateModel();
                um.updateUserStatus(request.getParameter("username"), "inactive");
            } else if (request.getParameter("status").equals("inactive")) {
                UpdateModel um = new UpdateModel();
                um.updateUserStatus(request.getParameter("username"), "active");
            }
            RequestDispatcher view = request.getRequestDispatcher("search.do?role=" + request.getParameter("role"));
            view.forward(request, response);
        } else {
            if (request.getParameter("status").equals("active")) {
                UpdateModel um = new UpdateModel();
                um.updateTaStatus(request.getParameter("nims"), "inactive");
            } else if (request.getParameter("status").equals("inactive")) {
                UpdateModel um = new UpdateModel();
                um.updateTaStatus(request.getParameter("nims"), "active");
            }
            RequestDispatcher view = request.getRequestDispatcher("search.do?ta=1");
            view.forward(request, response);
        }
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
}
