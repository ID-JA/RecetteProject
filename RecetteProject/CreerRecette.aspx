<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreerRecette.aspx.cs" Inherits="RecetteProject.CreerRecette" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Creer Recette - Gestion Recette</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        img {
            width: 100%;
            height: 100%;
            display: block;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 10px;
        }

        .uplaod-image__container {
            width: 100%;
            height: 210px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border: 2px dashed black;
            position: relative;
            border-radius: 10px;
        }

        #preview-image {
            width: 100%;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .fileUpload {
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container mt-3">
            <div class="row mb-3">
                <div class="col-md d-flex justify-content-center align-items-center">
                    <label runat="server" id="lblUserName">Bonjour Jamal</label>
                </div>
                <div class="col-md d-flex justify-content-center align-items-center">
                    <label runat="server" id="lblTotalUser">Total User:150</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md">
                    <div class="form-group">
                        <label>Nom de la Recette:</label>
                        <input class="form-control" type="text" runat="server" id="txtnomRecette" name="nomRecette" />
                        <asp:RequiredFieldValidator ErrorMessage="Champ Obligatoire" ControlToValidate="txtnomRecette" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Théme:</label>
                        <div class="d-flex">
                            <asp:DropDownList CssClass="form-control" ID="ddlTheme" runat="server" OnSelectedIndexChanged="ddlTheme_SelectedIndexChanged"></asp:DropDownList>
                            <label runat="server" id="lblTheme" class="text-primary"></label>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Champ Obligatoire"  ControlToValidate="ddlTheme"></asp:RequiredFieldValidator>

                    </div>
                    <div class="form-group">
                        <label>Temp de preparation:</label>
                        <input type="time" name="timePrparation" runat="server" id="txtTimePrepara" class="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Champ Obligatoire" ControlToValidate="txtTimePrepara" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Niveau:</label>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Value="Facile" Text="Facile" />
                            <asp:ListItem Value="Moyenne" Text="Moyenne" />
                            <asp:ListItem Value="Dificille" Text="Dificille" />
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group">
                        <label>Méthode de Préparation:</label>
                        <textarea runat="server" id="txtMethodPrepara" class="form-control"></textarea>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Champ Obligatoire" CssClass="text-danger" ControlToValidate="txtMethodPrepara"></asp:RequiredFieldValidator>
                    </div>
                    <div class="d-flex justify-content-end align-items-center">
                        <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-secondary" Text="Créer" OnClick="btnCreate_Click" />
                    </div>
                </div>
                <div class="col-md d-flex justify-content-center align-items-center flex-column">
                    <div class="form-group w-50 ">
                        <label>Photo:</label>
                        <div class="uplaod-image__container">
                            <span id="preview-image">Ajouter Image</span>
                            <img src="Images/DefaultRecette.jpg" id="image" alt="Alternate Text" />
                            <asp:FileUpload CssClass="fileUpload" ID="ImageUpload" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        document.querySelector('#txtTimePrepara').addEventListener("change", function () {
            console.log(this.value);
        })
        const uploadContainer = document.querySelector('.uplaod-image__container');
        const titlePreview = document.querySelector('#preview-image');
        const imageTag = document.querySelector('img');
        const fileUploader = document.querySelector('.fileUpload');

        fileUploader.addEventListener("change", function (e) {
            let file = e.target.files[0];
            let reader = new FileReader();
            if (file && (file.type == "image/jpeg" || file.type == "image/jpg" || file.type == "image/png" || file.type == "image/gif")) {

                reader.readAsDataURL(file);
            } else {
                imageTag.setAttribute('src', '');
                imageTag.style.display = 'none';
                titlePreview.style.display = 'block';
                uploadContainer.style.border = '3px dashed #222';
            }
            reader.addEventListener('load', function () {

                imageTag.setAttribute('src', reader.result);
                imageTag.style.display = 'block';
                titlePreview.style.display = 'none';
                uploadContainer.style.border = 'none';
            });
        });
    </script>
</body>
</html>
