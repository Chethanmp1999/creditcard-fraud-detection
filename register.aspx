<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="index" %>

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
          <li class="active"><a href="register.aspx">Register</a></li>
          <li><a href="login.aspx">Login</a></li>
          <li><a href="contact.aspx">Contact</a></li>
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

  <!-- Section: intro   background-image:url('./img/tran.jpg')  -->
  <section id="registerform" class="registerform" style="padding-top:100px;background-color:antiquewhite">
     <div style="background-color:antiquewhite">
      
      
       <div style="min-width:40%;float:left;color:white;background-color:antiquewhite;height:550px;">
          <img src="img/reg.png" style="width:100%;height:550px;" />
      </div>
      <div style="min-width:60%;float:left;background-color:antiquewhite;height:550px;font-size:20px;">      
      <form runat="server" id="cardRegisterForm">
          <h3 style="text-align:center;">Create Account</h3>
          <table class="nav-justified">
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="Name" runat="server" Text="Name : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;<asp:TextBox ID="NameTB" runat="server" AutoPostBack="true" style="border: 2px solid #73AD21;border-radius: 25px;width:200px;" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="Label8" runat="server" Text="Email Id : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;<asp:TextBox ID="email" runat="server" style="border: 2px solid #73AD21;border-radius: 25px;width:200px;"></asp:TextBox></td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
                    <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="Label4" runat="server" Text="Phone : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;<asp:TextBox ID="phone" runat="server" style="border: 2px solid #73AD21;border-radius: 25px;width:200px;"></asp:TextBox></td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="Label2" runat="server" Text="DOB : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                     <asp:TextBox  type="date" id="dt1" runat="server" OnTextChanged="Calendar1_SelectionChanged" AutoPostBack="true"> </asp:TextBox>
                      
                  </td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="Label3" runat="server" Text="Age : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;<asp:TextBox ID="TextBox2" runat="server" style="border: 2px solid #73AD21;border-radius: 25px;width:200px;" ReadOnly="true"></asp:TextBox>Years</td>
                  <td>&nbsp;</td>
              </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="Label1" runat="server" Text="Username : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;<asp:TextBox ID="TextBox1" runat="server" style="border: 2px solid #73AD21;border-radius: 25px;width:200px;" ReadOnly="true"></asp:TextBox></td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Label ID="PasswordLbl" runat="server" Text="Password : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;<asp:TextBox ID="PasswordTb" runat="server" TextMode="Password" style="border: 2px solid #73AD21;border-radius: 25px;width:200px;" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
             
              <tr>
                  <td>&nbsp;</td>
                  <td align="right">
                      <asp:Button style="border-radius:25px;" CssClass="btn btn-danger" ID="Button1" runat="server" Text="Reset" OnClick="Button1_Click" />&nbsp;</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button style="border-radius:25px;" CssClass="btn btn-success" ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" OnClientClick="return Validator();" /></td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
          </table>
          
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

         var unamer = document.getElementById('NameTB').value;
         var intRegexunamer = /^[A-Za-z ]+$/;
         if (!intRegexunamer.test(unamer)) {
             alert('Please enter a valid name.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }

       
         var age = document.getElementById('TextBox2').value;
         var intRegexage = /^[0-9]{2}$/;
         if (!intRegexage.test(age)  || parseFloat(age)<18) {
             alert('Please enter a valid age.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         var email = document.getElementById('email').value;
         var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
         if (!emailReg.test(email) || email == '') {
             alert('Please enter a valid email id.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         var unamer = document.getElementById('TextBox1').value;
         var intRegexunamer = /^[A-Za-z0-9 ]+$/;
         if (!intRegexunamer.test(unamer)) {
             alert('Please enter a valid username.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }



         var pswd = document.getElementById('PasswordTb').value;


         var pswdPattern = /^[A-Za-z0-9]{5,8}$/;
         if (!pswdPattern.test(pswd)) {
             alert('Please enter min 5 max 8 characters password.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }



         return flag;
     }
 </script>







</body>

</html>
