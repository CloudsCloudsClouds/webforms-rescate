<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="loginc.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Recursos/Css/EstiloIndex.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <title>Index</title>
     <style>
        @media (min-width: 992px) {
            .container {
                max-width: 80%;
            }
        }
    </style>
</head>
<body style="background-color: #007bff;"> <!-- este es el fondo celeste wawai si quieres aqui modificas  -->

    <div class="container">
        <form id="form1" runat="server">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <h1 class="display-4">Registrarse</h1>
                </div>
            </div>
            <div class="row justify-content-center mt-3">
                <div class="col-md-6">
                   

                    <label for="carnet_identidad">Carnet de Identidad:</label>
                    <asp:TextBox ID="tbcarnet_identidad" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

                    <label for="nombre">Nombre:</label>
                    <asp:TextBox ID="tbnombre" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

                    <label for="apellido_paterno">Email:</label>
                    <asp:TextBox ID="tbemail" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

                    <label for="apellido_materno">Celular:</label>
                    <asp:TextBox ID="tbcelular" runat="server" CssClass="form-control" Required="true"></asp:TextBox>

                    <label for="contrasena">Contraseña:</label>
                    <asp:TextBox ID="tbcontrasena" runat="server" CssClass="form-control" TextMode="Password" Required="true"></asp:TextBox>

                    <label for="rol">Rol:</label>
                    <asp:DropDownList ID="rol" runat="server" CssClass="form-control" Required="true" DataSourceID="dboRol" DataTextField="Nombre" DataValueField="ID">
                        <asp:ListItem Text="Usuario" Value="1" />
                        <asp:ListItem Text="Administrador" Value="2" />
                    </asp:DropDownList>

                    <asp:SqlDataSource ID="dboRol" runat="server" ConnectionString="<%$ ConnectionStrings:emergenciaConnectionString %>" SelectCommand="SELECT * FROM [Rol]"></asp:SqlDataSource>

                    <div class="btn-container">
                        <asp:Button ID="BtnRegistrarse" runat="server" Text="Registrarse" OnClick="BtnRegistrarse_Click" CssClass="btn btn-primary" Width="308px" />
                      <br />
                     <asp:Label ID="lblMensaje" runat="server" CssClass="animate-fade-in" Text="lblMensaje" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>