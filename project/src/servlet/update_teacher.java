package servlet;

import dao.StudentD;
import dao.TeacherD;
import vo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/update_teacher")
public class update_teacher extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        TeacherD teacherD = new TeacherD();

        String uid = request.getParameter("uid");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            Teacher teacher = teacherD.updateTeacher(uid, name, sex, email, password);
            session.setAttribute("info", teacher);
            out.print("<script>alert(\"保存成功！\");location.href = \"teacher/personal.jsp\";</script>");
        }
        catch (Exception e){
            out.print(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
