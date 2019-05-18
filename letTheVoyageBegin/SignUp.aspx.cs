using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using letTheVoyageBegin.DAL;

namespace letTheVoyageBegin
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = "abc";
            var temp = Session.Contents;
            Response.Write(temp);
        }
        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        protected void button1_Click(object sender, EventArgs e)
        {
            myDal objmyDal = new myDal();
            string uName = Username.Text;
            string passCode = Password.Text;
            string emailID = email.Text;
            string dob = DateOfBirth.Text;
            if (uName == string.Empty && emailID == string.Empty && passCode == string.Empty && dob == string.Empty)
            {
                //all non-nullable fields empty at the same time, hence customer notified about all of them.
               
                Label4.Text = "";
                Label1.Font.Name = "Verdana";
                Label1.Font.Size = 10;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label2.Font.Name = "Verdana";
                Label2.Font.Size = 10;
                Label2.ForeColor = System.Drawing.Color.Red;
                Label3.Font.Name = "Verdana";
                Label3.Font.Size = 10;
                Label3.ForeColor = System.Drawing.Color.Red;
                Label5.Font.Name = "Verdana";
                Label5.Font.Size = 10;
                Label5.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Please Enter Username.";
                Label2.Text = "Please Enter Email Address.";
                Label3.Text = "Please Enter Password.";
                Label5.Text = "Please Enter a Valid Date of Birth.";
               
                return;
            }

            if (uName== string.Empty) //only username field is empty
            {

                //Response.Write("Try Again");
                // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Try Again.')", true);
                Label3.Text = "";
                Label4.Text = "";
                Label2.Text = "";
                Label5.Text = "";

                Label1.Font.Name = "Verdana";
                Label1.Font.Size = 10;
                Label1.Text = "Please Enter Username.";
                Label1.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (emailID== string.Empty)
            {
               
                Label3.Text = "";
                Label1.Text = "";
                Label4.Text = "";
                Label5.Text = "";

                Label2.Font.Name = "Verdana";
                Label2.Font.Size = 10;
                Label2.Text = "Please Enter Email Address.";
                Label2.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (passCode== string.Empty)
            {
                
                Label4.Text = "";
                Label1.Text = "";
                Label2.Text = "";
                Label5.Text = "";

                Label3.Font.Name = "Verdana";
                Label3.Font.Size = 10;
                Label3.Text = "Please Enter Password.";
                Label3.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (dob== string.Empty)
            {
                
                Label4.Text = "";
                Label1.Text = "";
                Label3.Text = "";
                Label2.Text = "";
                
                Label5.Font.Name = "Verdana";
                Label5.Font.Size = 10;
                Label5.Text = "Please Enter a Valid Date of Birth.";
                Label5.ForeColor = System.Drawing.Color.Red;
                return;
            }
           
            

            if ((IsValidEmail(email.Text)))
            {
                string verifiedUsername=null;
                int inserted = -99;
                
                string name=Name.Text;
                string num=Contact.Text;
                string address=Address.Text;
                string pCode=PostalCode.Text;

                inserted = objmyDal.insertionForSignup(uName,passCode,emailID,name,dob,num,address,pCode,ref verifiedUsername);
                
                if (inserted == 1)
                {
                    
                    //objmyDal.setUserType(uName);

                    SqlConnection con = new SqlConnection("Server=localhost; Database= projectVoyage; Integrated Security=True;");
                   
                    SqlCommand cmd = new SqlCommand();
               
                    SqlDataReader dr;
                    con.Open();
                    cmd.Connection = con;

                    cmd.CommandText = "Select * FROM Db.[User] WHERE UserName = '" + uName + "'";
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    //Response.Write("some problem");
                    if (dr.HasRows)
                    {

                        Session["username"] = Username.Text;
                        var temp=Session.Contents;
                        Response.Write(temp);

                        Response.Redirect("Home.aspx");
                    }

                    else
                    {
                        //Response.Write("Query Unsuccessful");
                        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Query Unsuccessful')", true);
                        Label3.Text = "";
                        Label1.Text = "";
                        Label2.Text = "";
                        Label5.Text = "";

                        Label4.Font.Name = "Verdana";
                        Label4.Font.Size = 10;
                        Label4.Text = "Please Re-enter Data.";
                        Label4.ForeColor = System.Drawing.Color.Red;
                        

                    }

                    con.Close();
                    Session["UserName"] = uName;
                    
                    Response.Redirect("Home.aspx");

                }
                else if (inserted == -1)
                {
                    //Response.Write("email exists");
                    //Response.Write(verifiedUsername);
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + verifiedUsername + "')", true);
                    Label3.Text = "";
                    Label1.Text = "";
                    Label4.Text = "";
                    Label2.Font.Name = "Verdana";
                    Label2.Font.Size = 10;
                    Label2.Text = "Email Address Already Being Used.";
                    Label2.ForeColor = System.Drawing.Color.Red;

                }
                else if (inserted == 0)
                {
                    //Response.Write("USER ALREADY EXISTS....PLEASE LOGIN INSTEAD...");
                    //Response.Write(verifiedUsername);
                    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + verifiedUsername + "')", true);
                    Label3.Text = "";
                    Label2.Text = "";
                    Label4.Text = "";
                    Label1.Font.Name = "Verdana";
                    Label1.Font.Size = 10;
                    Label1.Text = verifiedUsername;
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (!(IsValidEmail(email.Text)))
            {
                //Response.Write("Email Address Invalid");
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email Address Invalid.')", true);
                Label3.Text = "";
                Label1.Text = "";
                Label4.Text = "";
                Label2.Font.Name = "Verdana";
                Label2.Font.Size = 10;
                Label2.Text = "Email Address Not Valid.";
                Label2.ForeColor = System.Drawing.Color.Red;
            }

        }
   
    }
}