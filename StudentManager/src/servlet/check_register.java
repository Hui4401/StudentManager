package servlet;

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

@WebServlet("/check_register")
public class check_register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String password = request.getParameter("password1");
        String code = request.getParameter("code");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String randStr = (String) session.getAttribute("randStr");

        if (!code.equals(randStr)) {
            out.print("<script>alert(\"验证码错误！\");location.href = \"register.jsp\";</script>");
        } else {

            TeacherD teacherD = new TeacherD();
            Teacher teacher = null;

            try {
                teacher = teacherD.insertTeacher(user, password, email);
            } catch (Exception e) {
                out.print(e);
            }
            if (teacher != null) {
                //向session中添加用户信息
                session.setAttribute("info", teacher);
                response.sendRedirect("one_page_student");
            } else {
                out.print("<script>alert(\"此用户已经注册！\");location.href = \"register.jsp\";</script>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
