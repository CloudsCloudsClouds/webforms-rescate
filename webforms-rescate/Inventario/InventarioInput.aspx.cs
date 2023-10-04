using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webforms_rescate.Inventario
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection("Data Source=WEBFORMS;Initial Catalog=emergencia;User ID=su;Password=root");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("EXEC InsertarRecurso @TipoRecurso, @Almacen, @Nombre, @FechaExp", Conn);

            if(Calendar1.SelectedDate > DateTime.MinValue && Calendar1.SelectedDate != null)
            {
                DateTime dt = Calendar1.SelectedDate;

                cmd.Parameters.AddWithValue("@TipoRecurso", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Almacen", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@Nombre", TextBox1.Text);
                cmd.Parameters.AddWithValue("@FechaExp", dt);
                
                Conn.Open();
                int Flag = cmd.ExecuteNonQuery();
                Conn.Close();

                if (Flag == 0) 
                {
                    Warning.Text = "Error";
                }
                else 
                {
                    Warning.Text = "Exito";
                }
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}