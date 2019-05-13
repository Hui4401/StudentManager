package servlet;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/upload_studentImg")
public class upload_studentImg extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        SmartUpload smartUpload = new SmartUpload();
        Request rq = smartUpload.getRequest();
        ServletConfig config = this.getServletConfig();
        smartUpload.initialize(config, request, response);
        try {
            //上传文件
            smartUpload.upload();
            String id = rq.getParameter("id");
            File smartFile = smartUpload.getFiles().getFile(0);
            smartFile.saveAs("/userImg/"+id+".jpeg");
            out.print("<script>alert(\"上传成功!\");window.location.href='student/personal.jsp';</script>");
        }
        catch (Exception e){
            out.print(e);
        }
    }
}
