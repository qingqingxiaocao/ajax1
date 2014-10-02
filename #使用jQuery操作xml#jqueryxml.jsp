<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<button id="btn">Button</button>
	<ul id="result">
	
	</ul>
	<script src="js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			$.get("/student.xml",function(data){
				//简化版的循环
				$(data).find("student").each(function(){
					var id = $(this).attr("id");
					var name = $(this).find("name").text();
					var age = $(this).find("age").text();
					console.log(id);
					console.log(name);
					console.log(age);
					
				});
				
				
				/*
				var students = $(data).find("student");
				for(var i = 0;i < students.length;i++){
					var $student = $(students[i]);
					var id = $student.attr("id");
					var name = $student.find("name").text();
					var age = $student.find("age").text();
					//console.log(name);
					//console.log(age);
					
				var ul = document.getElementById("result");
					var span = document.createElement("span");
					var li = document.createElement("li");
					var strong = document.createElement("strong");
					
					var idNode = document.createTextNode(id);
					var nameNode = document.createTextNode(name);
					var ageNode = document.createTextNode(age);
					
					span.appendChild(idNode);
					strong.appendChild(ageNode);
					
					li.appendChild(span);
					li.appendChild(nameNode);
					li.appendChild(strong);
					
					ul.appendChild(li); 
				}*/
				//用jquery追加元素
				$("#result").append($("<li>").append($("<span>").text(id)).append($("<name>").text(name)).append($("<strong>").html($("<age>").text(age))));
				
			});
		});
	});
		
	</script>
</body>
</html>
