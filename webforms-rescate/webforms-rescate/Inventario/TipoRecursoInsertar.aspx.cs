using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webforms_rescate.Inventario
{
    public partial class TipoRecursoInsertar : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection("Data Source=WEBFORMS;Initial Catalog=emergencia;User ID=su;Password=root");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Name = TextBox1.Text;
            string Capa = TextBox2.Text;
            string Caps = TextBox3.Text;

            using (SqlCommand cmd = new SqlCommand("EXEC InsertarTipoRecurso @Nombre, @Capacidad, @Costo", Conn))
            {
                if (int.TryParse(Capa, out _) && int.TryParse(Caps, out _))
                {
                    cmd.Parameters.AddWithValue("@Nombre", Name);
                    cmd.Parameters.AddWithValue("@Capacidad", int.Parse(Capa));
                    cmd.Parameters.AddWithValue("@Costo", int.Parse(Caps));

                    Conn.Open();
                    int Flag = cmd.ExecuteNonQuery();
                    Conn.Close();
                    if (Flag != 0)
                    {
                        Warning.Text = "Exito";
                    }
                    else
                    {
                        Warning.Text = "Error inesperado";
                    }
                }
                else { Warning.Text = "Usa numeros enteros en los espacios de Capacidad y Costo"; }
            }
        }
    }
}