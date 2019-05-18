<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temp.aspx.cs" Inherits="letTheVoyageBegin.temp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<body>
    <form id="form2" runat="server">
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
			EnableModelValidation="True">
			<Columns>
				<asp:TemplateField HeaderText="My Test Field">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server"></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
            
        </div>
    </form>
</body>
</html>