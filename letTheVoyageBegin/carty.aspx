<%@ Page debug=true Language="C#" ContentType="text/html" ResponseEncoding="iso-8859-1" %>
<html>
<head>
<title>Shopping Cart</title>
<script type="text/C#" runat="server">
    System.Data.DataTable objDT;
    System.Data.DataRow objDR;
  

    private void Page_Load(object s, EventArgs e)
    {
        if (!IsPostBack)
        {
            makeCart();
            AddToCart(s, e);
        }

    }

    void makeCart()
    {
        if (Session["Cart"] == null) //this makes cart only the first time.
        {
            objDT = new System.Data.DataTable("Cart");
            objDT.Columns.Add("Product#", typeof(int));
            objDT.Columns["Product#"].AutoIncrement = true;
            objDT.Columns["Product#"].AutoIncrementSeed = 1;
            objDT.Columns.Add("Product", typeof(string));

            objDT.Columns.Add("UnitPrice", typeof(Decimal));
            objDT.Columns.Add("Quantity", typeof(int));
            Session["Cart"] = objDT;
        }
    }
    
    void AddToCart(object s, EventArgs e) {
        objDT = Session["Cart"] as System.Data.DataTable;
     
        if (Session["CartInfo"] != null)
        {
            
            List<string> temp = (List<string>)Session["CartInfo"];
            object Product = temp[0];
            
            
             
            bool blnMatch = false;

            foreach (System.Data.DataRow objDR in objDT.Rows)
            {
                string inCart = Convert.ToString(objDR["Product"]);
                string requested = Convert.ToString(Product);
                int result = String.Compare(inCart, requested);
                if (result==0)
                {
                    
                    blnMatch = true;
                    Label1.Font.Name = "Verdana";
                    Label1.Font.Size = 10;
                    Label1.Text ="The Book "+ temp[0] + " Already Exists In Cart.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label2.Font.Name = "Verdana";
                    Label2.Font.Size = 10;
                    Label2.Text = "Update Quantity to Add More Copies To Cart.";
                    Label2.ForeColor = System.Drawing.Color.Red;
                    
                    break;
                    
                }
            }
            if (!blnMatch) //does not exist so we add it once.
            {
                Label1.Text = "";
                Label2.Text = "";
                objDR = objDT.NewRow();
                objDR["Quantity"] = 1; 
                objDR["Product"] = temp[0]; //temp[0] contains bookname, temp[1] contains unitPrice, temp[2] contains count of the same Book Ordered
                objDR["UnitPrice"] = temp[1];
                objDT.Rows.Add(objDR);
            }

            Session["Cart"] = objDT;
            dg.DataSource = objDT;
            dg.DataBind();
            lblTotal.Text = ("$" + GetItemTotal());
           
        }
    }

    Decimal GetItemTotal()
    {
        int intCounter;
        int c, q;
        Decimal decRunningTotal=0;
        for (intCounter = 0; (intCounter
                    <= (objDT.Rows.Count - 1)); intCounter++)
        {
            objDR = objDT.Rows[intCounter];
            c = Convert.ToInt32(objDR["UnitPrice"]);
            q = Convert.ToInt32(objDR["Quantity"]);
            
            decRunningTotal = (decRunningTotal + (c*q));
        }

        return decRunningTotal;
    }

    void Delete_Item(object s, DataGridCommandEventArgs e)
    {
        objDT = Session["Cart"] as System.Data.DataTable;
        objDT.Rows[e.Item.ItemIndex].Delete();
        Session["Cart"] = objDT;
        dg.DataSource = objDT;
        dg.DataBind();
        lblTotal.Text = ("$" + GetItemTotal());
    }
    void BackToShopping(object s, EventArgs e)
    {

        Response.Redirect("Categories.aspx");

    }
    void ResetAllSessions(object s, EventArgs e)
    {

        Session.RemoveAll();
        Response.Redirect("Home.aspx");

    }
    void ModifyCount(object s, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        objDT = Session["Cart"] as System.Data.DataTable;
        if (Session["CartInfo"] != null)
        {

            List<string> temp = (List<string>)Session["CartInfo"];
            object Product = temp[0];
            int q2;
           
            foreach (System.Data.DataRow objDR in objDT.Rows)
            {
                string inCart = Convert.ToString(objDR["Product"]);
                string request = Convert.ToString(Product);
                int result = String.Compare(inCart, request);
                if (result == 0)
                {
                    int amount = Convert.ToInt32(Session["Amount"]);
                    //Response.Write(amount);
                    q2 = Convert.ToInt32(amount);
                    objDR["Quantity"] = q2;
                    break;


                }

            }

            Session["Cart"] = objDT;
            dg.DataSource = objDT;
            dg.DataBind();
            lblTotal.Text = ("$" + GetItemTotal());
            
        }
    }
    protected void DropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList list = (DropDownList)sender;

        TableCell cell = list.Parent as TableCell;
        DataGridItem item = cell.Parent as DataGridItem;

        int index = item.ItemIndex;
        string content = item.Cells[0].Text;

        int amount = 1 + list.SelectedIndex;
        Session["Amount"] = amount;
        ModifyCount(this, e);

    }
    protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            string[] options = { "1", "2", "3","4","5","6","7","8","9","10" };

            DropDownList list = (DropDownList)e.Item.FindControl("ItemDropDown");
            list.DataSource = options;
            list.DataBind();
        }
        
    }
        
    
</script>

</head>
<body>
<%--<form id="Form1" runat="server">--%>
    <h2 class="header_1 wrap_8 color_3">
                    <b>Your Shopping Cart </b> 
                </h2>
<%--<h2 class="header_1 wrap_3 color_3"><asp:Label id="Label3" Text="Your Shopping Cart" Font-Bold="true" runat="server" /> </h2><br /><br />--%>
<asp:Label id="Label1" runat="server" /> <br />
<asp:Label id="Label2" runat="server" /> <br />
<br />
<asp:DataGrid id="dg" runat="server" ondeletecommand="Delete_Item"  AutoGenerateColumns="true" OnItemDataBound="DataGrid1_ItemDataBound">
<columns>
<asp:buttoncolumn buttontype="LinkButton" commandname="Delete" text="Remove Item" /> 

        <asp:TemplateColumn>
            <HeaderTemplate>
                 <asp:Label ID="L1" runat="server" Text="Quantity"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:DropDownList 
                    ID="ItemDropDown" Runat="server"
                    AutoPostBack="True" 
                    OnSelectedIndexChanged="DropDown_SelectedIndexChanged" />
            </ItemTemplate>
        </asp:TemplateColumn>
</columns>
</asp:DataGrid> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br/>
<br/>
     <div class="grid_6">
<asp:Button  class="btn_2" runat="server" Text="Proceed To Checkout" onClick="ResetAllSessions"/>
&nbsp;<asp:Button  class="btn_2" runat="server" Text="Continue Shopping" OnClick="BackToShopping" />
        </div>

<br />
<br/>
Total: 
<asp:Label id="lblTotal" runat="server" />
</form>
</body>
</html>

