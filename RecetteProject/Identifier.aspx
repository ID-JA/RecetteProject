<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Identifier.aspx.cs" Inherits="RecetteProject.Identifier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Identifier Page</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        body {
            padding: 0;
            margin: 0;
            height: 100vh;
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: 1fr;
            place-items: center;
            background: linear-gradient(-45deg, #bcfcbe, #85fa89, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }




        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%;
            }
        }

        .mycontainer {
            width: 100%;
            height: 100%;
            background: #FDF8FF;
            padding: 3rem 3rem;
            border-radius: 10px;
            box-shadow: -3px 12px 96px -2px rgba(0,0,0,0.72);
            -webkit-box-shadow: -3px 12px 96px -2px rgba(0,0,0,0.72);
            -moz-box-shadow: -3px 12px 96px -2px rgba(0,0,0,0.72);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mycontainer">
            <div class="form-group">
                <strong><label>Veuiller Vous Identifier:</label></strong>
                <input runat="server" type="text" required oninvalid="this.setCustomValidity('Données Obligatoires')" oninput="this.setCustomValidity('')" class="form-control" name="IdentifierUser" id="IdentifierUser" autocomplete="off" />
            </div>
            <input id="BtnSubmit" runat="server"  onserverclick="BtnSubmit_Click" type="submit" name="submit" value="Valider" class="btn btn-dark" />
        </div>
    </form>
</body>
</html>
