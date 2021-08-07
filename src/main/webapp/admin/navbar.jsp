
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<nav class="navbar navbar-light justify-content-between nav-color-o"
	style="margin-bottom: 0px;">
	<a class="navbar-brand logo">Online Book Store</a>


	<div>

		<c:if test="${not empty userobj }">
			<a href="../login.jsp"><button type="button"
					class="btn btn-color-o" style="font-size: 17px;">

					<i class="fas fa-user" style="margin-right: 5px;"></i>
					${userobj.name}
				</button></a>
			<a data-toggle="modal" data-target="#myModal"><button
					type="button" class="btn btn-color-o" style="font-size: 17px;">
					<i class="fas fa-sign-out-alt" style="margin-right: 5px;"></i>Logout
				</button></a>
		</c:if>


		<c:if test="${empty userobj }">
			<a href="../login.jsp"><button type="button"
					class="btn btn-color-o" style="font-size: 17px;">

					<i class="fas fa-user" style="margin-right: 5px;"></i>Login
				</button></a>
			<a href="../register.jsp"><button type="button"
					class="btn btn-primary  btn-color-o" style="font-size: 17px;">
					<i class="fas fa-sign-in-alt" style="margin-right: 5px;"></i>Register
				</button></a>

		</c:if>


	</div>

</nav>

<!-- Logout Modal start -->


<div class="container">


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						style="font-size: 17px;">&times;</button>

				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you want to logout ?</h4>
						<a type="button" class="btn  btn-color-o" data-dismiss="modal"
							style="font-size: 17px;">Close</a> <a href="../logout"
							type="button" class="btn  btn-color-o" style="font-size: 17px;">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>


<!-- Logout modal end -->


<nav class="navbar navbar-expand-lg navbar-light nav-color">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fas fa-house-user" style="margin-right: 5px;"></i>Home <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link" href="../index.jsp"><i
					class="fas fa-street-view" style="margin-right: 5px;"></i>View as
					User <span class="sr-only">(current)</span> </a></li>
		</ul>
	</div>

</nav>