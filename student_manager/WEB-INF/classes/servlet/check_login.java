package servlet;

import dao.StudentD;
import dao.TeacherD;
import vo.Student;
import vo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/check_login")
public class check_login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String user = request.getParameter("user");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        TeacherD teacherD = new TeacherD();
        StudentD studentD = new StudentD();
        Teacher teacher = null;
        Student student = null;

        try {
            // 判断用户身份
            teacher = teacherD.checkAccount(user, password);
            student = studentD.checkAccount(user, password);
        }
        catch (Exception e) {
            out.print(e);
        }

        if (teacher != null) {
            //向session中添加用户信息
            session.setAttribute("info", teacher);

            //检查用户是否需要保持登录状态
            if (remember != null) {
                //发送cookie到客户端
                Cookie userCookie = new Cookie("name", user);
                userCookie.setMaxAge(10);
                response.addCookie(userCookie);
            }
            response.sendRedirect("one_page_student");
        }
        else if (student != null){
            //向session中添加用户信息
            session.setAttribute("info", student);

            //检查用户是否需要保持登录状态
            if (remember != null) {
                //发送cookie到客户端
                Cookie userCookie = new Cookie("name", user);
                userCookie.setMaxAge(10);
                response.addCookie(userCookie);
            }
            response.sendRedirect("student/main.jsp");
        }
        else {
            out.print("<script>alert(\"用户名或密码错误！\");");
        }
    }
}
