<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.admin.servlet.BooksAdd"%>
<%@page import="com.entity.user"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books | Admin</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="navbar.jsp"%>

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<div class="col-md-12 text-center recent">
							<h2>Edit Books</h2>
						</div>

						


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../editbooks" method="post">
						
                            <input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="email">Book Name</label> <input type="text"
									class="form-control" placeholder="Enter name" id="name"
									value="<%=b.getBookName()%>" name="bname" required>
							</div>
							<div class="form-group">
								<label for="email">Author Name</label> <input type="text"
									class="form-control" placeholder="Enter name" id="name"
									value=" <%=b.getAuthor()%>" name="author" required>
							</div>
							<div class="form-group">
								<label for="email">Price</label> <input type="text"
									class="form-control" placeholder="Enter name" id="name"
									value="<%=b.getPrice()%>" name="price" required>
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">

									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>

									
									

								</select>
							</div>
							<div class="form-group">
								<label for="examleFormControlFile1">Update Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-color-o"
									style="width: 118px;">Update</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>