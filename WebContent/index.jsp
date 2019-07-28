<%@page import="dao.TaiKhoanDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Chấm Công kỹ Thuật</title>
	<link rel="stylesheet" type="text/css" href="css/" />
	<style>
		body {font-family: Arial, Helvetica, sans-serif;
			width: 50%;
			margin: 0px auto;
			
		}
		form {border: 3px solid #f1f1f1;}
		
		input[type=text], input[type=password] {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  box-sizing: border-box;
		}
		
		button {
		  background-color: #4CAF50;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		}
		
		button:hover {
		  opacity: 0.8;
		}
		
		.cancelbtn {
		  width: auto;
		  padding: 10px 18px;
		  background-color: #f44336;
		}
		
		.imgcontainer {
		  text-align: center;
		  margin: 24px 0 12px 0;
		}
		
		img.avatar {
		  width: 40%;
		  border-radius: 50%;
		}
		
		.container {
		  padding: 16px;
		}
		
		span.psw {
		  float: right;
		  padding-top: 16px;
		}
		
		/* Change styles for span and cancel button on extra small screens */
		@media screen and (max-width: 300px) {
		  span.psw {
		     display: block;
		     float: none;
		  }
		  .cancelbtn {
		     width: 100%;
		     color: yellow;
		  }
		}
	</style>
</head>

<body>

	<h2>Đăng Nhập</h2>
	
	<form action="Login" method="get">
	  <div class="imgcontainer">
	    <img src="https://www.w3schools.com/howto/img_avatar2.png" alt="Avatar" class="avatar">
	  </div>
	
	  <div class="container">
	    <label for="uname"><b>Username</b></label>
	    <input type="text" placeholder="Enter Username" name="uname" required>
	
	    <label for="psw"><b>Password</b></label>
	    <input type="password" placeholder="Enter Password" name="psw" required>
	        
	    <button type="submit">Login</button>
	    <label>
	      <input type="checkbox" checked="checked" name="remember"> Remember me
	    </label>
	  </div>
	
	  <div class="container" style="background-color:#f1f1f1">
	    <button type="button" class="cancelbtn">Cancel</button>
	    <span class="psw">Forgot <a href="#">password?</a></span>
	  </div>
	</form>	
						
</body>
</html>