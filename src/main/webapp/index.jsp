<!DOCTYPE html>
<%@ taglib  uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html lang="en">
<head>
  <title>Library management system</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">HOME</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="allBooks">All Books</a></li>
      <li><a href="new">New Book</a></li>      
    </ul>
  </div>
</nav>
  
<div class="container">  	
  	<c:choose>
  		<c:when test="${mode == 'HOME'}">
			<div class="jumbotron text-center">
			  <h1>Library Management Portal</h1>
			  <p>A demo project created using Spring Boot and Hibernate. Books are stored in a mysql database.</p>
			</div>
			
			<div class="container">
			  <div class="row">
			    <div class="col-sm-4">
			      <h3>Column 1</h3>
			      <p>LLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum..</p>
			    </div>
			    <div class="col-sm-4">
			      <h3>Column 2</h3>
			      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			    </div>
			    <div class="col-sm-4">
			      <h3>Column 3</h3>
			      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			    </div>
			  </div>
			</div>
  		</c:when>
  		  	
  		<c:when test="${mode=='BOOK_SHOW'}">
    		<table class="table table-hover">
			    <thead>
			      <tr>
			        <th>Id</th>
			        <th>Book Name</th>
			        <th>Author</th>
			        <th>Purchase Date</th>
			        <th>Edit</th>
			        <th>Delete</th>       			    
			      </tr>
			    </thead>
			    <tbody>
	    			<c:forEach var="book" items="${books}">
			      		<tr>
			      			<td> ${book.id}</td>
			      			<td> ${book.bookName}</td>
			      			<td> ${book.author}</td>
			      			<td> ${book.purchaseDate}</td>
			      			<td><a href="update?id=${book.id}"><div class="glyphicon glyphicon-pencil"></div></a></td>
			      			<td><a href="delete?id=${book.id}"><div class="glyphicon glyphicon-trash"></div></a></td>			      			
			      		</tr>
			      	</c:forEach>
	      		</tbody>
  			</table>
		</c:when>
		<c:when test="${mode == 'BOOK_UPDATE' || mode == 'BOOK_NEW'}">
			<form action="save" method = "POST">
				  <input type="hidden" class="form-control" value="${book.id}" id="id" name="id">
				  <div class="form-group">
				    <label for="bookName">Book Name:</label>
				    <input type="text" class="form-control" value="${book.bookName}" id="bookName" name="bookName">
				  </div>
				  <div class="form-group">
				    <label for="author">Author:</label>
				    <input type="text" class="form-control" value="${book.author}" id="author" name="author">
				  </div>
				  
				  <div class="form-group">
				    <label for="purchaseDate">Purchase Date:</label>
				    <input type="date" class="form-control" value="${book.purchaseDate}" id="purchaseDate" name="purchaseDate">
				  </div>
				  
				  <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</c:when>
	</c:choose> 
</div>

</body>
</html>
