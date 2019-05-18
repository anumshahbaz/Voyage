using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using letTheVoyageBegin.DAL;


namespace projectDB
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_Click(object sender, EventArgs e)
        {
            myDal objmyDal = new myDal();

            int check = -99;
            string uName = Username.Text;
            string passCode = Password.Text;

            if (uName== string.Empty || passCode == string.Empty)
            {
                Label2.Text = "";
                Label1.Text = "";
                Label3.Font.Name = "Verdana";
                Label3.Font.Size = 10;
                Label3.Text = "Please fill out all fields.";
                Label3.ForeColor = System.Drawing.Color.Red;
               
                return;
            }
            //Response.Write("minus one");   
            check = objmyDal.checkingForlogin(uName, passCode);
           
            //Response.Write("zero");   
            if (check == 1)
            {
                //SqlConnection con = new SqlConnection("Server=localhost; Database= projectVoyage; Integrated Security=True;");

                //SqlCommand cmd = new SqlCommand();

                //SqlDataReader dr;
                //con.Open();
                //cmd.Connection = con;
                //cmd.CommandText = "Select * FROM Db.[User] WHERE UserName = '" + uName + "' AND Passcode ='" + passCode  + "'";

                //dr = cmd.ExecuteReader();
                //dr.Read();
                //if (dr.HasRows)
                //{
                   // Response.Write("one");
                    Session["UserName"] = uName;

                    Response.Redirect("Home.aspx");
                //}
                    //con.Close();
            }
            else if (check == 2)
            {
               
                //Response.Write("Password Incorrect");
               // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password Incorrect')", true);
                Label3.Text = "";
                Label1.Text = "";
                Label2.Font.Name = "Verdana";
                Label2.Font.Size = 10;
                Label2.Text = "Password is Incorrect.";
                Label2.ForeColor = System.Drawing.Color.Red;
                
            }
            else if (check == 3)
            {
                //Response.Write("three");
               // Response.Write("Username does not exist. Sign up first");
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username does not exist. Sign up first')", true);
                Label3.Text = "";
                Label2.Text = "";
                Label1.Font.Name = "Verdana";
                Label1.Font.Size = 10;
                Label1.Text = "Please Signup First.";
                Label1.ForeColor = System.Drawing.Color.Red;
                //Page.Response.Redirect(Page.Request.Url.ToString(), true);
              
            }
            //Response.Write("four");

    }
  
    }
}