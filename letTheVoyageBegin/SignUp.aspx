<%@ Page Title="SignUp" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="True" CodeBehind="SignUp.aspx.cs" Inherits="letTheVoyageBegin.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <br/> <%--<br />--%>
     <div class="row">
         <h2 class="header_1 wrap_8 color_3">
                    <b>Sign up for free! </b>
                </h2>

          <div class =" grid_5">  </div>

            <div class="grid_6">

                <asp:Label ID="Label4" runat="server" ></asp:Label>
                <br />
                <asp:TextBox  ID="Username" placeholder="Username"  type="Text" runat="server" align="center"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" ></asp:Label>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Username."
                    ControlToValidate="Username"></asp:RequiredFieldValidator>--%>
                <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server"
                ShowMessageBox="True" ShowSummary="false" />--%>
                <br />
                <asp:TextBox  ID="email" placeholder="Email" type="email" runat="server"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" ></asp:Label>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter EmailAddress."
                   ControlToValidate="email"></asp:RequiredFieldValidator>--%>

                <br />
                <asp:TextBox  ID="Name"  placeholder="Name" type="Text" runat="server"></asp:TextBox>
                <br />

                <asp:TextBox  ID="Password" runat="server" placeholder="Password" type="password"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" ></asp:Label>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password."
                   ControlToValidate="Password"></asp:RequiredFieldValidator>--%>
                <br />
                <asp:TextBox  ID="Contact" runat="server" placeholder="Contact" type="Text"></asp:TextBox>
                <br />
                <asp:TextBox  ID="Address" runat="server" placeholder="House#,Block,Town" type="Text"></asp:TextBox>
                <br />
                <asp:TextBox  ID="PostalCode" runat="server" placeholder="Postal Code" type="Text"></asp:TextBox>
                <br />
                Date of birth <br />
                <asp:TextBox  ID="DateOfBirth"  placeholder="YYYY-MM-DD" type="Text" runat="server"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" ></asp:Label>
                <br />
                <asp:CompareValidator id="dateValidator" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="DateOfBirth">
                 </asp:CompareValidator>
                <br />
               
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                <asp:Button class="btn_2" href="#" runat="server" Text="Submit" OnClick="button1_Click"  />
                 </div>
                
                <br/>
         </div>

</asp:Content>
