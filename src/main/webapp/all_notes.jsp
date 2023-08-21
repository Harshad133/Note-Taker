<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@ page import="org.hibernate.Session"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class='container'>
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes ::</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();

				for (Note note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width: 100px;"
						src="img/notes.png" alt="...">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p><b class="text-primary"><%=note.getAddedDate() %></b></p>
						<div class="container text-center mt-2">
							<a href="DeleteNote?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>
				<%
				}
				s.close();
				%>
			</div>
		</div>
</body>
</html>