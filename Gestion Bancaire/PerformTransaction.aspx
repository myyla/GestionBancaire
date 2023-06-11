
<%@ Page Title="" Language="C#" MasterPageFile="~/MenuHeader.master" AutoEventWireup="true" CodeBehind="PerformTransaction.aspx.cs" Inherits="Gestion_Bancaire.PerformTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPH" runat="server">
   <style>
        body {
            background: linear-gradient(to bottom right, #8a5eff, #c69bff);
            font-family: Arial, sans-serif;
        }

        .transaction-form {
    width: 100%;
    max-width: 2200px;
    margin: 0 auto;
    padding: 50px;
    border-radius: 0px;
    background: linear-gradient(to bottom right, #8a5eff, #c69bff);
    background-image: linear-gradient(to bottom right, #8a5eff, #c69bff);
    background-image: -webkit-linear-gradient(to bottom right, #8a5eff, #c69bff);
    box-shadow: 0 0px 0px rgba(0, 0, 0, 0.1);
}


        .transaction-form h4 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .transaction-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #555;
        }

        .transaction-form input[type="text"],
        .transaction-form select {
            height: 28px;
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        .transaction-form .error-message {
            color: red;
            margin-top: 5px;
            font-size: 12px;
        }

        .transaction-form .btn {
            display: inline-block;
            padding: 8px 16px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            white-space: nowrap;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .transaction-form .btn-send {
            background-color: #f44336;
            color: #fff;
        }

        .transaction-form .btn-cancel {
            background-color: #4CAF50;
            color: #fff;
            margin-left: 10px;
        }
    </style>
    <div class="transaction-form">
        <h4>Effectuer une Transaction</h4>
        <label for="ddlPayeeAccountNumber">Numéro de compte du bénéficiaire</label>
        <asp:DropDownList ID="ddlPayeeAccountNumber" runat="server" Height="28px" Width="100%" AppendDataBoundItems="True" DataTextField="AccountNumber" DataValueField="AccountNumber"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BankTransactionDBConnectionString %>" SelectCommand="SELECT * FROM [Account]"></asp:SqlDataSource>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlPayeeAccountNumber" SetFocusOnError="true" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>

        <label for="txtPayeeName">Le nom du bénéficiaire</label>
        <asp:TextBox ID="txtPayeeName" runat="server" Height="28px" Width="100%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPayeeName" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        <div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Minimum length must be 6 characters (alphanumeric)" ControlToValidate="txtPayeeName" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9\s]{6,15}$"></asp:RegularExpressionValidator>
        </div>

        <label for="txtMobileNumber">Numéro de portable</label>
        <asp:TextBox ID="txtMobileNumber" runat="server" Height="28px" Width="100%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtMobileNumber" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        <div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="MobileNumber must be of 10 digits" ControlToValidate="txtMobileNumber" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationExpression="[0-9]{10}$"></asp:RegularExpressionValidator>
        </div>

        <label for="txtAmount">Montant</label>
        <asp:TextBox ID="txtAmount" runat="server" Height="28px" Width="100%" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtAmount" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
        <div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Amount length must be in between 1 to 5 digits" ControlToValidate="txtAmount" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>
        </div>

        <label for="txtRemarks">Remarques</label>
        <asp:TextBox ID="txtRemarks" runat="server" Height="28px" Width="100%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtRemarks" SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

        <div>
            <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-send" OnClick="btnSend_Click" AutoPostBack="True" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-cancel" OnClick="btnCancel_Click" CausesValidation="false" backcolor="deeppink" />
        </div>

        <div id="error" runat="server" class="error-message"></div>
    </div>
</asp:Content>
