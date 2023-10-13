using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webforms_rescate.Inventario
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertData_Click(object sender, EventArgs e)
        {
            Response.Redirect("InventarioInput.aspx");
        }

        protected void btnInsertAlmacen_Click(object sender, EventArgs e)
        {
            Response.Redirect("AlmacenInput.aspx");
        }

        protected void btnInsertTipoProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("TipoRecursoInsertar.aspx");
        }
    }
}