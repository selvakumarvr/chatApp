<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<title>Chat App</title>
		<script type="text/javascript" src="/scripts/jquery-1.4.min.js"></script>
		<script type="text/javascript" src="/scripts/json.min.js"></script>		
		<script type="text/javascript">

		$(document).ready(function(){

			$("#exit").click(function(){
				var exit = confirm("Are you sure you want to end the session?");
				if(exit==true){
					$("#wrapper").hide();
					 $("#loginform").show();
					  $("#user").empty();
					  $("#name").empty();
					}
			});
			$("#wrapper").hide();
		
			  $("#enter").click(function(){
				    $("#user").val($("#name").val());
				    $("#loginform").hide();
					$("#wrapper").show();
				  });
			
			timestamp = 0;
		
			updateMsg();
			
			$("#message").submit(function(){
			
				var message = $(this).serializeObject();
			
				$.postJSON("chat",message, function(data) {
				
					$("#msg").val("");
							addMessages(data); 

				
				});
				return false;
			});
		});
		function addMessages(data) {
		   
			if(data.status == "2") return;
		
			
			var messages = data.messages;

			timestamp = data.time;
		
						for (var i = 0; i < data.messages.length; i++) {

					$("#messagewindow").prepend("<b>"+data.messages[i].user+
							"</b>: "+ data.messages[i].msg+
							"<br />");	
					
				
					}
				

		}
		function updateMsg() {
		
		
			$.getJSON("chat/updateMsg",{currentDate : timestamp}, function(data) {
				
				$("#loading").remove();
				addMessages(data);
			});
			setTimeout('updateMsg()', 4000);
		}
	</script>
	<style type="text/css">
	
	body {
	  font: 12 px arial;
	  color: #222;
	  text-align:center;
	  padding:35px;
	
	}
	
	form, p, span {
	margin:0;
	padding:0;
	}
	input (
	font:12px arial;
	}
	a{
	color:#0000FF;
	text-decoration:none;
	}
	
	a:hover {text-decoration:underline;}
	
   #msg{
    width:395px;
    border: 1px solid #ACD8F0;
   }
		#wrapper, #loginform {
		 margin:0 auto;
		 padding-bottom:25px;
		 background:#EBF4FB;
		 width:504px;
		 border:1px solid #ACD8F0;
		}
		
		.welcome { float:left; }

.logout { float:right; }
#submit { width: 60px; }
#loginform { padding-top:18px; }

	#loginform p { margin: 5px; }

#menu { padding:12.5px 25px 12.5px 25px; }
		#messagewindow {
			text-align:left;
			margin:0 auto;
			margin-bottom:25px;
			padding:10px;
			background:#fff;
			height:270px;
			width:430px;
			border:1px solid #ACD8F0;
			overflow:auto;
		}
	</style>
	</head>
	<body>
	
	<div id="loginform">
	
		<p>Please enter your name to continue:</p>
		<label for="name">Name:</label>
		<input type="text" name="name" id="name" />
		<input type="submit" name="enter" id="enter" value="Enter" />

	</div>
		<div id="wrapper">
	
		<div id="chatwindow">
		<div id ="menu">
			<p class ="welcome"> Welcome, <b></b></p>
			<p class="logout"> <a id="exit" href="#"> Exit Chat</a></p>
			<div style="clear:both"></div>
		</div>
	<p id="messagewindow"><span id="loading">Loading1...</span></p>
	<form:form  modelAttribute="message" method="post">
	

	<form:hidden path="user" />
	Message: 	<form:input path="msg" />    
   
	<input id="create" type="submit" value="ok" /><br />
	</form:form>
	</div>
	</div>
	</body>
	
	
</html>
