<%@ Page Title="SignIn" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="projectDB.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br/>

<%--<%--<head id="Head1" runat="server">--%>
<%--<script src="Registration.js" type="text/javascript"></script>--%>
<%--//</head>--%>

 <div class="row">
     <h2 class="header_1 wrap_8 color_3">
                    <b>Sign in to proceed. </b> 
                </h2>
                
     <div class =" grid_5">                </div>

            <div class="grid_6">
                  <asp:Label ID="Label3" runat="server" ></asp:Label>
                  <br />
                  <asp:TextBox  ID="Username" placeholder="Username" type="text" runat="server" align="center"></asp:TextBox>
                  <asp:Label ID="Label1" runat="server" ></asp:Label>
                  <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Username."
                   ControlToValidate="Username"></asp:RequiredFieldValidator>--%>
                <br />
                 <asp:TextBox  ID="Password" runat="server" placeholder="Password" type="password"></asp:TextBox>
                 <asp:Label ID="Label2" runat="server" ></asp:Label>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Password."
                   ControlToValidate="Username"></asp:RequiredFieldValidator>--%>
                <br /> 
                <br />
                  <asp:Button class="btn_2" href="#" runat="server" Text="Submit" OnClick="Login_Click" />
                  </div> 
                  <br/>
     </div>
</asp:Content>
