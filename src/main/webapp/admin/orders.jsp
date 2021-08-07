<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders| Admin</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="navbar.jsp"%>



	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<div class="col-md-12 text-center recent">
							<h2>Welcome Back Admin!</h2>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Order Id</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Address</th>
									<th scope="col">Contact</th>
									<th scope="col">Book name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Payment Type</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
									<td>Mark</td>
									<td>Otto</td>
									<td>@fat</td>
									<td>Mark</td>
									<td>Otto</td>

								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
									<td>Mark</td>
									<td>Otto</td>
									<td>@fat</td>
									<td>Mark</td>
									<td>Otto</td>


								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Larry</td>
									<td>the Bird</td>
									<td>@twitter</td>
									<td>Mark</td>
									<td>Otto</td>
									<td>@fat</td>
									<td>Mark</td>
									<td>Otto</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>