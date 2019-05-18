using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using letTheVoyageBegin.DAL;
using System.IO;

namespace letTheVoyageBegin
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
            string strQuery = "select * from Db.BookImages order by ID";
            SqlCommand cmd = new SqlCommand(strQuery);
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }
        //protected void btnUpload_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.PostedFile != null)
        //    {
        //        string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

        //        //Save files to disk
        //        FileUpload1.SaveAs(Server.MapPath("BookImages/" + FileName));

        //        //Add Entry to DataBase
        //        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;
        //        SqlConnection con = new SqlConnection(strConnString);
        //        string strQuery = "insert into Db.BookImages ([FileName], [FilePath],BookID)" + " values(@FileName, @FilePath,'Button15')";
        //        SqlCommand cmd = new SqlCommand(strQuery);
        //        cmd.Parameters.AddWithValue("@FileName", FileName);
        //        cmd.Parameters.AddWithValue("@FilePath", "BookImages/" + FileName);
        //        cmd.CommandType = CommandType.Text;
        //        cmd.Connection = con;
        //        try
        //        {
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write(ex.Message);
        //        }
        //        finally
        //        {
        //            con.Close();
        //            con.Dispose();
        //        }
        //    }
        //}
        protected string FindBookUsingID(object sender, EventArgs e)
        {
            myDal objmyDal = new myDal();

            int check = -99;
            Button btn = (Button)sender;
            string FrontEndID = btn.ID;
            string outputTitle = null;

            //Response.Write("minus one");   
            check = objmyDal.FindBookFromID(FrontEndID, ref outputTitle);

            //Response.Write("zero");   
            if (check == 1)
            {

                return outputTitle;


            }
            return outputTitle;


        }
    }
}