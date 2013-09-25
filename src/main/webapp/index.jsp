<?xml version="1.0" encoding="UTF-8" ?> 
<html
  xmlns:jsp="http://java.sun.com/JSP/Page"
  xmlns:c="http://java.sun.com/jsp/jstl/core"
  xmlns:fn="http://java.sun.com/jsp/jstl/functions" >
  <head>
    <jsp:directive.page contentType="text/html;charset=UTF-8"></jsp:directive.page> 
    <script type="text/javascript" src="js/easyXDM/v2.4.18/json2.js"><jsp:text/></script>
  </head>
  <body bgcolor="white">
    <h2>Sample intuit.com QBO plugin</h2>
    Frame origin: <div id="frameOrigin">...</div><br/>
    V3 Service call to company info via XHR<div id="urlLabel">...</div><br/>
    <textarea id="main" disabled="true" rows="30" cols="80">Loading...</textarea>
    <script type="text/javascript">
            var myRequest = new XMLHttpRequest();
            myRequest.onreadystatechange=function() {
                if (myRequest.readyState==4 && myRequest.status==200) {
                    var result = JSON.stringify(JSON.parse(myRequest.responseText), null, 4);
                    document.getElementById("main").value = result;
                }
            }
            var url = 'https://qbo.local.intuit.com/qbo1/v3/company/${cookie["qbn.ptc.parentid"].value}/companyinfo/${cookie["qbn.ptc.parentid"].value}';
            document.getElementById("urlLabel").innerHTML = url;
            document.getElementById("frameOrigin").innerHTML = location.href;
            myRequest.open("GET",url,true);
            myRequest.withCredentials = true;
            myRequest.setRequestHeader("Content-Type","application/json");
            myRequest.setRequestHeader("Accept","application/json");
            myRequest.setRequestHeader("CsrfToken", '${cookie["qbn.ptc.tkt"].value}');
            myRequest.send();
    </script>
  </body>
</html>
