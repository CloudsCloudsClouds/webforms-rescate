<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUsuario.aspx.cs" Inherits="loginc.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="../Content/Css/Estilos.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body class="bg-black">
    <div class="container">
        <div>
            <form id="form1" runat="server">
                <div class="col-md-6 text-center mb-5">
                    <asp:Label class="h3" ID="lblBienvenida" runat="server" Text="Bienvenido/a al Sistema"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                    <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Nombre de Usuario"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsuario" class="alert-danger" runat="server" ControlToValidate="tbUsuario" ErrorMessage="Ingrese su usuario"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label ID="lblContraseña" runat="server" Text="Contraseña"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox ID="tbContrasenia" CssClass="form-control" runat="server" placeholder="Contraseña" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContrasena" class="alert-danger" runat="server" ControlToValidate="tbContrasenia" ErrorMessage="Ingrese su contraseña"></asp:RequiredFieldValidator>
                        <div class="input-group-append">
                            <asp:Button ID="BtnVerContraseña" CssClass="btn btn-warning" runat="server" Text="Ver Contraseña" OnClientClick="togglePassword(); return false;" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:Button ID="BtnIngresar" CssClass="btn-outline-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
                </div>
                <div>
                    <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                </div>
            </form>
        </div>
    </div>

    <script>
        function togglePassword() {
            var passwordInput = document.getElementById('<%= tbContrasenia.ClientID %>');
            var passwordButton = document.getElementById('<%= BtnVerContraseña.ClientID %>');

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                passwordButton.textContent = "Ocultar Contraseña";
            } else {
                passwordInput.type = "password";
                passwordButton.textContent = "Ver Contraseña";
            }
        }
    </script>
</body>
</html>




