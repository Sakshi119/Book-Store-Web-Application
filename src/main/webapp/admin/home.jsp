<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Home</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
	  <c:redirect url="../login.jsp" />
	</c:if>

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12 p-3 text-center recent">
				<h2>Welcome Back Admin !</h2>
			</div>
			<div class="col-md-12" style="margin-top: 20px;">

				<a href="add_books.jsp" style="margin-top: 20px;">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-folder-plus"
								style="font-size: 40px; padding: 5px; color:#5553e0;"></i><br>
							<h3  style="color: black;font-family: 'Montserrat';">Add Books</h3>
							
						</div>
					</div>
				</a>


			</div>

			<div class="col-md-6" style="margin-top: 20px;">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-book"
								style="font-size: 40px; padding: 5px; color:#5553e0;"></i><br>
							<h3  style="color: black;font-family: 'Montserrat';">All Books</h3>
							
						</div>
					</div>
				</a>
			</div>
			
			

			
			<div class="col-md-6" style="margin-top: 20px;">
				<a data-toggle="modal" data-target="#myModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt"
								style="font-size: 40px; padding: 5px; color:#5553e0;"></i><br>
							<h3  style="color: black;font-family: 'Montserrat';">Logout</h3>
							
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

				</div>
				<div class="modal-body">
					<div class="text-center">
						<h3  style="color: black;font-family: 'Montserrat';">Do you want to logout ?</h3>
						<a type="button" class="btn btn-secondary" data-dismiss="modal">Close</a>
						<a href="../logout" type="button" class="btn btn-primary">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>