using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace webforms_rescate.Inventario
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection Conn = new SqlConnection("Data Source=WEBFORMS;Initial Catalog=emergencia;User ID=su;Password=root");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string CmdString = "EXEC InsertarAlmacen @NombreAlmacen, @Ubicacion, @NumbContacto, @EmailContacto, @Capacidad";

            using (SqlCommand cmd = new SqlCommand(CmdString, Conn))
            {                
                if (TextBox1.Text == string.Empty
                    || TextBox2.Text == string.Empty || TextBox3.Text == string.Empty 
                    || TextBox4.Text == string.Empty || TextBox5.Text == string.Empty)
                {
                    Warning.Text = "Debes llenar todos los datos";
                }
                else
                {
                    int ConNumb;
                    if (int.TryParse(TextBox3.Text, out ConNumb))
                    {
                        int CapNumb;
                        if (int.TryParse(TextBox5.Text, out CapNumb))
                        {
                            cmd.Parameters.AddWithValue("@NombreAlmacen", TextBox1.Text);
                            cmd.Parameters.AddWithValue("@Ubicacion", TextBox2.Text);
                            cmd.Parameters.AddWithValue("@NumbContacto", ConNumb.ToString());
                            cmd.Parameters.AddWithValue("@EmailContacto", TextBox4.Text);
                            cmd.Parameters.AddWithValue("@Capacidad", CapNumb);

                            Conn.Open();
                            int v = cmd.ExecuteNonQuery();
                            int Flag = v;

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
                        else { Warning.Text = "Debes colocar numeros"; }
                    }
                    else { Warning.Text = "Debes colocar numeros"; }
                }
            }
        }
    }
}