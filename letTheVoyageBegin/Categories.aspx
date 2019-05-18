<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="letTheVoyageBegin.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/C#" runat="server">
    int counter;

    void ShiftToCartPage(object s, EventArgs e)
    {

        Button btn = (Button)s;
        //string resultString = Regex.Match(btn.ID, @"\d+").Value;
        //Int32.Parse(resultString);
        //Response.Write(resultString);
        //resultString = "L" + resultString;
       // Response.Write(resultString);
        
        
        string bookname = FindBookUsingID(s,e);
        string  unitPrice = Convert.ToString(btn.CommandArgument);
        
        List<string> temp = new List<string>();
        temp.Add(bookname);
        temp.Add(unitPrice);
       
        
        Session["CartInfo"] = temp;

        Response.Redirect("carty.aspx");


    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
            <div class="grid_12">
                <h2 class="header_1 wrap_8 color_3">
                    <b>Categories</b> 
                </h2>
                </div>
        </div>
    
    <div class="camera-wrapper">
    <div id="camera" class="camera-wrap">

        <div data-src="images/catcover1.jpg">
            <div class="fadeIn camera_caption">
<%--                <a class="btn_2" href="#">ADD TO CART</a> --%> 
                     <asp:Button class="btn_2" id="Button0" href="#" runat="server" Text="ADD TO CART"/>

           </div>   
        </div>

        <div data-src="images/catcover2.jpg">
            <div class="fadeIn camera_caption">
          <asp:Button class="btn_2" ID="Button1" href="#" runat="server" Text="ADD TO CART"/>

            </div>
        </div>

        <div data-src= "images/catcover3.jpg" >
            <div class="fadeIn camera_caption">
       <asp:Button class="btn_2" ID="Button2" href="#" runat="server" Text="ADD TO CART"/>
     
            </div>
        </div>

    </div>
</div>



    <div class="container">
    <div class="row wrap_1a">

        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            DA VINCI CODE
                        </h3>
                        <p class="text_3">
                           Graham Masterton
                        </p><br />
                    <div><img src="images/b1.png" alt="Image 1"/></div>
                  
                        <br />
                <asp:Label ID="L3" runat="server" ></asp:Label>
                <asp:Button class="btn_2" ID="Button3" href="#" runat="server" CommandArgument="25.00" Text="ADD TO CART" onClick="ShiftToCartPage"/>
                </div>

        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            FAULT IN OUR STARS
                        </h3>
                        <p class="text_3">
                          John Green
                        </p><br />
                    <div><img src="images/b2.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
                      <asp:Button class="btn_2" ID="Button4" href="#" runat="server" Text="ADD TO CART" CommandArgument="35.00" onClick="ShiftToCartPage"/>   
                   
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            PRICE OF DAWN
                        </h3>
                        <p class="text_3">
                           John Green
                        </p><br />
                    <div><img src="images/b3.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
                   <asp:Button class="btn_2" ID="Button5" href="#" runat="server" Text="ADD TO CART" CommandArgument="45.00" onClick="ShiftToCartPage"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            PAPER TOWNS
                        </h3>
                        <p class="text_3">
                           John Green
                        </p><br />
                    <div><img src="images/b4.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
                   <asp:Button class="btn_2" ID="Button6" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <br />
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            VISION OF WHITE
                        </h3>
                        <p class="text_3">
                           Nora Roberts
                        </p><br />
                    <div><img src="images/b5.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
                 <asp:Button class="btn_2" ID="Button7" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            BLUE SMOKE
                        </h3>
                        <p class="text_3">
                           Nora Roberts
                        </p><br />
                    <div><img src="images/b6.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
              <asp:Button class="btn_2" ID="Button8" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            MAZE RUNNER
                        </h3>
                        <p class="text_3">
                           James Dashner
                        </p><br />
                    <div><img src="images/b7.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
            <asp:Button class="btn_2" ID="Button9" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            HUNGER GAMES
                        </h3>
                        <p class="text_3">
                           Suzanne Collins
                        </p><br />
                    <div><img src="images/b8.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
            <asp:Button class="btn_2" ID="Button10" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>

        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            Panem
                        </h3>
                        <p class="text_3">
                           Suzanne Collins
                        </p><br />
                    <div><img src="images/b9.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
           <asp:Button class="btn_2" ID="Button11" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            INSURGENT
                        </h3>
                        <p class="text_3">
                           Veronica Roth
                        </p><br />
                    <div><img src="images/b10.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
          <asp:Button class="btn_2" ID="Button12" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            DIVERGENT
                        </h3>
                        <p class="text_3">
                           Veronica Roth
                        </p><br />
                    <div><img src="images/b11.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
               <asp:Button class="btn_2" ID="Button13" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            ALLEGIANT
                        </h3>
                        <p class="text_3">
                           Veronica Roth
                        </p><br />
                    <div><img src="images/b12.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
               <asp:Button class="btn_2" ID="Button14" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>

        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            FOUR
                        </h3>
                        <p class="text_3">
                           Veronica Roth
                        </p><br />
                    <div><img src="images/b13.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
            <asp:Button class="btn_2" ID="Button15" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            EVE OF ISLE
                        </h3>
                        <p class="text_3">
                           Carol Rivers
                        </p><br />
                    <div><img src="images/b18.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
       <asp:Button class="btn_2" ID="Button16" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            HARRY POTTER
                        </h3>
                        <p class="text_3">
                           JK Rowling
                        </p><br />
                    <div><img src="images/b16.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
           <asp:Button class="btn_2" ID="Button17" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            THE BEST OF ME
                        </h3>
                        <p class="text_3">
                           Nicholas Sparks
                        </p><br />
                    <div><img src="images/b17.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
            <asp:Button class="btn_2" ID="Button18" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>

        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            BLEAK MIDWINTER
                        </h3>
                        <p class="text_3">
                           Peter Millar
                        </p><br />
                    <div><img src="images/b19.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
                <asp:Button class="btn_2" ID="Button19" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            TAKEN FOR DEAD
                        </h3>
                        <p class="text_3">
                           Graham Masterton
                        </p><br />
                    <div><img src="images/b22.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
            <asp:Button class="btn_2" ID="Button20" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            GREAT ESCAPE
                        </h3>
                        <p class="text_3">
                           William S.
                        </p><br />
                    <div><img src="images/b23.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
      <asp:Button class="btn_2" ID="Button21" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
        <div class="grid_3">
           <%-- <div class="wrap_6">--%>
                <div class="box_2 maxheight2">
                    <h3 class="text_2 color_2">
                            <br />
                            DIRTY POLITICS
                        </h3>
                        <p class="text_3">
                           Nicky Hager
                        </p><br />
                    <div><img src="images/b29.png" alt="Image 1"/></div>
                    <%--<div class="pull-right">--%>
                        <br />
                 <asp:Button class="btn_2" ID="Button22" href="#" runat="server" Text="ADD TO CART"/>
                   <%-- </div>--%>
                    <%--<div class="clearfix"></div>--%>
                </div>
          <%--  </div>--%>
        </div>
    </div>
</div>


</asp:Content>
