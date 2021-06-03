<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="index" enableEventValidation="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Credit Card Fraud Detection</title>

  <!-- Bootstrap Core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Fonts -->
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="css/animate.css" rel="stylesheet" />
  <!-- Squad theme CSS -->
  <link href="css/style.css" rel="stylesheet">
  <link href="color/default.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: Squadfree
    Theme URL: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
  <!-- Preloader -->
  <div id="preloader">
    <div id="load"></div>
  </div>

  <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="background-color:#668cff">
    <div class="container">
      <div class="navbar-header page-scroll">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
        <a class="navbar-brand" href="index.aspx">
          <h1>Credit Card - Avenue</h1>
        </a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-right navbar-main-collapse" style="background-color:#ccd9ff;">
        <ul class="nav navbar-nav">
          <li><a href="index.aspx">Home</a></li>
          <li><a href="aboutus.aspx">About</a></li>
          <li><a href="register.aspx">Register</a></li>
          <li><a href="login.aspx">Login</a></li>
          <li class="active"><a href="contact.aspx">Contact</a></li>
<%--          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="#">Example menu</a></li>
              <li><a href="#">Example menu</a></li>
              <li><a href="#">Example menu</a></li>
            </ul>
          </li>--%>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
  </nav>

  <!-- Section: intro -->
  <section id="registerform" class="registerform" style="padding-top:100px;background-color:antiquewhite">
     <div style="background-color:antiquewhite">
      
      
      <%-- <div style="min-width:40%;float:left;color:white;background-color:antiquewhite;height:550px;">
          </div>--%>
      <div style="min-width:100%;float:left;background-color:antiquewhite;height:550px;font-size:20px;">      
      <form runat="server" id="cardRegisterForm">
          <h3 style="text-align:center;">Contact Us</h3>
         <div class="col-lg-8">
							<form class="form-area " id="myForm" >
								<div class="row">	
									<div class="col-lg-12 form-group">
										Enter Name : <input name="name" placeholder="Enter your name" runat="server" id="uname" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" class="common-input mb-20 form-control" required="" type="text">
									<br />
                                        From Email : <input type="text" placeholder="Enter email address" runat="server" id="frmemail" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="common-input mb-20 form-control" required="">
                                        <br />
										TO Email : <input type="text" placeholder="Enter email address" runat="server" id="eml" value="mpchethan456@gmail.com" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="common-input mb-20 form-control" required="">
                                        <br />
										Enter Subject : <input name="subject" placeholder="Enter your subject" runat="server" id="sub" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your subject'" class="common-input mb-20 form-control" required="" type="text">
										<br />Enter Message : <div class="mt-20 alert-msg" style="text-align: left;" ></div>
									
										<textarea class="common-textarea form-control" name="message" runat="server" id="msg" placeholder="Messege" onfocus="this.placeholder = ''"  rows="6" onblur="this.placeholder = 'Messege'" required=""></textarea>
										<br /><button class="genric-btn primary circle mt-30" style="float: right;" onserverclick="Unnamed_ServerClick" runat="server">Send Message</button>								
									</div>
								</div>
							</form>	
						</div>      
      </form>

      </div>
</div>
   
  </section>
  <!-- /Section: intro -->


  <!-- Core JavaScript Files -->
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.min.js"></script>
  <script src="js/jquery.scrollTo.js"></script>
  <script src="js/wow.min.js"></script>
  <!-- Custom Theme JavaScript -->
  <script src="js/custom.js"></script>
  <script src="contactform/contactform.js"></script>
     <script>
     function Validator() {
         debugger;
         var flag = true;

         var unamer = document.getElementById('uname').value;
         if(unamer =="")
             {
             alert('Please entername.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }




         var frm = document.getElementById('frmemail').value;
         if (frm=="") {
             alert('Please enter Mail id.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         var subb = document.getElementById('sub').value;
         if (subb == "") {
             alert('Please enter Subject');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }

         //var cont = document.getElementById('msg').value;
         //if (subb == "") {
         //    alert('Please enter Message');
         //    flag = false;
         //    return flag;
         //}
         //else {
         //    flag = true;
         //}

         return flag;
     }
 </script>

</body>

</html>
