using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace loginc
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            string usuario = tbUsuario.Text;
            string contraseña = tbContrasenia.Text;

            string conectar = ConfigurationManager.ConnectionStrings["emergenciaConnectionString"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SELECT Contrasena FROM Personal WHERE (Email) = '" + usuario + "';", sqlConectar)
            {
                CommandType = CommandType.Text
            };

            cmd.Connection.Open();
            SqlDataReader dr = cmd.ExecuteReader();



            if (dr.Read())
            {
                // Agregar una sesión de usuario (código necesario para la autenticación)
                // Ejemplo: Session["Usuario"] = tbUsuario.Text;
                FormsAuthentication.SetAuthCookie(usuario, false);
                Response.Redirect("AdministracionDefault.aspx");
            }
            else
            {
                lblMensaje.Text = "Usuario o contraseña incorrecto";
            }
            cmd.Connection.Close();
        }
    }
}

