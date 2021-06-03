<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newcard.aspx.cs" Inherits="index" %>

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
          <li><a href="userhome.aspx">Home</a></li>
          <li class="active"><a href="newcard.aspx">New Card</a></li>
          <li><a href="cardregister.aspx">Card Register</a></li>
          <li><a href="trans.aspx">Transaction</a></li>
          <li><a href="fraud.aspx">Fraud Transaction</a></li>
              <li><a href="alltrans1.aspx">All Transaction</a></li>
            <%--<!--<li><a href="message.aspx">View Messages</a></li>-->--%>
          <li><a href="login.aspx">Logout</a></li>
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
      
     
       <div style="min-width:40%;float:left;color:white;background-color:antiquewhite;height:550px;">
          <img src="img/card.jpg" style="width:100%;height:550px;" />
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
                      <asp:Label ID="Label1" runat="server" Text="Bank Name : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                     <select id="sel" style="width:150px; height:30px;" runat="server">
		            <option value="0">  --Select--  </option>
		            <option value="ICICI Bank"> ICICI Bank </option>
		            <option value="State Bank"> State Bank </option>
		            <option value="Axis Bank"> Axis Bank </option>
		            <option value="Vijaya Bank"> Vijaya Bank </option>
		            </select>
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
                      <asp:Label ID="PasswordLbl" runat="server" Text="Credit Limit : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                      <select id="slt" style="width:150px; height:30px;" runat="server">
		            <option value="0">  --Select--  </option>
		            <option> 25,000 </option>
		            <option> 50,000 </option>
		            <option> 75,000 </option>
		            <option> 1,00,000 </option>
		            </select>

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
                      <asp:Label ID="Label2" runat="server" Text="Document Proof : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                      <asp:FileUpload ID="FileUpload1" runat="server" />

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
                      <asp:Label ID="Label3" runat="server" Text="PAN Number : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                     <input type="text" id="pan" placeholder="Enter PAN Number"  runat="server"/>
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
                      <asp:Label ID="Label4" runat="server" Text="Aadhar Number : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                     <input type="text" id="num" placeholder="Enter Aadhar Number"  runat="server"/>
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
                      <asp:Label ID="Label5" runat="server" Text="Phone Number : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                     <input type="text" id="phone" placeholder="Enter phone Number"  runat="server"/>
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
                      <asp:Label ID="Label6" runat="server" Text="Address : " style="font-weight:bolder;"></asp:Label>&nbsp;</td>
                  <td>&nbsp;
                     <textarea id="addr"  runat="server"></textarea>
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
                      <asp:Button style="border-radius:25px;" CssClass="btn btn-danger" ID="Button1" runat="server" Text="Reset" OnClick="Button1_Click" />&nbsp;</td>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button style="border-radius:25px;" CssClass="btn btn-success" ID="Button2" runat="server" Text="Save Data" OnClick="Button2_Click" OnClientClick="return Validator();" /></td>
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
                     &nbsp;</td>
                  
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

         var bname = document.getElementById('sel').value;
         var slt = document.getElementById('slt').value;
         var pan = document.getElementById('pan').value;
         var num = document.getElementById('num').value;
         var addr = document.getElementById('addr').value;




         if (bname=="0") {
             alert('Please select bank name.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         if (slt == "0") {
             alert('Please select credit limit.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         var intRegexnamer = /^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}$/;
         if (!intRegexnamer.test(pan)) {
             alert('Please enter a pan number.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         var intRegex = /^[0-9]{12}$/;
         if (!intRegex.test(num)) {
             alert('Please enter a valid aadhar number.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }


         var phone = document.getElementById('phone').value;
         var intRegex = /^(7|8|9)[0-9]{9}$/;
         if (!intRegex.test(phone)) {
             alert('Please enter a valid phone number.');
             flag = false;
             return flag;
         }
         else {
             flag = true;
         }



         if (addr == "") {
             alert('Please enter address');
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
