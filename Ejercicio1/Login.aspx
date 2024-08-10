<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Página de Login</title>
    <script type="text/javascript">
        function validateForm() {
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;

            if (username === "" || password === "") {
                alert("Todos los campos son obligatorios.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <div>
            <h2>Inicio de sesión</h2>
            <asp:Label ID="lblUsername" runat="server" Text="Nombre de usuario:"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" 
                ErrorMessage="El nombre de usuario es obligatorio." ForeColor="Red"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Label ID="lblPassword" runat="server" Text="Contraseña:"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                ErrorMessage="La contraseña es obligatoria." ForeColor="Red"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
