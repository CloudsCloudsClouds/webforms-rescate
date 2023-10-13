<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdministracionDefault.aspx.cs" Inherits="webforms_rescate.Administracion.AdministracionDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="AdministracionTitle">
            <h1 id="aspnetTitle">Administracion</h1>
        </section>

        <section class="list-group-item" aria-labelledby="LoginButton">
            <a class="btn btn-default" href="LoginUsuario.aspx">Login &raquo;</a>
        </section>
        <section class="list-group-itme" aria-labelledby="RegistrarButton">
            <a class="btn btn-default" href="RegistroUsuario.aspx">Registrar usuario &raquo;</a>
        </section>
    </main>
</asp:Content>
