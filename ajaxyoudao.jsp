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
			
			var createXmlHttp = function(){
				var xmlHttp = null;
				if(window.ActiveXObject){
					xmlHttp = new ActiveXObject();
				}else{
					xmlHttp = new XMLHttpRequest();
				}
				return xmlHttp;
			};
			
			document.getElementById("btn").onclick = function(){
				var xmlHttp = createXmlHttp();
				var word = document.getElementById("word").value;
				xmlHttp.open("get","/youdao.do?word="+word);
				
				xmlHttp.onreadystatechange = function(){
					
					var statCode = xmlHttp.readyState;
					if(statCode == 4){
						if(xmlHttp.status == 200){
							var resultDiv = document.getElementById("result");
							var xml = xmlHttp.responseXML;
							var translation = xml.getElementsByTagName("translation")[0];
							var paragraph = translation.getElementsByTagName("paragraph")[0].childNodes[0].nodeValue;
							resultDiv.innerHTML = paragraph;
						}else{
							alert("服务器出错"+xmlHttp.status);
						}
					}
				};
				xmlHttp.send();
			};
		})();
	</script>
</body>
</html>
