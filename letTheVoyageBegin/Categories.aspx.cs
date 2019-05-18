using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using letTheVoyageBegin.DAL;
//using letTheVoyageBegin.

namespace letTheVoyageBegin
{
    public partial class Categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected string FindBookUsingID(object sender, EventArgs e)
        {
            myDal objmyDal = new myDal();

            int check = -99;
            Button btn = (Button)sender;
            string FrontEndID = btn.ID;
            string outputTitle = null;

            //Response.Write("minus one");   
            check = objmyDal.FindBookFromID(FrontEndID,ref outputTitle);

            //Response.Write("zero");   
            if (check == 1)
            {
              
                return outputTitle;
                
               
            }
            return outputTitle;
          

        }
        
    }
}