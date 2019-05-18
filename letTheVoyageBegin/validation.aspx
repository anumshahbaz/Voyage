<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validation.aspx.cs" Inherits="letTheVoyageBegin.validation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
     function fnOnUpdateValidators(){
   for (var i = 0; i < Page_Validators.length; i++)
   {
      var val = Page_Validators[i];
      var ctrl = document.getElementById(val.controltovalidate);
      if (ctrl != null && ctrl.style != null)
      {
         if (!val.isvalid)
            ctrl.style.background = '#FFAAAA';
         else
            ctrl.style.backgroundColor = '';
      }
   }
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
