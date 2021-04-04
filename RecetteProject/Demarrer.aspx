<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demarrer.aspx.cs" Inherits="RecetteProject.Demarrer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Demarrer - Gestion Recette</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            height: 100%;
        }

        #form1 {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .myContainer {
            height: 50%;
            width: 50%;
            display: flex;
            justify-content: space-around;
            align-items: center;
            /* padding: 2rem 3rem; */
            background: white;
            flex-direction: column;
            border: 1px solid red;
            border-radius: 7px;
            box-shadow: 10px 10px 29px 0px rgba(0,0,0,0.75);
            -webkit-box-shadow: 10px 10px 29px 0px rgba(0,0,0,0.75);
            -moz-box-shadow: 10px 10px 29px 0px rgba(0,0,0,0.75);
        }

        label {
            margin: 0;
            padding: 0;
            text-align: center;
            font-size:3rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="myContainer">
            <label runat="server" id="lblUserName"></label>
            <asp:HyperLink ID="linkSite" NavigateUrl="~/CreerRecette.aspx" runat="server" CssClass="btn btn-danger">Accéeder au Site</asp:HyperLink>
        </div>
    </form>
</body>
</html>
