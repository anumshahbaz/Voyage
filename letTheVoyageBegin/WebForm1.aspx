<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="letTheVoyageBegin.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <form id="form2" runat="server">
        <%--<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
        <script runat="server">
 
            void ValidateBtn_OnClick(object sender, EventArgs e)
            {
 
                // Display whether the page passed validation.
                if (Page.IsValid)
                {
 
                    Message.Text = "Page is valid.";
 
                }
 
                else
                {
 
                    Message.Text = "Page is not valid!";
 
                }
 
            }
 
            void ServerValidation(object source, ServerValidateEventArgs args)
            {
 
                try
                {
                    // Test whether the value entered into the text box is even.
                    int i = int.Parse(args.Value);
                    args.IsValid = ((i % 2) == 0);
 
                }
 
                catch (Exception ex)
                {
                    args.IsValid = false;
                }
                 
                if (!args.IsValid)
                {
                    (Text1 as RadTextBox).BorderColor = System.Drawing.Color.FromArgb(255, 0, 0);
                }
 
            }
 
        </script>
        <br />
        <h3>CustomValidator ServerValidate Example</h3>
 
        <asp:Label ID="Message"
            Text="Enter an even number:"
            Font-Names="Verdana"
            Font-Size="10pt"
            runat="server"
            AssociatedControlID="Text1" />
             
        <br />
 
         
        <telerik:RadTextBox runat="server" ID="Text1"></telerik:RadTextBox>
         
 
      <asp:CustomValidator ID="CustomValidator1"
          ControlToValidate="Text1"
          Display="Static"
          ErrorMessage="Not an even number!"
          OnServerValidate="ServerValidation"
          runat="server" />
 
        <br />
 
        <asp:Button ID="Button1"
            Text="Validate"
            OnClick="ValidateBtn_OnClick"
            runat="server" />
        <br />
        <br />--%>
        <%-- <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Shopping Cart</h1></div>--%>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4" > 
        <%--ItemType="WingtipToys.Models.CartItem" SelectMethod="GetShoppingCartItems"  
        CssClass="table table-striped table-bordered"--%>   
        <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />        
        <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />        
        <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
        <asp:TemplateField   HeaderText="Quantity">            
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="Quantity"></asp:TextBox> 
                </ItemTemplate>        
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Item Total">            
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>        
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Remove Item">            
                <ItemTemplate>
                    <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
    </asp:GridView>
</form>
    
    </div>
    </form>
</body>
</html>
