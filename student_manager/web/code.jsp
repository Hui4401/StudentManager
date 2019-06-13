<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.imageio.ImageIO" %>
<%--
  Created by IntelliJ IDEA.
  User: 007
  Date: 2018/11/22
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="image/JPEG;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setCharacterEncoding("utf-8");

    response.setHeader("Cache-Control", "no-cache");
    //创建图像
    int width = 60, height = 20;
    BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    //获取画笔
    Graphics g = image.getGraphics();
    //设定背景色
    g.setColor(new Color(200, 200, 200));
    g.fillRect(0, 0, width, height);
    //随机产生四位数字
    Random rnd = new Random();
    int randNum = rnd.nextInt(8999) + 1000;
    String randStr = String.valueOf(randNum);
    //将验证码存入session
    session.setAttribute("randStr", randStr);
    //显示到图像中
    g.setColor(Color.BLACK);
    g.setFont(new Font("", Font.PLAIN, 20));
    g.drawString(randStr, 10, 17);
    //随机产生100个干扰点
    for (int i = 0; i < 100; i++) {
        int x = rnd.nextInt(width);
        int y = rnd.nextInt(height);
        g.drawOval(x, y, 1, 1);
    }
    //输出到页面
    ImageIO.write(image, "jpeg", response.getOutputStream());
    out.clear();
    out = pageContext.pushBody();
%>
</body>
</html>
