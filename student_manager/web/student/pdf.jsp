<%@ page import="com.itextpdf.text.Document" %>
<%@ page import="com.itextpdf.text.pdf.PdfWriter" %>
<%@ page import="com.itextpdf.text.Paragraph" %>
<%@ page import="com.itextpdf.text.pdf.BaseFont" %>
<%@ page import="com.itextpdf.text.Font" %>
<%@ page import="com.itextpdf.text.PageSize" %>
<%@ page import="com.itextpdf.text.Element" %>
<%@ page import="com.itextpdf.text.pdf.PdfPTable" %>
<%@ page import="com.itextpdf.text.pdf.PdfPCell" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.DataOutput" %>
<%@ page import="java.io.DataOutputStream" %>
<%--
  Created by IntelliJ IDEA.
  User: 007
  Date: 2018/11/25
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//  制作PDF文件, 通过流的形式输送到客户端
    response.setContentType("application/pdf");
    response.addHeader("Content-Disposition", "attachment;filename=report.pdf");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String major = request.getParameter("major");
    String database = request.getParameter("database");
    String android = request.getParameter("android");
    String jsp = request.getParameter("jsp");

    try {
        Document doc = new Document(PageSize.A4);
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(doc, buffer);
        BaseFont bf = BaseFont.createFont(request.getSession().getServletContext().getRealPath("/")+"resources/font/msyh.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
        Font font = new Font(bf, 15, Font.NORMAL);

        doc.open();
        Paragraph paragraph = new Paragraph("成绩单", font);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        doc.add(paragraph);
        doc.add(new Paragraph(" "));

        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_CENTER);

        PdfPCell cell;
        cell = new PdfPCell(new Paragraph("学号", font));
        cell.setRowspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("姓名", font));
        cell.setRowspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("专业", font));
        cell.setRowspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("成绩", font));
        cell.setColspan(3);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        table.addCell(new Paragraph("数据库", font));
        table.addCell("Android");
        table.addCell("JavaWeb");
        table.addCell(id);
        table.addCell(new Paragraph(name, font));
        table.addCell(new Paragraph(major, font));
        table.addCell(database);
        table.addCell(android);
        table.addCell(jsp);
        doc.add(table);
        doc.close();

        DataOutput output = new DataOutputStream(response.getOutputStream());
        byte[] bytes = buffer.toByteArray();
        response.setContentLength(bytes.length);
        for( int i = 0; i < bytes.length; i++ ) {
            output.writeByte( bytes[i] );
        }
    }
    catch (Exception e){
        out.print(e);
    }
%>
</body>
</html>
