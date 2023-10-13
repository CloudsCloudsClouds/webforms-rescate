using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace loginc
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnRegistrarse_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection sqlConectar = new SqlConnection(conectar))
            {
                // Verificar si el CI ya está registrado
                using (SqlCommand cmdVerificarCI = new SqlCommand("SELECT COUNT(*) FROM Personal WHERE CI = @CI", sqlConectar))
                {
                    cmdVerificarCI.Parameters.AddWithValue("@CI", tbcarnet_identidad.Text);
                    sqlConectar.Open();
                    int existenciaCI = (int)cmdVerificarCI.ExecuteScalar();

                    if (existenciaCI > 0)
                    {
                        // El CI ya está registrado, mostrar un mensaje de error
                        lblMensaje.Text = "El CI ya está registrado.";
                        lblMensaje.CssClass = "text-danger";
                        lblMensaje.Visible = true;
                    }
                    else
                    {
                        // El CI no está registrado, continuar con la inserción
                        using (SqlCommand cmd = new SqlCommand("EXEC InsertarPersonal @Nombre, @Celular, @Email, @IDRol, @CI, @Contraseña", sqlConectar))
                        {
                            // Parámetros de entrada
                            cmd.Parameters.Add("@CI", SqlDbType.Int).Value = tbcarnet_identidad.Text;
                            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 50).Value = tbnombre.Text;
                            cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 50).Value = tbcontrasena.Text;
                            cmd.Parameters.AddWithValue("@Celular", tbcelular.Text);
                            cmd.Parameters.AddWithValue("@Email", tbemail.Text);
                            cmd.Parameters.AddWithValue("@IDRol", rol.SelectedValue);

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                //Registro exitoso, mostrar el mensaje de éxito
                                lblMensaje.Text = "Registro exitoso.";
                                lblMensaje.CssClass = "text-success";
                                lblMensaje.Visible = true;
                                BtnRegistrarse.Visible = false;
                            }
                        }
                    }
                }
            }
        }
    }
}