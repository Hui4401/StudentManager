<%@ page import="dao.TeacherD" %>
<%@ page import="dao.StudentD" %>
<%@ page import="vo.Student" %>
<%@ page import="vo.Teacher" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.mail.Transport" %>
<%--
  Created by IntelliJ IDEA.
  User: 007
  Date: 2018/11/28
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>验证码</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="resources/css/forget.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<%
    String id = request.getParameter("user");
    TeacherD teacherD = new TeacherD();
    StudentD studentD = new StudentD();
    Teacher teacher = null;
    Student student = null;
    try {
        teacher = teacherD.findWithId(id);
        student = studentD.findWithId(id);
    } catch (Exception e) {
        out.print(e);
    }

    if (teacher != null) {
        if(teacher.getEmail() == null){
%>
            <script>alert("该教师未设置安全邮箱!");
                window.location.href = 'login.jsp';
            </script>
<%
        }else {
            int x = (int) (1000 + Math.random() * (9999 - 1000 + 1));
            String toMail = teacher.getEmail();
            String title = "验证码";
            String content = Integer.toString(x);

            try {
                Properties prop = new Properties();
                prop.put("mail.smtp.auth", true);
                Session s = Session.getInstance(prop);

                MimeMessage message = new MimeMessage(s);
                message.setFrom(new InternetAddress("434935656@qq.com"));
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));

                message.setSubject(title);
                message.setContent(content, "text/plain;charset=utf-8");
                message.setSentDate(new Date());
                message.saveChanges();

                Transport transport = s.getTransport("smtp");
                transport.connect("smtp.qq.com", "434935656@qq.com", "ylwaxdtbeogbcacc");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                session.setAttribute("reset", content);
%>
                <script>alert("发送成功，请到邮箱\"<%=toMail%>\"查收验证码");</script>
                <div class="main">
                    <form role="form" action="teacher/resetPassword.jsp" method="post">
                        <div class="form-group" align="center">
                            <input class="form-control" type="text" name="reset" placeholder="验证码"><br>
                            <input type="hidden" name="id" value="<%=id%>">
                            <input type="submit" class="btn btn-success" value="下一步">
                            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
                        </div>
                    </form>
                </div>
<%
            } catch (Exception e) {
            out.print(e);
            }
        }

    } else if (student != null) {
        if (student.getEmail() == null) {
%>
            <script>alert("该学生未设置安全邮箱!");
                window.location.href = 'login.jsp';
            </script>
<%
        } else {
            int x = (int) (1000 + Math.random() * (9999 - 1000 + 1));
            String toMail = student.getEmail();
            String title = "验证码";
            String content = Integer.toString(x);

            try {
                Properties prop = new Properties();
                prop.put("mail.smtp.auth", true);
                Session s = Session.getInstance(prop);

                MimeMessage message = new MimeMessage(s);
                message.setFrom(new InternetAddress("434935656@qq.com"));
                message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));

                message.setSubject(title);
                message.setContent(content, "text/plain;charset=utf-8");
                message.setSentDate(new Date());
                message.saveChanges();

                Transport transport = s.getTransport("smtp");
                transport.connect("smtp.qq.com", "434935656@qq.com", "ylwaxdtbeogbcacc");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                session.setAttribute("reset", content);
%>
                <script>alert("发送成功，请到邮箱\"<%=toMail%>\"查收验证码");</script>
                <div class="main">
                    <form role="form" action="student/resetPassword.jsp" method="post">
                        <div class="form-group" align="center">
                            <input class="form-control" type="text" name="reset" placeholder="验证码"><br>
                            <input type="hidden" name="id" value="<%=id%>">
                            <input name="email" value="<%=toMail%>" type="hidden">
                            <input type="submit" class="btn btn-success" value="下一步">
                            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
                        </div>
                    </form>
                </div>
<%
            } catch (Exception e) {
                out.print(e);
            }
        }
    }else {
%>
        <script>alert("该用户不存在!");
            window.location.href = 'forget.jsp';
        </script>
<%
    }
%>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
