<%@page import="com.entity.User"%>

<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Books</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

<%
		User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<% 
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	
	%>
		
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName() %>" style="height: 200px; width: 150px"><br>
				<h4 class="mt-3">
				Book Name:<span class="text-success"><%=b.getBookName() %></span>
				</h4>
				<h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span>
				</h4>
				<h4>Category:<span class="text-success"><%=b.getBookCategory() %></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName() %></h2>
				
				<%
				if("Old".equals(b.getBookCategory()))	
				{%>
					<h4 class="text-primary">Contact To Seller</h4>
					<h5 class="text-primary"><i class="fas fa-envelope-open-text"></i>Email: <%=b.getEmail() %></h5>
					<%-- <h5 class="text-primary"><i class="fas fa-envelope-open-text"></i>Phone No: <%=b.getPhno() %></h5> --%>
				<%}
				
				%>
				<div class="row">
				<div class="col-md-4 text-success text-centr p-3 ">
				<i class="fas fa-money-bill-wave fa-2x"></i>
				<p>Cash On Delivery </p>
				</div>
				<div class="col-md-4 text-danger text-centr p-3 ">
				 <i class="fas fa-undo-alt fa-2x"></i>
				<p>Return Available </p>
				</div>
				<div class="col-md-4 text-primary text-centr p-3 ">
				<i class="fas fa-truck fa-2x"></i>
				<p>Free Shipping</p>
				</div>
					
				</div>
					<%
					if("Old".equals(b.getBookCategory())){
					%>
					<div class="text-center p-3">
				<a href="index.jsp" class="btn btn-success"><i
								class="fas fa-cart-plus"></i>Continue Shopping</a>
				<a href="" class="btn btn-danger"><i
								class="fas fa-rupee-sign"></i> 200</a>
 				</div>	
					<%
					}else{
					%>
						<div class="text-center p-3">
				<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-primary"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
				<a href="" class="btn btn-danger"><i
								class="fas fa-rupee-sign"></i> 200</a>
 				</div>
					<%}
					%>		
			</div>
		</div>
	</div>
</body>
</html>