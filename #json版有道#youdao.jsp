<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<input type="text" id="word" style="width:200px">
	<button id="btn" >button</button>
	<div id="result"></div>
	
	<script type="text/javascript">
		(function(){
			
			var ajaxGetJson = function(url,fn){
				var createXmlHttp = function(){
					var xmlHttp = null;
					if(window.ActiveXObject){
						xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					}else{
						xmlHttp = new XMLHttpRequest();
					}
					return xmlHttp;
				};
			
			var xmlHttp = createXmlHttp();
			
			xmlHttp.open("get",url);
			
			xmlHttp.onreadystatechange = function(){
				
				var statCode = xmlHttp.readyState;
				if(statCode == 4){
					if(xmlHttp.status == 200){
						var resultDiv = document.getElementById("result");
						var json = xmlHttp.responseText;
						json = JSON.parse(json);
						fn(json);
					}else{
						alert("服务器出错"+xmlHttp.status);
					}
				}
			};
			xmlHttp.send();
		}
		document.getElementById("btn").onclick = function(){
			var word = document.getElementById("word").value;
			ajaxGetJson("/youdao.json?word="+word,function(json){
				document.getElementById("result").innerHTML = json.translation[0];
			});
		};
	})();
	</script>
</body>
</html>
