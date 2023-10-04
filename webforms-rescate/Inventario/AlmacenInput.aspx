<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlmacenInput.aspx.cs" Inherits="webforms_rescate.Inventario.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Insertar almacen</h1>

    <table class="w-100">
        <tr>
            <td style="width: 206px">Nombre Almacen</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 206px">Ubicacion</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 206px">Numero de contacto</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 206px">Email de contacto</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 206px; height: 26px;">Capacidad </td>
            <td style="height: 26px">
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 206px">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Subir" />
            </td>
        </tr>
    </table>

    <div id="mensaje" class="bg-primary">
        <asp:Label id="Warning" class="text-dark" runat="server"></asp:Label>
    </div>
    </main>
</asp:Content>

