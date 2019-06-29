<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPass.aspx.cs" Inherits="NPcrmProj.views.ForgetPass" %>

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

            <label><b>יש להזין פרטים של המשתמש שסיסמתו נשכחה</b></label>
            <div class="imgcontainer">
            <img src="pics/forgot.jpg" alt="Avatar" class="avatar">
        </div>
            

            <label><b>שם משתמש</b></label>
            <input runat="server" type="text" id="uname" required="" oninvalid="this.setCustomValidity('נא להכניס שם משתמש')" oninput="setCustomValidity('')">


            <label><b>דואר אלקטרוני</b></label>
            <input runat="server" type="text" id="email" required="" oninvalid="this.setCustomValidity('נא להכניס דואר אלקטרוני')" oninput="setCustomValidity('')">


            <asp:Button ID="button" runat="server" OnClick="enterdat" Text="שחזר סיסמא" />


            <div runat="server" id="logfail" class="alert alert-danger">
                אחד הנתונים שהוזנו שגויים
            </div>

            <div runat="server" id="ressuc" class="alert alert-success">
                הסיסמא שוחזרה ונשלחה לדואר אלקטרוני
            </div>
            <div>
                <asp:HyperLink ID="redir" UseSubmitBehavior="false" runat="server" href="login.aspx" >חזרה לעמוד הכניסה</asp:HyperLink>
            </div>


        </div>

    </form>
</body>
</html>
