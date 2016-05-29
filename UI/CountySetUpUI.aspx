<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountySetUpUI.aspx.cs" Inherits="FinalProject.CountySetUpUI"EnableEventValidation="false"  ValidateRequest="false"%>


<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="UTF-8">
    <title>Country City Information App</title>
    <!-- Bootstrap Core CSS -->
   
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->

    <link href="../css/the-big-picture.css" rel="stylesheet" />
    <link href="../css/font-icon.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="../css/flexslider.css" rel="stylesheet" type="text/css" />
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/animate.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>

<body id="hme">
    <form id="form1" runat="server">
        
         <div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <a class="navbar-brand" href="#">Country City Management</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                   
                    <li><a class="page-scroll" href="#">Home</a> </li>
                    <li><a class="page-scroll" href="CountySetUpUI.aspx">Country SetUp</a> </li>
                    <li><a class="page-scroll" href="#intro">City SetUp</a> </li>
                    <li><a class="page-scroll" href="CountryViewUI.aspx">View Countries</a> </li>
                    <li><a class="page-scroll" href="login.aspx">View Cities</a> </li>
                </ul>
            </div>
        </div>
    </div>
        
         <section id="contact" class="home-section text-center">
		<div class="heading-contact">
			<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-offset-2">
					
					<div class="section-heading">
					<div class="wow bounceInDown" data-wow-delay="0.4s">
					<h2> Give the Country Info </h2>
					</div>
				<%--	<p class="wow lightSpeedIn" data-wow-delay="0.3s">Gentleman, introduce your self and get in touch with me privately</p>--%>
					</div>
					
				</div>
			</div>
			</div>
		</div>
		<div class="container">

    <div class="row">
        <div class="col-lg-8 col-md-offset-2">
            <div class="form-wrapper marginbot-50">
                <form id="contact-form" >
                <div class="row">
    
                        <div class="form-group">
                            
                            <asp:Label runat="server"></asp:Label>
                            <input type="text" class="form-control" id="nameText" name="nameText" runat="server" placeholder="Enter name" required="required" />
                        </div>
 
          
             
                        <div class="form-group">
                            <asp:Label runat="server"></asp:Label>
                            <textarea name="aboutTextArea" id="aboutTextArea" runat="server" class="form-control" rows="9" cols="25" required="required"
                                placeholder="About Info"></textarea>
                        </div>
       
                    <asp:Button ID="saveButton" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="saveButton_Click" />
                    <asp:Button ID="cancelButton" CssClass="btn btn-primary" runat="server" Text="Cancel" OnClick="cancelButton_Click" />

                </div>
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                </form>
				
            </div><br /><br />
			<%--<div class="text-center">
					<p class="lead"><i class="fa fa-phone"></i> Call me +9 4578 1254 1452</p>
			</div>--%>
        </div>

    </div>	

		</div>
	</section>
        
        <div class="content-last">
        <%--<div class="container">--%>
            
            <asp:GridView ID="countryGridView" runat="server" AutoGenerateColumns="False" CssClass="display" >
                 <Columns>
                <asp:TemplateField HeaderText="SL#">
                    <ItemTemplate><%#Container.DataItemIndex+1 %></ItemTemplate>
                </asp:TemplateField>
            </Columns>
             <Columns>
                <asp:TemplateField HeaderText="Country Name">
                     <ItemTemplate><%#Eval("CountryName") %></ItemTemplate>
                 </asp:TemplateField>
            </Columns>
             <Columns>
                <asp:TemplateField HeaderText="About">
                     <ItemTemplate><%#Eval("About") %></ItemTemplate>
                 </asp:TemplateField>
            </Columns>
     
            </asp:GridView>

        </div>
    <%--</div>--%>
    <!-- /Section: contact -->
    <!-- Footer section -->
    <footer class="footer">
  <div class="footer-top section-tb">
    <div class="container">
      <div class="row">
        <div class="footer-col col-md-4">
          <h5>Project From BITM</h5>
          <p>Country City Information Managemnt App</p>
          <p>Copyright © 2016 .All Rights Reserved</p>
        </div>
        <div class="footer-col col-md-3">
          <h5>Team Members</h5>
          
          <ul>
            <li><a href="#">Md.Al-Amin Hossain</a></li>
            <li><a href="#">Jannatul Ferdous</a></li>
            <li><a href="#">Aminul Isalm</a></li>
            <li><a href="#">Nusrat Jahan</a></li>
            
          </ul>
     
        </div>
        <div class="footer-col col-md-3">
          <h5>Navigation</h5>
          <ul class="">
            <li><a href="CountySetUpUI.aspx">Country SetUp</a></li>
            <li><a href="#intro">City SetUp</a> </li>
            <li><a href="CountryViewUI.aspx">View Countries</a></li>
            <li><a href="login.aspx">View Cities</a></li>
          </ul>
        </div>
         
      </div>
    </div>
  </div>
  <!-- footer top --> 
  
</footer>
    <!-- Footer section -->
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.easing.min.js"></script>
        <script src="../js/jquery.flexslider-min.js"></script>
        <script src="../js/jquery.fancybox.pack.js"></script>
        <script src="../js/wow.js"></script>
        <script src="../js/retina.min.js"></script>
        <script src="../js/modernizr.js"></script>
        <script src="../js/main.js"></script>
        <script src="../js/jquery-1.12.0.min.js"></script>
        <script src="../js/jquery.dataTables.min.js"></script>
        <script src="../ckeditor/ckeditor.js"></script>

   <%-- <script type="text/javascript">
        //WOW Scroll Spy
        var wow = new WOW({
            //disabled for mobile
            mobile: false
        });
        wow.init();
    </script>--%>
        
        
        <script type="text/javascript">
            $(function () {
                CKEDITOR.replace('<%=aboutTextArea.ClientID %>', { filebrowserImageUploadUrl: '/Upload.ashx' });
            });
        </script>
 
        <script>

            $(document).ready(function () {
                $(".display").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                    "lengthMenu": [[5, 25, 50, -1], [5, 10, 15, "All"]]
                });
            });

    </script>

        
    </form>
</body>
</html>
