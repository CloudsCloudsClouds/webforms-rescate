<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventarioDefault.aspx.cs" Inherits="webforms_rescate.Inventario.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Inventario
        </h1>
        <div class="row">
            <asp:GridView ID="GridView1" Class="table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Nombre Recurso" HeaderText="Nombre Recurso" SortExpression="Nombre Recurso" />
                    <asp:BoundField DataField="Tipo Recurso" HeaderText="Tipo Recurso" SortExpression="Tipo Recurso" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:emergenciaConnectionString %>" ProviderName="<%$ ConnectionStrings:emergenciaConnectionString.ProviderName %>" SelectCommand="SELECT R.Nombre AS [Nombre Recurso], TR.Nombre AS [Tipo Recurso], Almacen.Nombre, TR.Costo FROM Recurso AS R INNER JOIN TipoRecurso AS TR ON R.IDTipoRecurso = TR.ID INNER JOIN Almacen ON R.IDAlmacen = Almacen.ID"></asp:SqlDataSource>
            <asp:Button ID="btnInsertData" class="btn btn-default" runat="server" Text="Ingresar datos" OnClick="btnInsertData_Click"/>
            <asp:Button ID="btnInsertAlmacen" class="btn btn-default" runat="server" Text="Ingresar Almacenes" OnClick="btnInsertAlmacen_Click" />
            <asp:Button ID="btnInsertTipoProducto" class="btn btn-default" runat="server" Text="Ingresar Tipo de producto" OnClick="btnInsertTipoProducto_Click" />
        </div>
    </main>
</asp:Content>
