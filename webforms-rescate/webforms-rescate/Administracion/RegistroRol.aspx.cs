using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webforms_rescate.Administracion
{
    public partial class RegistroRol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["emergenciaConnectionString"].ConnectionString;
            using(SqlConnection sqlConnection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("EXEC InsertarRol @Nombre, @Descripcion", sqlConnection);

                cmd.Parameters.AddWithValue("@Nombre", NombreRol.Text);
                if (DescripcionRol.Text.IsNullOrWhiteSpace())
                {
                    cmd.Parameters.AddWithValue("@Descripcion", "N/A");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Descripcion", DescripcionRol.Text);
                }

                sqlConnection.Open();
                cmd.ExecuteNonQuery();

                Response.Redirect("AdministracionDefault.aspx");
            }
        }
    }
}