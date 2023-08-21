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
<title>Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit Your Note</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		
		Session s= FactoryProvider.getFactory().openSession();
		Note note = (Note)s.get(Note.class,noteId);
		%>
		
		<!--this is add from-->
		<form action="UpdateNote" method="post">
			<input type="hidden" value="<%=note.getId()%>" name="noteId"/>
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> 
				<input name="title" required type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter here" value="<%=note.getTitle()%>"/>
			</div>
			<div class="mb-3">
				<label for="content">Note Content</label>
				<textarea name="content" required id="content" placeholder="Enter content here" class = "form-control" style="height:300px"><%=note.getContent()%></textarea>
				
			</div>
			
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your Note</button>
			</div>
		</form>
		
	</div>
	
</body>
</html>