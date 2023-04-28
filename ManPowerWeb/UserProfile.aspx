﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ManPowerWeb.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div>
        <%-- <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>--%>
        <div class="row pl-5 mt-5">
            <h2>
                <b>My Profile - Employee ID :
                    <asp:Label ID="idNo" runat="server"></asp:Label>
                </b>
            </h2>
        </div>


        <div class="card p-5 mt-4">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#personalDetails">Personal Details </a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#contactDetails">Contact Details</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#emergencyContactDetails">Emergency Contact Details</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#empoymentDetails">Employment History</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#dependantDetails">Dependant Details</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#educationDetails">Education Details</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#resetPassword">Reset Password</a></li>
            </ul>

            <div class="tab-content mt-5">

                <div id="personalDetails" class="tab-pane fade">
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                        <ContentTemplate>

                            <h3>Personal Details </h3>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>File Number : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="fileNo" ReadOnly="true" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="fileNo" ID="RequiredFieldValidator21" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                    <asp:RequiredFieldValidator ControlToValidate="nameOfInitials" ID="RequiredFieldValidator22" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationGroup="emp" ID="RegularExpressionValidator13" ControlToValidate="nameOfInitials" runat="server" ForeColor="Red" ValidationExpression="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">
									Invalid Name</asp:RegularExpressionValidator>
                                </div>

                            </div>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Initials : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="initial" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="initial" ID="RequiredFieldValidator23" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>

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
                                            <asp:RequiredFieldValidator ControlToValidate="lname" ID="RequiredFieldValidator24" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ValidationGroup="emp" ID="RegularExpressionValidator12" ControlToValidate="lname" runat="server" ForeColor="Red" ValidationExpression="^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$">
									Invalid Name</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Date of Birth : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="dob" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="dob" ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

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
                            </div>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>NIC : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="nic" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="nic" ID="RequiredFieldValidator25" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ValidationGroup="emp" ID="RegularExpressionValidator8" ControlToValidate="nic" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="^([0-9]{9}[x|X|v|V]|[0-9]{12})$">
							Invalid NIC</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>NIC Issued Date : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="nicIssuedDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Designation : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:DropDownList ID="ddlEmpDesignation" runat="server" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ControlToValidate="ddlEmpDesignation" ID="RequiredFieldValidator29" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emp" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                            <asp:DropDownList ID="ddlMaritalStatus" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
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

                            <%-- <div class="row mt-5">
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

                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Passport Number : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="empPassport" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RegularExpressionValidator ValidationGroup="emp" ID="RegularExpressionValidator9" ControlToValidate="empPassport" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="^(?!^0+$)[a-zA-Z0-9]{3,20}$">
							        Invalid Passport</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Current Working Palce : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="district" ReadOnly="true" runat="server" CssClass="form-control form-control-user" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>DS Division : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="dsDivision" ReadOnly="true" runat="server" CssClass="form-control form-control-user" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-5">
                                <%-- <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>ED Completion Date : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="txtEDComDate" runat="server" CssClass="form-control form-control-user" TextMode="Date" ReadOnly="true"></asp:TextBox>
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
                                            <asp:TextBox ID="txtSalaryNum" runat="server" CssClass="form-control form-control-user" ReadOnly="true"></asp:TextBox>
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
                                            <asp:TextBox ID="vnop" runat="server" ReadOnly="true" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Appointment letter Number : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="appointmenLetterNo" runat="server" ReadOnly="true" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <%----------------------------------------------------------------------------%>


                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="btnSubmit1" ValidationGroup="emp" OnClick="submitEmployee" Text="Update" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnSubmit1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <%---------tab 2---------%>

                <div id="contactDetails" class="tab-pane fade">
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                            <h3>Employee Contact Details</h3>


                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Address : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="address" runat="server" CssClass="form-control form-control-user" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="address" ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="contact" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Mobile Number."
                                                ValidationExpression="^([0-9]{10})$" ControlToValidate="EmpMobilePhone" ValidationGroup="contact"
                                                ForeColor="Red" Display="Dynamic">Invalid Mobile Phone Number</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ControlToValidate="EmpMobilePhone" ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator"
                                                ValidationGroup="contact" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Telephone (Landline) : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="telephone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid Mobile Number."
                                                ValidationExpression="^([0-9]{10})$" ControlToValidate="telephone" ValidationGroup="contact"
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
                                            <asp:RegularExpressionValidator ValidationGroup="contact" ID="RegularExpressionValidator11" ControlToValidate="postalCode" runat="server" ForeColor="Red" ValidationExpression="^\d+$">
                                Invalid Postal Code
                                            </asp:RegularExpressionValidator>
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
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Invalid Mobile Number."
                                                ValidationExpression="^([0-9]{10})$" ControlToValidate="EmpOfficePhone" ValidationGroup="contact"
                                                ForeColor="Red" Display="Dynamic">Invalid Office Phone Number</asp:RegularExpressionValidator>
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
                                            <asp:RegularExpressionValidator ValidationGroup="contact" ID="RegularExpressionValidator4" ControlToValidate="email" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
							    Invalid Email</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ControlToValidate="email" ID="RequiredFieldValidator17" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="contact" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%----------------------------------------------------------------------------%>


                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="Button1" Text="Update" ValidationGroup="contact" OnClick="submitContact" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="Button1" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <%-------- tab 3 --------%>

                <div id="emergencyContactDetails" class="tab-pane fade">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                            <h3>Employee Emergency Contact Details</h3>


                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Name : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="ecName" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="ecName" ID="RequiredFieldValidator18" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emcontact" ForeColor="Red">*</asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Relationship To Employee : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="ecRelationship" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RequiredFieldValidator ControlToValidate="ecRelationship" ID="RequiredFieldValidator19" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emcontact" ForeColor="Red">*</asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Mobile Phone : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="ecMobile" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="revMobNo" runat="server" ErrorMessage="Invalid Mobile Number."
                                                ValidationExpression="^([0-9]{10})$" ControlToValidate="ecMobile" ValidationGroup="5"
                                                ForeColor="Red" Display="Dynamic">Invalid Mobile Number</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ControlToValidate="ecMobile" ID="RequiredFieldValidator20" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="emcontact" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Telephone (Landline) : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="landLine" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Mobile Number."
                                                ValidationExpression="^([0-9]{10})$" ControlToValidate="landLine" ValidationGroup="5"
                                                ForeColor="Red" Display="Dynamic">Invalid Telephone Number</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Address of Emergancy Contact Person : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="ecAddress" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Office Phone : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="ecOfficePhone" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number."
                                                ValidationExpression="^([0-9]{10})$" ControlToValidate="ecOfficePhone" ValidationGroup="5"
                                                ForeColor="Red" Display="Dynamic">Invalid Office Phone Number</asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="Button2" Text="Update" ValidationGroup="emcontact" OnClick="submitEmergencyContact" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="Button2" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <%-------- tab 4 --------%>

                <div id="empoymentDetails" class="tab-pane fade">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>

                            <h3>Employment History Details</h3>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Select Previous Work Place : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:DropDownList ID="ddlEmpDetails" runat="server" OnSelectedIndexChanged="ddlEmpDetails_SelectedIndexChanged" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%if (ddlEmpDetails.SelectedValue != "")
                                {  %>


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
                                            <label>Company Name : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="companyName" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
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
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>End Date : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="eDate" runat="server" CssClass="form-control form-control-user" TextMode="Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

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
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>

                            <div id="empRowId" runat="server">
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4">
                                                <label>ID : </label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="empDetailId" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%} %>

                            <%----------------------------------------------------------------------------%>


                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="Button4" Text="Update" ValidationGroup="5" OnClick="submitEmploymentDetails" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="Button4" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <%-------- tab 5 --------%>

                <div id="dependantDetails" class="tab-pane fade">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <h3>Dependant Details</h3>


                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Select Dependant : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:DropDownList ID="ddlDependantList" runat="server" OnSelectedIndexChanged="ddlDependantList_SelectedIndexChanged" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--  <%if (ddlDependantList.SelectedValue != "")
                                {  %>--%>


                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Dependant Type : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:DropDownList ID="ddlDependant" runat="server" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="ddlDependant" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="dependantRelationship" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="dependantFname" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="dependantLname" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="depDob" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="mDate" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="dependnt"
                                                    ControlToValidate="mCertificateNo" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
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
                                            <asp:RegularExpressionValidator ValidationGroup="dependnt" ID="RegularExpressionValidator10" ControlToValidate="depNic" runat="server"
                                                ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="^([0-9]{9}[x|X|v|V]|[0-9]{12})$">
									Invalid NIC</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="dependnt"
                                                ControlToValidate="depNic" ErrorMessage="Required">*</asp:RequiredFieldValidator>
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
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%} %>

                            <div id="depRowId" runat="server">
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4">
                                                <label>ID : </label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="depId" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="btnDependant" Text="Add" ValidationGroup="dependnt" OnClick="submitDependant" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                            </div>

                            <%-- <%} %>--%>
                            <%----------------------------------------------------------------------------%>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnDependant" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>


                <%-------- tab 6 --------%>

                <div id="educationDetails" class="tab-pane fade">

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>

                            <h3>Education Details</h3>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Education Type : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:DropDownList ID="ddlEducationDetailsList" runat="server" OnSelectedIndexChanged="ddlEducation_SelectedIndexChanged" AutoPostBack="true" CssClass="dropdown-toggle form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%if (ddlEducationDetailsList.SelectedValue != "")
                                {  %>

                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Institute / School / University : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="uni" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
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
                                        </div>
                                    </div>
                                </div>


                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Year : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="year" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <%if (ddlEducationDetailsList.SelectedValue == "4" || ddlEducationDetailsList.SelectedValue == "5")
                                {  %>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Attempt : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="attempt" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
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
                                            <asp:TextBox ID="status" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div id="eduRowId" runat="server">
                                <div class="row mt-4">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-4">
                                                <label>ID : </label>
                                            </div>
                                            <div class="col-6">
                                                <asp:TextBox ID="eduId" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-4">
                                            <label>Upload File : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control-file"></asp:FileUpload>
                                            <asp:Label ID="lblfileUpload" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <%} %>


                            <%----------------------------------------------------------------------------%>


                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="Button3" Text="Add" OnClick="submitEducation" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                                <div class="col-2">
                                    <asp:Button runat="server" ID="Button5" Text="Update" OnClick="updateEducation" CssClass="btn btn-primary btn-user btn-block" />
                                    <%--ValidationGroup="5"--%>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="Button3" />
                            <asp:PostBackTrigger ControlID="Button5" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>


                <%-------- tab 7 --------%>

                <div id="resetPassword" class="tab-pane fade">

                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>

                            <h3>Reset Password</h3>

                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Current Password : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="resetPass"
                                                    ControlToValidate="txtCurrentPassword" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                                <asp:Label ID="lblCurPass" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Enter New Password : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="txtNewPasword" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="resetPass"
                                                    ControlToValidate="txtNewPasword" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-5">
                                            <label>Re-Enter New Password : </label>
                                        </div>
                                        <div class="col-6">
                                            <asp:TextBox ID="txtReNewPasword" runat="server" CssClass="form-control form-control-user"></asp:TextBox>
                                            <div class="d-flex text-danger">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="resetPass"
                                                    ControlToValidate="txtReNewPasword" ErrorMessage="Required">*</asp:RequiredFieldValidator>
                                                <asp:Label ID="lblMisMatchPwd" runat="server" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5 mb-4">
                                <div class="col-2">
                                    <asp:Button runat="server" ID="btnResetPassword" Text="Update" ValidationGroup="resetPass" Autopostback="true" OnClick="btnResetPassword_Click" CssClass="btn btn-primary btn-user btn-block" />
                                </div>
                            </div>

                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnResetPassword" />
                        </Triggers>
                    </asp:UpdatePanel>


                    <%----------------------------------------------------------------------------%>
                </div>

            </div>
        </div>
        <%-- </ContentTemplate>
            <Triggers>
               <asp:PostBackTrigger ControlID="btnResetPassword" />
            </Triggers>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
