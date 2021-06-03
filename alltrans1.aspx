<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alltrans1.aspx.cs" Inherits="index" %>

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
         
            <li ><a href="userhome.aspx">Home</a></li>
          <li><a href="newcard.aspx">New Card</a></li>
          <li><a href="cardregister.aspx">Card Register</a></li>
          <li><a href="fraud.aspx">Fraud Transaction</a></li>
          <li class="active"><a href="alltrans1.aspx">All Transaction</a></li>
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
    
                 <form id="form1" runat="server">
  <section id="registerform" class="registerform" style="padding-top:100px;background-color:antiquewhite">
     <div style="background-color:antiquewhite">
      
      
       <div style="min-width:100%;float:left;color:white;background-color:antiquewhite;height:550px;">
         <h1 style="color:black;">All Transactions</h1>
           <asp:GridView ID="GridView1" runat="server" CssClass="table table-responsive" CellPadding="3" EmptyDataText="No Data"  OnRowCommand="GridView1_RowCommand" 
        EmptyDataRowStyle-ForeColor="green" Width="100%" Style="color:black" HeaderStyle-ForeColoe="White" HeaderStyle-BackColor="Green" 
        BackColor="White" BorderColor="Black" BorderStyle="None" BorderWidth="1px" EnableModelValidation="true" AutoGenerateColumns="false" AllowPaging="true"
    OnPageIndexChanging="OnPageIndexChanging" PageSize="12" OnRowDeleting="GridView1_RowDeleting"  >
        <Columns>
        
            <asp:BoundField DataField="Tranid" HeaderText="Tran Id" SortExpression="Tranid" />
            <asp:BoundField DataField="Bname" HeaderText="Bank Name" SortExpression="Bname" />
            <asp:BoundField DataField="Cname" HeaderText="Card #" SortExpression="Cname" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Dated" HeaderText="Date" SortExpression="Dated" />
            <asp:BoundField DataField="Ipaddr" HeaderText="Ip address" SortExpression="Ipaddr" />
              <asp:BoundField DataField="Stat" HeaderText="Status" SortExpression="Stat" />
            </Columns>

    </asp:GridView>
      </div>
</div>
   
  </section>
                     </form>
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

</body>

</html>
