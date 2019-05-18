<%@ Page debug="true" Language="VB" ContentType="text/html" ResponseEncoding="iso-8859-1" %>
<html>
<head>
<title>Shopping Cart</title>
<script runat="server">
Dim objDT As System.Data.DataTable 
Dim objDR As System.Data.DataRow

Private Sub Page_Load(s As Object, e As EventArgs)
     If Not IsPostBack Then
          makeCart()
     End If
End Sub

Function makeCart()
     objDT = New System.Data.DataTable("Cart")
     objDT.Columns.Add("ID", GetType(Integer))
     objDT.Columns("ID").AutoIncrement = True
     objDT.Columns("ID").AutoIncrementSeed = 1

     objDT.Columns.Add("Quantity", GetType(Integer))
     objDT.Columns.Add("Product", GetType(String))
     objDT.Columns.Add("Cost", GetType(Decimal))
 
     Session("Cart") = objDT
End Function

Sub AddToCart(s As Object, e As EventArgs)
	objDT = Session("Cart")
	Dim Product = ddlProducts.SelectedItem.Text
	Dim blnMatch As Boolean = False

	For Each objDR In objDT.Rows
		If objDR("Product") = Product Then
			objDR("Quantity") += txtQuantity.Text
			blnMatch = True
			Exit For
		End If
	Next

	If Not blnMatch Then
	objDR = objDT.NewRow
	objDR("Quantity") = txtQuantity.Text
	objDR("Product") = ddlProducts.SelectedItem.Text
	objDR("Cost") = Decimal.Parse(ddlProducts.SelectedItem.Value)
	objDT.Rows.Add(objDR)
	End If
	Session("Cart") = objDT

	dg.DataSource = objDT
	dg.DataBind()
	
	lblTotal.Text = "$" & GetItemTotal()
End Sub

Function GetItemTotal() As Decimal
	Dim intCounter As Integer
	Dim decRunningTotal As Decimal
	
	For intCounter = 0 To objDT.Rows.Count - 1
		objDR = objDT.Rows(intCounter)
		decRunningTotal += (objDR("Cost") * objDR("Quantity"))
	Next
	
	Return decRunningTotal 
End Function

Sub Delete_Item(s As Object, e As DataGridCommandEventArgs)
     objDT = Session("Cart")
     objDT.Rows(e.Item.ItemIndex).Delete()
     Session("Cart") = objDT

     dg.DataSource = objDT
     dg.DataBind()

     lblTotal.Text = "$" & GetItemTotal()
End Sub
</script>

</head>
<body>
<form runat="server">
Product:<br/>
<asp:DropDownList id="ddlProducts" runat="server">
<asp:ListItem Value="4.99">Socks</asp:ListItem>
<asp:ListItem Value="34.99">Pants</asp:ListItem>
<asp:ListItem Value="14.99">Shirt</asp:ListItem>
<asp:ListItem Value="12.99">Hat</asp:ListItem>
</asp:DropDownList><br/>
Quantity:<br/>
<asp:textbox id="txtQuantity" runat="server" /><br/><br/>
<asp:Button id="btnAdd" runat="server" Text="Add To Cart" onClick="AddToCart" /><br/><br/>
<asp:DataGrid id="dg" runat="server" ondeletecommand="Delete_Item">
<columns>
<asp:buttoncolumn buttontype="LinkButton" commandname="Delete" text="Remove Item" />
</columns>
</asp:DataGrid>
<br/><br/>
Total: 
<asp:Label id="lblTotal" runat="server" />
</form>
</body>
</html>
