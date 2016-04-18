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
import sita.model.UploadFile;

/**
 *
 * @author kpratama
 */
public class RegisterTA extends HttpServlet {

    private final static Logger log = Logger.getLogger(RegisterTA.class);

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UploadFile u = new UploadFile();
        String realPath = getServletContext().getRealPath("/") + "uploadImage/";
        String[] data = u.upload(request, realPath);
        CheckScript check = new CheckScript();
        data = check.checkScript(data);

        String nim = String.valueOf(request.getSession().getAttribute("login"));
        String username = (String) request.getSession().getAttribute("login");

        String judul = data[0];
        String tahun = data[1];
        String dosen = data[2];
        String dosen2 = data[3];
        String abstrak = data[4];
        String path = data[5];
//        System.out.println("path:" + path);
//        System.out.println("data0 : " + data[0]);
//        System.out.println("data1 : " + data[1]);
//        System.out.println("data2 : " + data[2]);
//        System.out.println("data3 : " + data[3]);
//        System.out.println("data4 : " + data[4]);
//        System.out.println("data5 : " + data[5]);
        InsertDB idb = new InsertDB();
        if (log.isTraceEnabled()) {
            log.trace("Username " + username + " try to register TA");
        }
        if (idb.insertTA(nim, judul, tahun, abstrak, path)
                && idb.insertPembimbing(nim, dosen)
                && idb.insertPembimbing(nim, dosen2)) {
            if (log.isTraceEnabled()) {
                log.trace("Username " + username + " success to register TA");
            }
            RequestDispatcher view = request.getRequestDispatcher("taRegistered.jsp");
            view.forward(request, response);
        } else {
            if (log.isTraceEnabled()) {
                log.trace("Username " + username + " fail to register TA");
                RequestDispatcher view = request.getRequestDispatcher("registerTA.jsp");
                view.forward(request, response);
            }
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
