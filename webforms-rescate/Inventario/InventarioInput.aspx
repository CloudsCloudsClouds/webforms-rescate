<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventarioInput.aspx.cs" Inherits="webforms_rescate.Inventario.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Insertar Datos Inventario</h1>

        <table class="w-100">
            <div class="input-group">
                <tr>
                    <td style="width: 271px" class="text-primary">Nombre Recurso</td>
                    <td>
                        <input id="Text1" class="input-group-text" type="text" /></td>
                </tr>
                <tr>
                    <td style="width: 271px" class="text-primary">Proveedor</td>
                    <td>
                        <input id="Text2" class="input-group-text" type="text" /></td>
                </tr>
                <tr>
                    <td style="width: 271px" class="text-primary">Costo</td>
                    <td>
                        <input id="Text3" class="input-group-text" type="text" /></td>
                </tr>
                <tr>
                    <td style="width: 271px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </div>
            <tr>
                <td style="width: 271px">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" class="btn-primary" runat="server" OnClick="Button1_Click" Text="Button" />
                </td>
            </tr>
        </table>

    </main>
</asp:Content>
