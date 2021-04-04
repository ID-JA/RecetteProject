<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsRecette.aspx.cs" Inherits="RecetteProject.DetailsRecette" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Details</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        .mycontainer {
            margin-top: 2rem;
        }

        #recetteNameContainer {
            margin-top: 1rem;
            position: relative;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        #lblReceteName {
            margin-bottom: 1rem;
        }
        h5{
            margin-bottom:1rem;
        }
        #recetteNameContainer::after {
            content: '';
            height: 1px;
            width: 50%;
            position: absolute;
            background: #222;
            bottom: 0;
            margin: auto;
        }
        .txtIng-container{
            display:none;
        }
        #left{
            border-right:1px solid #222;
        }
         #right{
            border-left:1px solid #222;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="mycontainer">
                <div class="row mb-3">
                    <div class="col-md d-flex justify-content-center align-items-center">
                        <label runat="server" id="lblUserName">Bonjour Jamal</label>
                    </div>
                    <div class="col-md d-flex justify-content-center align-items-center">
                        <label runat="server" id="lblTotalUser">Total User:150</label>
                    </div>
                </div>
                <div class="row" id="recetteNameContainer">
                    <label runat="server" class="h2 " id="lblReceteName">Cup Cake</label>
                </div>
                <div class="row mt-5">
                    <%-- Left Column --%>
                    <div class="col-md" id="left">
                        <h5>Ingrédients</h5>
                        <asp:Repeater ID="Ingrédients" runat="server">
                            <ItemTemplate>
                                <div>
                                    <input id="<%# Eval("NomIng") %>" class="ing-check" type="checkbox" name="<%# Eval("NomIng")%>" value="<%# Eval("NomIng")%>" />
                                    <label for="<%# Eval("NomIng") %>" class="ml-1"><%# Eval("NomIng")%></label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Valider" />
                    </div>
                    <%-- Rigth Column --%>
                    <div class="col-md" id="right">
                        <h5>Quantité Utilisée</h5>
                        <asp:Repeater ID="IngControlsTxt" runat="server">
                            <ItemTemplate>
                                <div id="<%# Eval("NomIng") %>-container" class="txtIng-container">
                                    <div class="d-flex justify-content-around align-items-center">
                                        <div class="col-md">
                                        <input type="text" class="<%# Eval("NomIng") %>" name="<%# Eval("NomIng") %>" value="" />
                                    </div>
                                    <div class="col-md">
                                        <h3><%# Eval("NomIng") %></h3>
                                    </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.0.0.js"></script>
    <script>
        const checkBoxes = document.querySelectorAll('.ing-check');
        //const txtControls = document.querySelectorAll('.txtControl')
        checkBoxes.forEach(function (element, index) {
            element.addEventListener("change", function () {
                const elementID = this.getAttribute("id");
                if (element.checked) {
                    console.log("checked");
                    document.querySelector(`#${elementID}-container`).style.display = "block";
                } else {
                    console.log("Unchecked");
                    document.querySelector(`#${elementID}-container`).style.display = "none";
                }
               
            });
        });
    </script>
</body>
</html>
