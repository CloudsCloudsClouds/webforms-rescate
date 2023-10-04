<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TipoRecursoInsertar.aspx.cs" Inherits="webforms_rescate.Inventario.TipoRecursoInsertar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
    <h1>Insertar Tipo Recurso</h1>

    <table class="w-100">
        <div class="input-group">
            <tr>
                <td style="width: 271px" class="text-primary">Nombre Tipo Recurso</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 271px" class="text-primary">Capacidad que usa</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 271px" class="text-primary">Costo de almacenamiento</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 271px; height: 21px;"></td>
                <td style="height: 21px">
                    </td>
            </tr>
        </div>
            <tr>
                <td style="width: 271px">
                    <div id="mensaje" class="bg-primary">
                        <asp:Label ID="Warning" runat="server" class="text-dark"></asp:Label>
                    </div>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 271px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        <tr>
            <td style="width: 271px">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" class="btn-primary" runat="server" OnClick="Button1_Click" Text="Subir" />
            </td>
        </tr>
    </table>

</main>
</asp:Content>
