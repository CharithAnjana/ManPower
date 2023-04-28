﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="true" CodeBehind="PersonalFiles.aspx.cs" Inherits="ManPowerWeb.PersonalFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="Scriptmanger1"></asp:ScriptManager>
    <div class="container">
        <h2>Personal Files Management</h2>


        <div id="id1" runat="server">
            <div class="row mt-5 pl-2 mb-2">
                <h4><b>Personal Details</b></h4>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>File Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="fileNo" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="fileNo" ID="RequiredFieldValidator21" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-2">
                    <label>Full Name : </label>
                </div>
                <div class="col-2">
                    <asp:DropDownList ID="ddlMR" runat="server" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                </div>
                <div class="col-7">
                    <asp:TextBox ID="nameOfInitials" runat="server" CssClass="form-control form-control-user" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="nameOfInitials" ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="1" ID="RegularExpressionValidator13" ControlToValidate="nameOfInitials" runat="server" ForeColor="Red" ValidationExpression="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">
									Invalid Name</asp:RegularExpressionValidator>
                </div>

            </div>


            <div class="row mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Initials : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="initial" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="initial" ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Last Name : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="lname" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="lname" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="1" ID="RegularExpressionValidator12" ControlToValidate="lname" runat="server" ForeColor="Red" ValidationExpression="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">
									Invalid Name</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Date of Birth : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="dob" runat="server" CssClass="form-control form-control-user" TextMode="Date" AutoPostBack="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="dob" ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <%if (dob.Text != "")
                    {
                        DateTime calcPensionDate = Convert.ToDateTime(dob.Text).AddYears(60);
                        pensionDate.Text = calcPensionDate.ToString(); %>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Pension Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="pensionDate" ReadOnly="true" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <%} %>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>NIC : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="nic" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="nic" ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="1" ID="RegularExpressionValidator8" ControlToValidate="nic" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="^([0-9]{9}[x|X|v|V]|[0-9]{12})$">
							Invalid NIC</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Designation : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlEmpDesignation" runat="server" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ControlToValidate="ddlEmpDesignation" ID="RequiredFieldValidator29" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Marital Status : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlMaritalStatus" runat="server" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Gender : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Current Working Palce : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ControlToValidate="ddlDistrict" ID="RequiredFieldValidator54" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="col-6" runat="server" id="DsDiv" visible="false">
                    <div class="row">
                        <div class="col-4">
                            <label>DS Division : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlDS" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <%--<div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>ED Completion Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="txtEDComDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtEDComDate" ID="RequiredFieldValidator30" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>--%>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Salary Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="txtSalaryNum" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="txtSalaryNum" ID="RequiredFieldValidator32" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>W & OP Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="vnop" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="vnop" ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <%--  </div>


            <div class="row mt-4">--%>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Appointment letter Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="appointmenLetterNo" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="appointmenLetterNo" ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5 pl-2 mb-2">
                <h4><b>Contact Details</b></h4>
            </div>

            <div class="row mt-4">

                <div class="col-2">
                    <label>Address : </label>
                </div>
                <div class="col-9">
                    <asp:TextBox ID="address" runat="server" CssClass="form-control form-control-user" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="address" ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>

            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Mobile Phone : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="EmpMobilePhone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="EmpMobilePhone" ID="RequiredFieldValidator52" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="EmpMobilePhone" ValidationGroup="1"
                                ForeColor="Red" Display="Dynamic">Invalid Telephone Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Telephone (Landline): </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="telephone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="telephone" ValidationGroup="1"
                                ForeColor="Red" Display="Dynamic">Invalid Telephone Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Personal Email : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="email" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="email" ID="RequiredFieldValidator33" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="1" ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
							Invalid Email</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-end mt-5">
                <div class="col-2">
                    <asp:Button runat="server" ID="page1" Text="Next >>" CssClass="btn btn-success btn-user btn-block" OnClick="page1NextClick" ValidationGroup="1" />
                </div>
            </div>

        </div>

        <%--<div class="row">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Ethnicity : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlEthnicity" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Religion : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlReligion" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>--%>

        <%-- <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Absorb : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlAbsorb" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ControlToValidate="ddlAbsorb" ID="RequiredFieldValidator29" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                  <%--<div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Passport Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="empPassport" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RegularExpressionValidator ValidationGroup="1" ID="RegularExpressionValidator9" ControlToValidate="empPassport" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="^(?!^0+$)[a-zA-Z0-9]{3,20}$">
							Invalid Passport</asp:RegularExpressionValidator>
                        </div>
                    </div>
                 <%--<div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>NIC Issued Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="nicIssuedDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="nicIssuedDate" ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="1" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>
          </div>--%>

        <%---------------------------------------------------------------------%>






        <div id="id2" runat="server">


            <div class="row mt-5 pl-2">
                <h4><b>Employee Services Details</b></h4>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Service Type : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlService" runat="server" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Date of Appointment: </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="appointmentDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="appointmentDate" ID="RequiredFieldValidator47" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Date Assumed Duty : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="dateAssumedDuty" runat="server" CssClass="form-control form-control-user" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="dateAssumedDuty" ID="RequiredFieldValidator48" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <%-- <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Grade : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="empServicesGrade" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="empServicesGrade" ID="RequiredFieldValidator22" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>--%>
            </div>


            <%-- <%if (int.Parse(ddlService.SelectedValue) == 2)
                { %>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Medium of Recruitment : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="medium" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="medium" ID="RequiredFieldValidator49" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Method of Recruitment : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="method" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="method" ID="RequiredFieldValidator50" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <%} %>--%>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Is Confirmed : </label>
                        </div>
                        <div class="col-6">
                            <asp:RadioButtonList ID="confirmation" runat="server" AutoPostBack="true">
                                <asp:ListItem Value="1" Selected="True">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="confirmation" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <%if (confirmation.SelectedValue == "1")
                    { %>

                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Confirmed Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ConfirmedDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ConfirmedDate" ID="RequiredFieldValidator27" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="empService" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <%} %>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>EB Completed Date Grade 3 : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="txtEBDate1" runat="server" AutoPostBack="true" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <%if (!string.IsNullOrEmpty(txtEBDate1.Text))
                    { %>
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>EB Completed Date Grade 2 : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="txtEBDate2" runat="server" AutoPostBack="true" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>
            <%if (!string.IsNullOrEmpty(txtEBDate2.Text))
                { %>
            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>EB Completed Date Grade 1 : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="txtEBDate3" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>

            <%-- <div class="row mt-4">
                <div class="col-2">
                    <asp:Button runat="server" ID="Button5" Text="Add" CssClass="btn btn-primary btn-user btn-block" OnClick="addServices" ValidationGroup="7" />
                </div>
            </div>


            <div cssclass="table-responsive" style="width: 100%;">
                <asp:GridView Style="margin-top: 30px;" ID="servicesGV" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    CellPadding="4" GridLines="None">
                    <Columns>
                        <asp:BoundField HeaderText="Services Type" DataField="ServicesTypeId" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Appointment Date" DataField="AppointmentDate" HeaderStyle-CssClass="table-dark" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField HeaderText="Date Assumed Duty" DataField="DateAssumedDuty" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Method Of Recruitment" DataField="MethodOfRecruitment" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Medium Of Recruitment" DataField="MediumOfRecruitment" HeaderStyle-CssClass="table-dark" />
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-danger" ID="btnAction" runat="server" OnClick="RemoveServices">Remove</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>--%>


            <%--<% } %>--%>

            <div class="row justify-content-between mt-5">
                <div class="col-2">
                    <asp:Button runat="server" ID="page21" Text="<< Previous" CssClass="btn btn-success btn-user btn-block" OnClick="page2PrevClick" />
                </div>
                <div class="col-2" style="text-align: end">
                    <asp:Button runat="server" ID="page22" Text="Next >>" ValidationGroup="empService" CssClass="btn btn-success btn-user btn-block" OnClick="page2NextClick" />
                </div>
            </div>


        </div>


        <%-----------------------------------------------------------%>

        <div id="id3" runat="server">

            <div class="row mt-5 pl-2">
                <h4><b>Employement History Details</b></h4>
            </div>



            <div class="row mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col-5">
                            <label>Employee Name : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="empName" runat="server" CssClass="form-control form-control-user" TextMode="SingleLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Contract Type : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddContract" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Designation : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlDesignation" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Previous Work Place : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="companyName" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="companyName" ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>


                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Start Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="sDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="sDate" ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">

                <% if (ddContract.SelectedValue == "1" || ddContract.SelectedValue == "2")
                    { %>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>End Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="calcDate" runat="server" ReadOnly="true" CssClass="form-control form-control-user"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <%}
                    else
                    {  %>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>End Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="eDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="eDate" ID="RequiredFieldValidator28" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <%} %>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Is Resigned : </label>
                        </div>
                        <div class="col-6">
                            <asp:RadioButtonList ID="reseg" runat="server" AutoPostBack="true">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="2">No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="reseg" ValidationGroup="2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row mt-4">
                <%if (reseg.SelectedValue == "1")
                    {  %>
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Retired Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="retiredDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="retiredDate" ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="2" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <%} %>
            </div>


            <div class="row mt-4">
                <div class="col-2">
                    <asp:Button runat="server" ID="Button3" Text="Add" CssClass="btn btn-primary btn-user btn-block" OnClick="addEmployment" ValidationGroup="2" />
                </div>
            </div>


            <div cssclass="table-responsive" style="width: 100%;">
                <asp:GridView Style="margin-top: 30px;" ID="emplDetailsGV" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    CellPadding="4" GridLines="None">
                    <Columns>
                        <asp:BoundField HeaderText="Employee Name" DataField="EmpName" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Company Name" DataField="CompanyName" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Start Date" DataField="StartDate" HeaderStyle-CssClass="table-dark" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField HeaderText="End Date" DataField="EndDate" HeaderStyle-CssClass="table-dark" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:TemplateField HeaderText="Retirement Date" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:Label runat="server" Visible='<%#((DateTime)Eval("RetirementDate")).ToString() != "01/01/0001 12:00:00 AM" ?true:false %>' Text='<%#((DateTime)Eval("RetirementDate")).ToString("yyyy-MM-dd")%>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:BoundField HeaderText="Retirement Date" DataField="RetirementDate" HeaderStyle-CssClass="table-dark" DataFormatString="{0:dd-MM-yyyy}" />--%>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-danger" ID="btnAction" runat="server" OnClick="RemoveEmployDetails">Remove</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


            <div class="row justify-content-between mt-5">
                <div class="col-2">
                    <asp:Button runat="server" ID="page31" Text="<< Previous" CssClass="btn btn-success btn-user btn-block" OnClick="page3PrevClick" />
                </div>
                <div class="col-2" style="text-align: end">
                    <asp:Button runat="server" ID="page32" Text="Next >>" CssClass="btn btn-success btn-user btn-block" OnClick="page3NextClick" />
                </div>
            </div>

        </div>


        <%-----------------------------------------------------------%>


        <div id="id7" runat="server">

            <div class="row mt-5 pl-2">
                <h4><b>Dependant Details</b></h4>
            </div>


            <div class="row mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Dependant Type : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlDependant" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Relationship : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="dependantRelationship" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="dependantRelationship" ID="RequiredFieldValidator16" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>First Name : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="dependantFname" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="dependantFname" ID="RequiredFieldValidator17" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Last Name : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="dependantLname" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="dependantLname" ID="RequiredFieldValidator18" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Date of Birth: </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="depDob" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="depDob" ID="RequiredFieldValidator19" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Birth Certificate Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="bcNumber" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="bcNumber" ID="RequiredFieldValidator20" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Passport Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ppNumber" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Any Kind of Special Sickness : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="sickness" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>



            <%if (ddlDependant.SelectedValue == "1")
                { %>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Marriage Date : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="mDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="mDate" ID="RequiredFieldValidator23" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Marriage Certificate Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="mCertificateNo" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="mCertificateNo" ID="RequiredFieldValidator24" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Nic Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="depNic" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="depNic" ID="RequiredFieldValidator25" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="3" ID="RegularExpressionValidator10" ControlToValidate="depNic" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="^([0-9]{9}[x|X|v|V]|[0-9]{12})$">
									Invalid NIC</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Working Company : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="workingCompany" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="workingCompany" ID="RequiredFieldValidator26" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>City : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="city" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="city" ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <%} %>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Upload Birth Certificate / NIC / Photograph / Marriage Certificate : </label>
                        </div>
                        <div class="col-6">
                            <asp:FileUpload ID="Uploader" CssClass="btn" runat="server" AllowMultiple="true" />
                            <asp:Label ID="lblListOfUploadedFiles" runat="server" />
                            <asp:RequiredFieldValidator ControlToValidate="Uploader" ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="3" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4 pl-2">
                <div class="alert alert-danger" role="alert">
                    Please add all of above documants (Marriage Certificate - optional) and upload in a Zip file. Rename it with Empoyee's NIC number. Ex: xxxxxxxxv.rar
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-2">
                    <asp:Button runat="server" ID="add" Text="Add" CssClass="btn btn-primary btn-user btn-block" OnClick="addDependant" ValidationGroup="3" />
                </div>
            </div>

            <div cssclass="table-responsive " style="width: 100%;">
                <asp:GridView Style="margin-top: 30px;" ID="dependantGV" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    CellPadding="4" GridLines="None">
                    <Columns>
                        <asp:BoundField HeaderText="First Name" DataField="FirstName" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Last Name" DataField="LastName" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Dependant Passport No" DataField="DependantPassportNo" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Date of Birth" DataField="Dob" HeaderStyle-CssClass="table-dark" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField HeaderText="Relationship to Employee" DataField="RelationshipToEmp" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="BirthCertificate Number" DataField="BirthCertificateNumber" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Special Sickness" DataField="Remarks" HeaderStyle-CssClass="table-dark" />
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-danger" ID="btnAction" runat="server" OnClick="RemoveDependant">Remove</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <%--<% } %>--%>

            <div class="row justify-content-between mt-5">
                <div class="col-2">
                    <asp:Button runat="server" ID="nn" Text="<< Previous" CssClass="btn btn-success btn-user btn-block" OnClick="page4PrevClick" />
                </div>
                <div class="col-2" style="text-align: end">
                    <asp:Button runat="server" ID="mm" Text="Submit" CssClass="btn btn-danger btn-user btn-block" OnClick="submit" />
                </div>
            </div>

        </div>



        <%---------------------------------------------------------%>

        <%--<div id="id4" runat="server">

            <div class="row mt-5 pl-2">
                <h4><b>Employee Contact Details</b></h4>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Address : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="address" runat="server" CssClass="form-control form-control-user" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="address" ID="RequiredFieldValidator27" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Mobile Phone : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="EmpMobilePhone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="EmpMobilePhone" ID="RequiredFieldValidator52" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="EmpMobilePhone" ValidationGroup="4"
                                ForeColor="Red" Display="Dynamic">Invalid Telephone Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Telephone (Landline): </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="telephone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="telephone" ID="RequiredFieldValidator31" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="telephone" ValidationGroup="4"
                                ForeColor="Red" Display="Dynamic">Invalid Telephone Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Postal Code : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="postalCode" runat="server" CssClass="form-control form-control-user" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="postalCode" ID="RequiredFieldValidator32" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Office Phone : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="EmpOfficePhone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="EmpOfficePhone" ID="RequiredFieldValidator51" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="EmpOfficePhone" ValidationGroup="4"
                                ForeColor="Red" Display="Dynamic">Invalid Telephone Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Personal Email : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="email" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="email" ID="RequiredFieldValidator33" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="4" ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
							Invalid Email</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-between">
                <div class="col-9">
                    <asp:Button runat="server" ID="Button1" Text="<< Previous" CssClass="btn btn-success btn-user btn-block"  OnClick="page4PrevClick" />
                </div>
                <div class="col-3" style="text-align: end">
                    <asp:Button runat="server" ID="Button6" Text="Next >>" CssClass="btn btn-success btn-user btn-block"  OnClick="page4NextClick" ValidationGroup="4" />
                </div>
            </div>

        </div>--%>

        <%-----------------------------------------------------------%>

        <%--<div id="id5" runat="server">

            <div class="row mt-5 pl-2">
                <h4><b>Emergency Contact Details</b></h4>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Name : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ecName" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ecName" ID="RequiredFieldValidator34" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="4" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Home Telephone Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="landLine" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="landLine" ID="RequiredFieldValidator35" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="5" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="landLine" ValidationGroup="5"
                                ForeColor="Red" Display="Dynamic">Invalid Mobile Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Relationship To Employee : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ecRelationship" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ecRelationship" ID="RequiredFieldValidator36" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="5" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Office Phone Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ecOfficePhone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ecOfficePhone" ID="RequiredFieldValidator37" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="5" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="ecOfficePhone" ValidationGroup="5"
                                ForeColor="Red" Display="Dynamic">Invalid Mobile Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Address of Emergancy Contact Person : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ecAddress" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ecAddress" ID="RequiredFieldValidator38" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="5" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Mobile Number : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ecMobile" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ecMobile" ID="RequiredFieldValidator39" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="5" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobNo" runat="server" ErrorMessage="Invalid Mobile Number."
                                ValidationExpression="^([0-9]{10})$" ControlToValidate="ecMobile" ValidationGroup="5"
                                ForeColor="Red" Display="Dynamic">Invalid Mobile Number</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Personal Email : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="ecEmail" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="ecEmail" ID="RequiredFieldValidator40" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="5" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ValidationGroup="5" ID="RegularExpressionValidator2" ControlToValidate="ecEmail" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
							Invalid Email</asp:RegularExpressionValidator>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-between">
                <div class="col-9">
                    <asp:Button runat="server" ID="page41" Text="<< Previous" CssClass="btn btn-success btn-user btn-block"  OnClick="page5PrevClick" />
                </div>
                <div class="col-3" style="text-align: end">
                    <asp:Button runat="server" ID="page42" Text="Next >>" CssClass="btn btn-success btn-user btn-block"  OnClick="page5NextClick" ValidationGroup="5" />
                </div>
            </div>

        </div>--%>


        <%-----------------------------------------------------------%>

        <%--<div id="id6" runat="server">

            <div class="row mt-5 pl-2">
                <h4><b>Education Details</b></h4>
            </div>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Education Type : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlEducation" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>



                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Institute / School / University : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="uni" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="uni" ID="RequiredFieldValidator41" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="6" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Index Number: </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="index" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="index" ID="RequiredFieldValidator42" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="6" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>


                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Year : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>



            <%if (ddlEducation.SelectedValue == "4" || ddlEducation.SelectedValue == "5")
                {  %>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Attempt : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlAttempt" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Subject : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="sub" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="sub" ID="RequiredFieldValidator43" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="6" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Stream : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="stream" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="stream" ID="RequiredFieldValidator44" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="6" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Grade : </label>
                        </div>
                        <div class="col-6">
                            <asp:TextBox ID="grade" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="grade" ID="RequiredFieldValidator45" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="6" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>


            <%} %>

            <div class="row mt-4">
                <div class="col-6">
                    <div class="row">
                        <div class="col-4">
                            <label>Status : </label>
                        </div>
                        <div class="col-6">
                            <asp:DropDownList ID="ddlEducationStatus" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                        </div>
                    </div>
                </div>

            </div>


            <asp:Button runat="server" ID="Button4" Text="Add" CssClass="btn btn-primary btn-user btn-block" OnClick="addEducation" ValidationGroup="6" />




            <div cssclass="table-responsive" style="width: 100%;">
                <asp:GridView Style="margin-top: 30px;" ID="educationGV" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                    CellPadding="4" GridLines="None">
                    <Columns>
                        <asp:BoundField HeaderText="Education Type" DataField="EducationTypeId" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Studied Institute" DataField="StudiedInstitute" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Attempt" DataField="NoOfAttempts" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Exam Year" DataField="ExamYear" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Index" DataField="ExamIndex" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Subject" DataField="ExamSubject" HeaderStyle-CssClass="table-dark" />
                        <asp:BoundField HeaderText="Grade" DataField="ExamGrade" HeaderStyle-CssClass="table-dark" />
                        <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="table-dark">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-danger" ID="btnAction" runat="server" OnClick="RemoveEducation">Remove</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


            <div class="row justify-content-between">
                <div class="col-9">
                    <asp:Button runat="server" ID="aa" Text="<< Previous" CssClass="btn btn-success btn-user btn-block" OnClick="page6PrevClick" />
                </div>
                <div class="col-3" style="text-align: end">
                    <asp:Button runat="server" ID="Button2" Text="Next >>" CssClass="btn btn-success btn-user btn-block" OnClick="page6NextClick" />
                </div>
            </div>
        </div>--%>


        <%--------------------------------------------------------------------%>
    </div>
    <%--</ContentTemplate>
		</asp:UpdatePanel>--%>
</asp:Content>

