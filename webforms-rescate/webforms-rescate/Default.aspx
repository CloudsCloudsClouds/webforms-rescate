<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webforms_rescate._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="SistemaTitle">
            <h1 id="aspnetTitle">Sistema Emergencia</h1>
            <p class="lead">Sistema para organizar la primera respuesta ante una catastrofe de forma eficiente</p>
            <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Placeholder (no bueno) &raquo;</a></p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="InventarioTitle">
                <h2 id="gettingStartedTitle">Invetario</h2>
                <p>
                    Manejamos inventario de bienes e insumos necesarios para una primera respuesta eficiente. 
                </p>
                <p>
                    <a class="btn btn-default" href="Inventario/InventarioDefault.aspx">Inventario &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="AdministradorTitle">
                <h2 id="librariesTitle">Administracion</h2>
                <p>
                    Creacion de usuarios y roles, login y administracion de usuarios 
                </p>
                <p>
                    <a class="btn btn-default" href="Administracion/AdministracionDefault.aspx">Administracion &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="ObservadorTitle">
                <h2 id="hostingTitle">Observador</h2>
                <p>
                    Registro de zonas a observar, historial de desastres de zonas
                </p>
                <a class="btn btn-default" href="Observador/ObservadorDefauls.aspx">Observador &raquo;</a>
            </section>
        </div>
    </main>
</asp:Content>
