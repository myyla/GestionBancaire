 <%@ Page Title="" Language="C#" MasterPageFile="~/MenuHeader.master" AutoEventWireup="true" CodeBehind="mycredits.aspx.cs" Inherits="Gestion_Bancaire.mycredits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPH" runat="server">
    <div align="center">
        <div>
            <h4>My Credits</h4>
        </div>
        <asp:GridView ID="gvMyCredits" runat="server">
            <Columns>
                <asp:TemplateField HeaderText="From Account">
                    <ItemTemplate>
                        <asp:Label ID="accNum" runat="server" Text='<%# Eval("AccountNumber") %> '></asp:Label>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Payee Name">
                    <ItemTemplate>
                        <asp:Label ID="payeeName" runat="server" Text='<%# Eval("UserName") %> '></asp:Label>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount">
                    <ItemTemplate>
                        <asp:Label ID="amount" runat="server" Text='<%# Eval("Amount") %> '></asp:Label>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="Remarks">
                    <ItemTemplate>
                        <asp:Label ID="remark" runat="server" Text='<%# Eval("Remarks") %> '></asp:Label>
                     </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                 </asp:TemplateField>

             </Columns>
            </asp:GridView>
            <div id="error" runat="server" style="color:red"></div>
        </div>
</asp:Content>


