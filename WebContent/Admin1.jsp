<!DOCTYPE html>
<html>
<script>
function checkForm()
{
	var uname = document.forms["Admin1"]["uname"];
	var uname = document.forms["Admin1"]["password"];

if((document.Admin1.uname.value.length>32))
{
alert("Please Valid  User Id ");
return false;
}
if((document.Admin1.password.value.length<6))
{
alert("Please enter valid  password");
return false;
}
}
</script>
<head>
<meta charset="ISO-8859-1">
<title>WLCOME TELEPHONE ADMIN PAGE</title>
<style type="text/css">
body{
margin:0px;
padding:0px;
font-family:"Helvetica Neue",Helvetica,Arial;
background-color:#808080;
}
#sidebar{
background:blue;
width:200px;
height:100%;
display:block;
position:absolute;
left:-200px;
top:0px;
transition:left 0.3s linear;
}
#sidebar.visible{
left:0px;
transition:left 0.3s linear;
}
#sidebar-btn{
display:inline-block;
vertical-align:middle;
width:20px;
height:15px;
cursor:pointer;
margin:20px;
}
#sidebar-btn span{
height:1px;
background:#111;
margin-bottom:5px;
display:block;
}
ul{
margin:0px;
padding:0px;
}
ul li{
list-style:none;

}
ul li a{
background:blue;
color:#ccc;
border-bottom:1px solid #111;
display:block;
width:180px;
padding:10px;
text-decoration:none;
}

</style>
</head>
<body>
<div id="sidebar"  class="visible">
<ul>
         <li><a href="#">DASHBOARD</a></li>
         <li><a href="home.jsp">HOME</a></li>
        <li><a href="Admin1.jsp">ADMIN ENTERY</a></li>
      <li><a href="#">ABOUT</a></li>
       
       
       
</ul>
</div>

<div id="sidebar-btn">
<span></span>
<span></span>
<span></span>
 
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#sidebar-btn').click(function(){
		$('#sidebar').addClass('visible');
			});
	});
</script>

</style>
</head>

<body bgcolor="#808080">
                 <h1 align="center"><font color="">WELCOME TO HOME PAGE OF ADMIN</font></h1>

<br></br><br></br>
<form name="Admin1"  action="admin.jsp" method="post" onSubmit=" return checkForm()">
<p align="center">
<pre>                     
                                                                       UserId  <input type="text" name="uname">
                          			  
                                                                      Password <input type="password" name="password">			
	   
		                                                                       <input type="submit" name="submit" value="SUBMIT">
						                                                 
						                                                 <a href="forget1.jsp">FORGET PASSWORD</a>	
 
                                                                 
							</pre>	
					</p>
							</form>

</body>
</html>