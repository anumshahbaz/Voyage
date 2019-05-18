<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="letTheVoyageBegin.Search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/C#" runat="server">
    

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
</head>
<body>
    <form id="form1" runat="server">
    <div>
  
    <%--<asp:FileUpload ID="FileUpload1" runat="server"/>
    <asp:Button ID="btnUpload" runat="server" Text="Upload"
        OnClick="btnUpload_Click" />--%>
    </div>
    <div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns = "false"
            Font-Names = "Arial" >
            <Columns>
            <asp:BoundField DataField = "ID" HeaderText = "ID" />
            <asp:BoundField DataField = "FileName" HeaderText = "Image Name" />
            <asp:ImageField DataImageUrlField="FilePath" ControlStyle-Width="200"
            ControlStyle-Height = "200" HeaderText = "Preview Image"/>
            <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:Button class="btn_2" href="#" ID="searchCart" runat="server" CausesValidation="false" Text="ADD TO CART" onClick="ShiftToCartPage"/>
            </ItemTemplate>
        </asp:TemplateField>
            </Columns>
            </asp:GridView>
     </div>
    </form>
</body>
</html>
