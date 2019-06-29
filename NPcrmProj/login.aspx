<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NPcrmProj.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>כניסה</title>
    <script src="inc/jquery-3.4.1.min.js"></script>
    <script src="inc/bootstrap.min.js"></script>
    <link href="inc/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/Login.css" rel="stylesheet" />

</head>
<body>
    <form id="login" runat="server">
        <div class="container">

        <div class="imgcontainer">
            <img src="pics/login.jpg" alt="Avatar" class="avatar">
        </div>


            <label><b>שם משתמש</b></label>
            <input runat="server" type="text" id="uname" required="" oninvalid="this.setCustomValidity('נא להכניס שם משתמש')" oninput="setCustomValidity('')">


            <label><b>סיסמא</b></label>
            <input runat="server" type="password" id="psw" required="" oninvalid="this.setCustomValidity('נא להכניס סיסמא')" oninput="setCustomValidity('')">


            <asp:Button ID="button" runat="server" OnClick="enterclc" Text="כניסה" />
            <label>
                <input runat="server" id="rememberme" type="checkbox" name="remember">
                זכור אותי
            </label>
            <br />

            <div>
                <asp:Button ID="forg" UseSubmitBehavior="false" runat="server" OnClick="Forget" Text="שכחתי סיסמא" />
            </div>
            




            <div runat="server" id="logfail" class="alert alert-danger">
                שם משתמש או סיסמא שגויים
            </div>


        </div>

    </form>
</body>
</html>
