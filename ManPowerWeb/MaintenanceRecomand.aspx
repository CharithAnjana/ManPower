﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MaintenanceRecomand.aspx.cs" Inherits="ManPowerWeb.MaintenanceRecomand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager runat="server" ID="Scriptmanger1"></asp:ScriptManager>
    <div class="container">
        <h2>Vehicle Maintenance Requests Recomandation</h2>
        <br />
        <br />

        <div class="row">
            <div class="col-6">
                <div class="row">
                    <div class="col-3">
                        <label>Category : </label>
                    </div>
                    <div class="col-7">
                        <asp:DropDownList ID="ddlCategory" Width="250px" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-3">
                        <label>Date :</label>
                    </div>
                    <div class="col-7">
                        <asp:TextBox ID="date" runat="server" name="date" Width="250px" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>


        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" Style="width: 120px;" />

        <br />
        <br />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" Style="width: 120px;" />

        <br />
        <br />
        <br />

        <div class="table-responsive" style="width: 100%;">
            <asp:GridView Style="margin-top: 30px;" ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                CellPadding="4" GridLines="None">
                <Columns>
                    <asp:BoundField HeaderText="Requested Date" DataField="RequestDate" HeaderStyle-CssClass="table-dark" />
                    <asp:BoundField HeaderText="Vehicle Number" DataField="VehicleNumber" HeaderStyle-CssClass="table-dark" />
                    <asp:BoundField HeaderText="Description" DataField="RequestDescription" HeaderStyle-CssClass="table-dark" />
                    <asp:BoundField HeaderText="Status" DataField="IsApproved" HeaderStyle-CssClass="table-dark" />
                    <asp:BoundField HeaderText="File Number" DataField="FileNo" HeaderStyle-CssClass="table-dark" />
                    <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="table-dark">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text="View" CssClass="btn btn-info" Width="100px"
                                a href='<%#"MaintenanceApprovalView.aspx?id="+DataBinder.Eval(Container.DataItem,"VehicleMeintenanceId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
