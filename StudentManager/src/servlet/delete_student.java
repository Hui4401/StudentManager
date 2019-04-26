package servlet;

import dao.ScoreD;
import dao.StudentD;
import vo.Score;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delete_student")
public class delete_student extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        StudentD studentD = new StudentD();
        ScoreD scoreD = new ScoreD();

        String id = request.getParameter("id");
        try {
            studentD.deleteStudent(id);
            scoreD.deleteScore(id);
            response.sendRedirect("one_page_student");
        }
        catch (Exception e){
            out.print(e);
        }
    }
}
