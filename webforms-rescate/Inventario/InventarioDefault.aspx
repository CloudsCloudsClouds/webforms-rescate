<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventarioDefault.aspx.cs" Inherits="webforms_rescate.Inventario.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Inventario
        </h1>
        <div class="row">
            <asp:GridView ID="GridView1" Class="table-responsive" runat="server" AutoGenerateColumns="False" DataSourceID="InventarioVistaGeneral1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="NombreRecurso" HeaderText="NombreRecurso" SortExpression="NombreRecurso" />
                    <asp:BoundField DataField="IDProveedor" HeaderText="IDProveedor" SortExpression="IDProveedor" />
                    <asp:BoundField DataField="Costo" HeaderText="Costo" SortExpression="Costo" />
                    <asp:BoundField DataField="FechaCompra" HeaderText="FechaCompra" SortExpression="FechaCompra" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="InventarioVistaGeneral1" runat="server" ConnectionString="<%$ ConnectionStrings:sistema_respuestaConnectionString %>" ProviderName="<%$ ConnectionStrings:sistema_respuestaConnectionString.ProviderName %>" SelectCommand="SELECT [NombreRecurso], [IDProveedor], [Costo], [FechaCompra] FROM [Recursos] ORDER BY [FechaCompra]"></asp:SqlDataSource>
            <asp:Button ID="btnInsertData" runat="server" Text="Ingresar datos" OnClick="btnInsertData_Click"/>
        </div>
    </main>
</asp:Content>
