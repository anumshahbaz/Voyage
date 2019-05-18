<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="theCart.aspx.cs" Inherits="letTheVoyageBegin.theCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/VB">
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
	Dim Product = Button23.SelectedItem.Text
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
                     <asp:Button class="btn_2" ID="Button1" href="#" runat="server" Text="ADD TO CART"/>

           </div>   
        </div>

        <div data-src="images/catcover2.jpg">
            <div class="fadeIn camera_caption">
          <asp:Button class="btn_2" ID="Button2" href="#" runat="server" Text="ADD TO CART"/>

            </div>
        </div>

        <div data-src= "images/catcover3.jpg" >
            <div class="fadeIn camera_caption">
       <asp:Button class="btn_2" ID="Button3" href="#" runat="server" Text="ADD TO CART"/>
     
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
                <asp:Button class="btn_2" ID="Button23" href="#" runat="server" Text="ADD TO CART" onClick="AddToCart"/>  <%--ID is 23!!--%>
                </div>

        </div>
</asp:Content>