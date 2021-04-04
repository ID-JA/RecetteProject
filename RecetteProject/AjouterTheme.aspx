<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjouterTheme.aspx.cs" Inherits="RecetteProject.AjouterTheme" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ajouter Theme</title>
    <style>
        body {
            margin:0;
            padding:0;
            height: 100vh;
            background: #56ab2f;
            background: -webkit-linear-gradient(to right, #a8e063, #56ab2f);
            background: linear-gradient(to right, #a8e063, #56ab2f);
            font-family: sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .ml3 {
            font-weight: 500;
            font-size: 3.5em;
            color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="ml3">Ajouté Avec Succès</h1>

        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
    <script>
        var textWrapper = document.querySelector('.ml3');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

        anime.timeline({ loop: true })
            .add({
                targets: '.ml3 .letter',
                opacity: [0, 1],
                easing: "easeInOutQuad",
                duration: 2250,
                delay: (el, i) => 150 * (i + 1)
            }).add({
                targets: '.ml3',
                opacity: 0,
                duration: 1000,
                easing: "easeOutExpo",
                delay: 1000
            });
    </script>
</body>
</html>
