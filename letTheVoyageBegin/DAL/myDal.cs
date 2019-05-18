using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace letTheVoyageBegin.DAL
{
    public class myDal 
    {
        private static readonly string connString =
        System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        //public DataSet SelectItems() //to get values of all items from table Items and return dataset
        //{
        //    DataSet ds = new DataSet();//declare and instantiate new SQL connection
        //    SqlConnection con = new SqlConnection(connString);
        //    con.Open();//open sql connection
        //    SqlCommand cmd;
        //    try
        //    {
        //        //cmd = new SqlCommand("update Db.User set UserType=0 where UserType is null AND username!='admin'", con); //instantiate SQL command
        //        cmd.CommandType = CommandType.Text; //set type of SQl command
        //        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //        {
        //            da.Fill(ds);//Add the result set returned from SQLcommand to ds.

        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        Console.WriteLine("SqlError" + ex.Message.ToString());

        //    }
        //    finally
        //    {
        //        con.Close();//return the dataset.

        //    }
        //    return ds;
        //}
        public int insertionForSignup(string username, string password, string email, string name, string dob, string contact, string address, string postalCode, ref string UsernameOutput)
        {
            int StatusOutput = -99;

            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("Signup", con);
            con.Open();
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@username", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@userEmail", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@dob", SqlDbType.Date);
                cmd.Parameters.Add("@contact", SqlDbType.VarChar,20);
                cmd.Parameters.Add("@Address", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@PostalCode", SqlDbType.VarChar, 50);

                cmd.Parameters.Add("@status", SqlDbType.VarChar, 1).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@confirmedUsername", SqlDbType.VarChar,50).Direction = ParameterDirection.Output;
         
                DateTime dt = Convert.ToDateTime(dob);
               

                cmd.Parameters["@username"].Value = username;
                cmd.Parameters["@password"].Value = password;
                cmd.Parameters["@UserEmail"].Value = email;
                cmd.Parameters["@Name"].Value = name;
                cmd.Parameters["@dob"].Value = dt.Date;
                cmd.Parameters["@contact"].Value = contact;
                cmd.Parameters["@Address"].Value = address;
                cmd.Parameters["@PostalCode"].Value = postalCode;
               

                cmd.Parameters["@status"].Value = StatusOutput;
                cmd.Parameters["@confirmedUsername"].Value = UsernameOutput;

                cmd.ExecuteNonQuery();

                StatusOutput = Convert.ToInt32(cmd.Parameters["@status"].Value);
                UsernameOutput = Convert.ToString(cmd.Parameters["@confirmedUsername"].Value);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());

            }
            finally
            {
                con.Close();

            }
          
            return StatusOutput;



        }
        public int checkingForlogin(string id, string pass)
        {
            int found = -99;
            //SqlConnection con = new SqlConnection("Server=localhost; Database= projectVoyage; Integrated Security=True;");
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("Login", con);
            con.Open();
          
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add("@username", SqlDbType.VarChar,50);
                cmd.Parameters.Add("@password", SqlDbType.VarChar,50);
                
                cmd.Parameters.Add("@status", SqlDbType.VarChar,1).Direction = ParameterDirection.Output;

                cmd.Parameters["@username"].Value = id;
                cmd.Parameters["@password"].Value = pass;
                cmd.Parameters["@status"].Value = found;

                cmd.ExecuteNonQuery();

                found = Convert.ToInt32(cmd.Parameters["@status"].Value);
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return found;

        }

        public int FindBookFromID(string FrontEndID, ref string BookTitle)
        {
            int found = -99;
            string bookTitleOutput=null;
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("FindTitleFromID", con);
            con.Open();

            try
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@id", SqlDbType.VarChar,10);
                cmd.Parameters.Add("@title", SqlDbType.VarChar, 50).Direction=ParameterDirection.Output;
                cmd.Parameters.Add("@status", SqlDbType.Int).Direction = ParameterDirection.Output;

                cmd.Parameters["@id"].Value = FrontEndID;
                cmd.Parameters["@title"].Value = bookTitleOutput;
                cmd.Parameters["@status"].Value = found;

                cmd.ExecuteNonQuery();

                found = Convert.ToInt32(cmd.Parameters["@status"].Value);
                bookTitleOutput = Convert.ToString(cmd.Parameters["@title"].Value);
                BookTitle = bookTitleOutput;
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return found;

        }
        internal int insertionForSignup(string p, string p_2, string p_3, string p_4, string p_5, string p_6, string p_7, string p_8, string verifiedUsername)
        {
            throw new NotImplementedException();
        }
    }
}