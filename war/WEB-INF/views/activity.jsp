<%@ page session="false" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<title>Chat App</title>
		<script type="text/javascript" src="/scripts/jquery-1.4.min.js"></script>
		<script type="text/javascript" src="/scripts/json.min.js"></script>		
		<script src="/scripts/jquery-ui-1.7.2.custom.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/scripts/pomodoro.js"></script>
		<link rel="stylesheet" href="/styles/base.css" type="text/css" media="screen" charset="utf-8"/>
 		<link rel="stylesheet" href="/styles/sunny/jquery-ui-1.7.2.custom.css" type="text/css" media="screen" charset="utf-8"/>
  
	
	</head>
	<body>
	
	<body>
	<div id="container">
		<div id="header">
			<h1>Pomodoro - Time Management!</h1>
    </div>
		<div id="content">
			<h2>
				Welcome!
			</h2>

<c:choose>
  <c:when test="${!empty user}">
    <a class="steelblue"  href="${logoutHref}">sign
    out</a>
    
    <div id="tabs" >
				<ul >
					<li ><a href="#tabs-1">ActivityList</a></li>
					<li ><a href="#tabs-2">Todo</a></li>
					<li><a href="#tabs-3">Manage</a></li>
					<li><a href="#tabs-4">Report</a></li>
				</ul>
				<div id="tabs-1" >
			<form id="lstform">
			<input type="text"  id="listName"  size= "70" name="listName"/>
			<input type="submit" id ="listSubmit" value="Add"/>
			</form>
  			
				</div>
				<div id="tabs-2" >Phasellus mattis tincidunt nibh. Cras orci urna, blandit id, pretium vel, aliquet ornare, felis. Maecenas scelerisque sem non nisl. Fusce sed lorem in enim dictum bibendum.</div>
				<div id="tabs-3">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
				<div id="tabs-4">Nam dui erat, auctor a, dignissim quis, sollicitudin eu, felis. Pellentesque nisi urna, interdum eget, sagittis et, consequat vestibulum, lacus. Mauris porttitor ullamcorper augue.</div>
			</div>
    
       
		
		   </div>
    
  </c:when>
  <c:otherwise>
    <p><a class="steelblue" href="${loginHref}">Sign in</a></p>
  </c:otherwise>
</c:choose>


  
      


		<div id="footer">
			<p>
				&copy; Copyright 2010 RoshiniOnline 
			</p>
		</div>
	</div>
</body>
	

	
</html>
