<%@page import="context.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Order</title>
</head>
<body>
    <%-- Lấy oid từ request --%>
    <% String oidStr = request.getParameter("oid");
       int oid = Integer.parseInt(oidStr);
    
    %>
    <%-- Tạo đối tượng OrderDAO --%>
    <% OrderDAO orderDAO = new OrderDAO();
    
    %>
    <%-- Xóa đơn hàng và kiểm tra kết quả --%>
    <% if(orderDAO.deleteOrder(oid)) { %>
        <h2>Đơn hàng đã được xóa thành công!</h2>
    <% } else { %>
        <h2>Xóa đơn hàng thất bại!</h2>
    <% } %>
</body>
</html>