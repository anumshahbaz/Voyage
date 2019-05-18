
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