/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.CourseDao;
import java.util.ArrayList;
import java.util.List;
import model.Courses;
import model.Categories;

/**
 *
 * @author vinhung
 */
@WebServlet(name = "CourseController", urlPatterns = {"/course"})
public class CourseController extends HttpServlet {

    private final int LIMIT_ITEM_PAGINATION = 6;

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDao dao = new CourseDao();
        CategoryDao catDao = new CategoryDao();
        List<Courses> coursesList = dao.getAllCourses();

        int page = request.getParameter("page") == null
                ? 0 : Integer.parseInt(request.getParameter("page"));

        int category = request.getParameter("category") == null
                ? 0 : Integer.parseInt(request.getParameter("category"));

        int numCourse = dao.getNumOfCourse(category);

        int endPage = numCourse / LIMIT_ITEM_PAGINATION;
        if (numCourse % LIMIT_ITEM_PAGINATION != 0) {
            endPage++;
        }

        List<Categories> listCategory = catDao.getListCategory();
   
        List<Courses> listCoursePage = page == 0
                ? dao.getListCourseByPage(1, LIMIT_ITEM_PAGINATION)
                : dao.getListCourseByCatePaging(category, page == 0 ? 1 : page, LIMIT_ITEM_PAGINATION);

        List<Courses> listCourseByCategory = category == 0
                ? dao.getListCourseByPage(1, LIMIT_ITEM_PAGINATION)
                : dao.getListCourseByCatePaging(category, page == 0 ? 1 : page, LIMIT_ITEM_PAGINATION);

        request.setAttribute("currentCate", category);
        request.setAttribute("listCourseByCategory", listCourseByCategory);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("currentPage", page);
        request.setAttribute("listCoursePage", listCoursePage);
        request.setAttribute("coursesList", coursesList);
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDao dao = new CourseDao();
//        List<Courses> listCoursePage = dao.getListCourseByPage(page, LIMIT_ITEM_PAGINATION);

//        request.setAttribute("listCoursePage", listCoursePage);
//        response.sendRedirect("home.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
