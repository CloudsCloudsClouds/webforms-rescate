<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroRol.aspx.cs" Inherits="webforms_rescate.Administracion.RegistroRol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="RegistroRolTitle">
            <h1>Registrar Rol</h1>
        </section>

        <div>
            <section class="list-group-item" aria-labelledby="RolInsert">
                <asp:TextBox ID="NombreRol" runat="server" placeholder="Nombre del Rol"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvValidarRol" class="text-danger" runat="server" ControlToValidate="NombreRol" ErrorMessage="Debes ingresar un nombre al Rol"></asp:RequiredFieldValidator>
            </section>
            <section class="list-group-item" aria-labelledby="DescripcionInsert">
                <asp:TextBox ID="DescripcionRol" runat="server" TextMode="MultiLine" Rows="5" placeholder="Descripcion"></asp:TextBox>
            </section>

            <asp:Button ID="btnRegistrarse" class="btn btn-primary btn-md" runat="server" Text="Registrarse" OnClick="btnRegistrarse_Click" />
        </div>
    </main>
</asp:Content>
