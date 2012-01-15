$(document).ready(function(){
	
  $('#tabs').tabs();
  
	$("form#lstform").submit(function(){
		alert('form submitted');
		alert($("#listName").val());
		
		$.post("account",{listName : $("#listName").val()}, function(data) {
			alert('callback');
			alert(eval(data));
			$("#assignedId").val(data.x);
			alert(data);
			alert(data["x"]);
		});

	
	});
  
	

	
});

