<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventarioInput.aspx.cs" Inherits="webforms_rescate.Inventario.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1>Insertar Datos Inventario</h1>

        <table class="w-100">
            <div class="input-group">
                <tr>
                    <td style="width: 271px" class="text-primary">Nombre Recurso</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 271px" class="text-primary">TipoRecurso</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" class="dropdown-item" runat="server" DataSourceID="dboTipoRecurso" DataTextField="Nombre" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dboTipoRecurso" runat="server" ConnectionString="<%$ ConnectionStrings:emergenciaConnectionString %>"  SelectCommand="SELECT * FROM [TipoRecurso]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="width: 271px" class="text-primary">Almacen</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" class="dropdown-item" runat="server" DataSourceID="dboAlmacen" DataTextField="Nombre" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="dboAlmacen" runat="server" ConnectionString="<%$ ConnectionStrings:emergenciaConnectionString %>" SelectCommand="SELECT * FROM [Almacen]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="width: 271px">Fecha Vencimiento</td>
                    <td>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Width="350px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </td>
                </tr>
            </div>
                <tr>
                    <td style="width: 271px">
        <asp:Label id="Warning" class="text-dark" runat="server"></asp:Label>
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
                    <asp:Button ID="Button1" class="btn-primary" runat="server" OnClick="Button1_Click" Text="Button" />
                </td>
            </tr>
        </table>

    </main>
</asp:Content>
