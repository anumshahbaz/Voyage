<%@ Page Title="Voyage Bookstore" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="projectDB.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - September08, 2014!></div>

<div class="camera-wrapper">
    <div id="camera" class="camera-wrap">
        <div data-src="images/frontCover2.jpg">
            <div class="fadeIn camera_caption">
                <%--<h2 class="text_1 color_1">Welcome to Voyage</h2>--%>
            </div>   
        </div>

       <%-- <div data-src="images/paper%20books%20boats%20paper%20boat_wallpaperwind.com_89.jpg">--%>
           <div data-src="images/d.jpg">
            <div class="fadeIn camera_caption">
                <h2 class="text_1 color_1">Let reading take you places.</h2>
                <%--<a class="btn_1" href="#">More info</a>--%>
            </div>
        </div>

        <div data-src= "images/yup.jpg" >
            <div class="fadeIn camera_caption">
                <h2 class="text_1 color_1">
                    Discover Literary events and exhibitions.
                </h2>
                <a class="btn_2" href="#">More info</a>
            </div>
        </div>

    </div>
</div>

<div class="container">
    <div class="wrap_1a wrap_5a">     
        <div class="grid_6a">
            <div class="box_1">
                <a class="btn_2" href="SignUp.aspx">SIGN UP</a>
                <a class="btn_2" href="SignIn.aspx">LOGIN</a>
                <br/>
            </div><br/>
        </div>   
    </div>
</div>

<div class="bg_1 wrap_2a wrap_4">
    <div class="container">
        <div class="row">
            <div class="preffix_2 grid_8">
                <h2 class="header_1 wrap_3 color_3">
                    Best book-delivery services<br/>
                    with reasonable charges.
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="grid_12">
                <div class="box_1">
                    <p class="text_3">
                       Order books to your doorstep.
                        <br/>
                       <br/>
                       We provide the services to navigate and search your favourite books online 
                        <br /> and get them delivered to you within no time.
                        <br/>
                        <br/>
                        Let the <asp:Label ID="bold" runat="server" Text=" Voyage " Font-Bold="true"></asp:Label> begin!
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row wrap_1">
        <div class="grid_6">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <div class="put-left"><img src="images/index_img03.png" alt="Image 1"/></div>
                    <%--<div class="caption">--%>
                        <h3 class="text_2 color_2">
                            Save Your Time <br/>
                            with Us.
                        </h3>
                        <p class="text_3">
                           Search books.Order anytime.And give cash on delivery. We will save you the hassle of visiting bookstores.
                        </p>
                        <%--<a href="#" class="btn_2">read more</a>--%>
                    <%--</div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_6">
                <%--<div class="wrap_6">--%>
                    <div class="box_2 maxheight2">
                        <div class="put-left"><img src="images/index_img02.png" alt="Image 2"/></div>
                        <%--<div class="caption">--%>
                            <h3 class="text_2 color_2">
                                Very Easy <br/>
                                and Fun To Use.
                            </h3>
                            <p class="text_3">
                                We provide an interactive environment for you in which ratings and reviews will assist you in making a choice.
                            </p>
                            <%--<a href="#" class="btn_2">read more</a>--%>
                        <%--</div>--%>
                    </div>
               <%-- </div>--%>
        </div>
    </div>
</div>


</section>


</asp:Content>
