﻿using ManPowerCore.Common;
using ManPowerCore.Controller;
using ManPowerCore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManPowerWeb
{
	public partial class AddTransfersRetirementResignation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

			if (Session["UserId"] != null)
			{
				if (!IsPostBack)
				{
					BindRequestType();
					BindEmpData();
				}
			}
			else
			{
				HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
				HttpContext.Current.Response.AddHeader("Expires", "0");
				Response.Redirect("Login.aspx");
			}
		}

		private void BindRequestType()
		{
			RequestTypeController requestTypeController = ControllerFactory.CreateRequestTypeController();
			ddlRequestType.DataSource = requestTypeController.GetAllRequestType(false);
			ddlRequestType.DataValueField = "Id";
			ddlRequestType.DataTextField = "RequestTypeName";
			ddlRequestType.DataBind();
			ddlRequestType.Items.Insert(0, new ListItem("-- select request type --", ""));

			if (ddlRequestType.SelectedValue == "")
			{
				transferDiv.Visible = false;
				retirementDiv.Visible = false;
				resignationDiv.Visible = false;
			}
		}

		private void BindEmpData()
		{
			lblEmpNumber.Text = Session["EmpNumber"].ToString();
			lblEmpName.Text = Session["Name"].ToString();

			EmployeeController employeeController = ControllerFactory.CreateEmployeeController();
			Employee employee = employeeController.GetEmployeeById(Convert.ToInt32(Session["EmpNumber"]));
			txtDob.Text = employee.DOB.ToString("yyyy-MM-dd");

            EmployeeContactController employeeContactController = ControllerFactory.CreateEmployeeContactController();
            
            List<EmployeeContact> employeeContacts = employeeContactController.GetEmployeeContactById(Convert.ToInt32(Session["EmpNumber"]));
            lblEmployeeAddress.Text = employeeContacts[0].EmpAddress.ToString();

            SystemUserController systemUserController = ControllerFactory.CreateSystemUserController();
            SystemUser systemUser = systemUserController.GetSystemUser(Convert.ToInt32(Session["UserId"]), true, false, true);

			DepartmentUnitController departmentUnitController = ControllerFactory.CreateDepartmentUnitController();
			DepartmentUnit departmentUnit = departmentUnitController.GetDepartmentUnit(systemUser._DepartmentUnitPositions.DepartmentUnitId, true, false);
			lblDepartment.Text = departmentUnit.Name;

			DesignationController designationController = ControllerFactory.CreateDesignationController();
			Designation designation = designationController.GetDesignation(systemUser.DesignationId, true, false);

			lblDesignation.Text = designation.DesigntionName;
		}

		protected void btnBack_Click(object sender, EventArgs e)
		{
			Response.Redirect("TransfersRetirementResignation.aspx");
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{
			string type = ddlRequestType.SelectedValue;
			int output = 0;

			//--------------------------------------------------Transfer--------------------------------------------------------

			if (type == "1")
			{
				TransfersRetirementResignationMain transfersRetirementResignationMain = new TransfersRetirementResignationMain();
				Transfer transfer = new Transfer();

				transfersRetirementResignationMain.RequestTypeId = 1;
				transfersRetirementResignationMain.StatusId = 1;
				transfersRetirementResignationMain.EmployeeId = Convert.ToInt32(Session["EmpNumber"]);
				transfersRetirementResignationMain.CreatedDate = DateTime.Now;
				transfersRetirementResignationMain.CreatedUser = Session["Name"].ToString();
				transfersRetirementResignationMain.RequestTypeId = Convert.ToInt32(type);
				transfersRetirementResignationMain.ParentId = Convert.ToInt32(Session["DepUnitParentId"]);
				transfersRetirementResignationMain.Documents = "";

				List<string> DocList = new List<string>();

				if (Uploader.HasFile)
				{
					HttpFileCollection uploadFiles = Request.Files;
					for (int i = 0; i < uploadFiles.Count; i++)
					{
						HttpPostedFile uploadFile = uploadFiles[i];
						if (uploadFile.ContentLength > 0)
						{
							uploadFile.SaveAs(Server.MapPath("~/SystemDocuments/Transfers/") + uploadFile.FileName);
							transfersRetirementResignationMain.Documents = uploadFile.FileName;
							DocList.Add(uploadFile.FileName);
						}
					}
				}

				transfer.TransferType = ddlTransferType.SelectedValue;
				transfer.CurrentDep = lblDepartment.Text;
				transfer.Reason = txtReason.Text;

                if (transfer.TransferType == "Combine Service")
                {
                    transfer.NextDep = 0;
                    transfer.PreferedWorkPlace2 = 0;
                    transfer.PreferdWorkPlace3 = 0;
                    transfer.RequestWorkPlace = txtRequestWorkPlace.Text;
                }
                else
                {
                    transfer.NextDep = Convert.ToInt32(ddlDepartment.SelectedValue);
                    transfer.RequestWorkPlace = txtRequestWorkPlace.Text;
                    transfer.PreferedWorkPlace2 = Convert.ToInt32(ddlDepartment2.SelectedValue);
                    transfer.PreferdWorkPlace3 = Convert.ToInt32(ddlDepartment3.SelectedValue);
                }

				TransferController transferController = ControllerFactory.CreateTransferController();
				output = transferController.Save(transfersRetirementResignationMain, transfer, DocList);
				if (output == 1)
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success!', 'Record Added Succesfully!', 'success');window.setTimeout(function(){window.location='TransfersRetirementResignation.aspx'},2500);", true);
				}
				else
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error!', 'Record Added Fail!', 'error');", true);
				}
			}

			//--------------------------------------------------Temporary Attchement--------------------------------------------------------

			if (type == "4")
			{
				if (Convert.ToDateTime(txtFromDate.Text) > DateTime.Now.Date && Convert.ToDateTime(txtToDate.Text) > DateTime.Now.Date && Convert.ToDateTime(txtToDate.Text) > Convert.ToDateTime(txtFromDate.Text))
				{
					TransfersRetirementResignationMain transfersRetirementResignationMain = new TransfersRetirementResignationMain();
					Transfer transfer = new Transfer();

					transfersRetirementResignationMain.RequestTypeId = 1;
					transfersRetirementResignationMain.StatusId = 1;
					transfersRetirementResignationMain.EmployeeId = Convert.ToInt32(Session["EmpNumber"]);
					transfersRetirementResignationMain.CreatedDate = DateTime.Now;
					transfersRetirementResignationMain.CreatedUser = Session["Name"].ToString();
					transfersRetirementResignationMain.RequestTypeId = Convert.ToInt32(type);
					transfersRetirementResignationMain.ParentId = Convert.ToInt32(Session["DepUnitParentId"]);
					transfersRetirementResignationMain.Documents = "";

					List<string> DocList = new List<string>();

					if (Uploader.HasFile)
					{
						HttpFileCollection uploadFiles = Request.Files;
						for (int i = 0; i < uploadFiles.Count; i++)
						{
							HttpPostedFile uploadFile = uploadFiles[i];
							if (uploadFile.ContentLength > 0)
							{
								uploadFile.SaveAs(Server.MapPath("~/SystemDocuments/Transfers/") + uploadFile.FileName);
								transfersRetirementResignationMain.Documents = uploadFile.FileName;
								DocList.Add(uploadFile.FileName);
							}
						}
					}

					transfer.TransferType = ddlTransferType.SelectedValue;
					transfer.CurrentDep = lblDepartment.Text;
					transfer.NextDep = Convert.ToInt32(ddlDepartment.SelectedValue);
					transfer.Reason = txtReason.Text;
					transfer.FromDate = Convert.ToDateTime(txtFromDate.Text);
					transfer.ToDate = Convert.ToDateTime(txtToDate.Text);

                    if (transfer.TransferType == "Combine Service")
                    {
                        transfer.NextDep = 0;

                        //
                        //


                        transfer.RequestWorkPlace = txtRequestWorkPlace.Text;
                    }
                    else
                    {
                        transfer.NextDep = Convert.ToInt32(ddlDepartment.SelectedValue);
                      //
                      //

                    }

					TransferController transferController = ControllerFactory.CreateTransferController();
					output = transferController.Save(transfersRetirementResignationMain, transfer, DocList);
					if (output == 1)
					{
						ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success!', 'Record Added Succesfully!', 'success');window.setTimeout(function(){window.location='TransfersRetirementResignation.aspx'},2500);", true);
					}
					else
					{
						ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error!', 'Record Added Fail!', 'error');", true);
					}
				}
				else
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error!', 'InValid Date Range!', 'error');", true);
				}
			}


			//--------------------------------------------------Resignation--------------------------------------------------------

			if (type == "2")
			{
				TransfersRetirementResignationMain transfersRetirementResignationMain = new TransfersRetirementResignationMain();
				Resignation resignation = new Resignation();

				transfersRetirementResignationMain.RequestTypeId = 1;
				transfersRetirementResignationMain.StatusId = 1;
				transfersRetirementResignationMain.EmployeeId = Convert.ToInt32(Session["EmpNumber"]);
				transfersRetirementResignationMain.CreatedDate = DateTime.Now;
				transfersRetirementResignationMain.CreatedUser = Session["Name"].ToString();
				transfersRetirementResignationMain.RequestTypeId = Convert.ToInt32(type);
				transfersRetirementResignationMain.ParentId = Convert.ToInt32(Session["DepUnitParentId"]);
				transfersRetirementResignationMain.Documents = "";

				List<string> DocList = new List<string>();

				if (Uploader.HasFile)
				{
					HttpFileCollection uploadFiles = Request.Files;
					for (int i = 0; i < uploadFiles.Count; i++)
					{
						HttpPostedFile uploadFile = uploadFiles[i];
						if (uploadFile.ContentLength > 0)
						{
							uploadFile.SaveAs(Server.MapPath("~/SystemDocuments/Resignation/") + uploadFile.FileName);
							transfersRetirementResignationMain.Documents = uploadFile.FileName;
							DocList.Add(uploadFile.FileName);
						}
					}
				}


				resignation.ResignationDate = DateTime.Parse(txtResignationDate.Text);
				resignation.Reason = txtResignationReason.Text;

				ResignationController resignationController = ControllerFactory.CreateResignationController();
				output = resignationController.Save(transfersRetirementResignationMain, resignation, DocList);
				if (output == 1)
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success!', 'Record Added Succesfully!', 'success');window.setTimeout(function(){window.location='TransfersRetirementResignation.aspx'},2500);", true);
				}
				else
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error!', 'Record Added Succesfully!', 'error');", true);
				}
			}


			//--------------------------------------------------Retirement--------------------------------------------------------


			if (type == "3")
			{
				TransfersRetirementResignationMain transfersRetirementResignationMain = new TransfersRetirementResignationMain();
				Retirement retirement = new Retirement();

				transfersRetirementResignationMain.RequestTypeId = 1;
				transfersRetirementResignationMain.StatusId = 1;
				transfersRetirementResignationMain.EmployeeId = Convert.ToInt32(Session["EmpNumber"]);
				transfersRetirementResignationMain.CreatedDate = DateTime.Now;
				transfersRetirementResignationMain.CreatedUser = Session["Name"].ToString();
				transfersRetirementResignationMain.RequestTypeId = Convert.ToInt32(type);
				transfersRetirementResignationMain.ParentId = Convert.ToInt32(Session["DepUnitParentId"]);
				transfersRetirementResignationMain.Documents = "";

				List<string> DocList = new List<string>();

				if (Uploader.HasFile)
				{
					HttpFileCollection uploadFiles = Request.Files;
					for (int i = 0; i < uploadFiles.Count; i++)
					{
						HttpPostedFile uploadFile = uploadFiles[i];
						if (uploadFile.ContentLength > 0)
						{
							uploadFile.SaveAs(Server.MapPath("~/SystemDocuments/Retirement/") + uploadFile.FileName);
							transfersRetirementResignationMain.Documents = uploadFile.FileName;
							DocList.Add(uploadFile.FileName);
						}
					}
				}

                retirement.JoinedDate = DateTime.Parse(txtJoinedDate.Text);
                retirement.Remark = txtRetirementRemark.Text;
                if (ddlRetirementType.SelectedItem.Text == "Other")
                {
                    retirement.RetirementType = txtRetirementOther.Text;
                }
                else
                {
                    retirement.JoinedDate = DateTime.Parse(txtJoinedDate.Text);
                    retirement.Remark = txtRetirementRemark.Text;
                    if (ddlRetirementType.SelectedItem.Text == "Other")
                    {
                        retirement.RetirementType = txtRetirementOther.Text;
                    }
                    else
                    {
                        retirement.RetirementType = ddlRetirementType.SelectedValue;
                    }
                    retirement.Reason = txtRetirementReason.Text;
                    retirement.RetirementType = ddlRetirementType.SelectedValue;
                }
                retirement.Reason = txtRetirementReason.Text;

				RetirementController retirementController = ControllerFactory.CreateRetirementController();
				output = retirementController.Save(transfersRetirementResignationMain, retirement, DocList);
				if (output == 1)
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success!', 'Record Added Succesfully!', 'success');window.setTimeout(function(){window.location='TransfersRetirementResignation.aspx'},2500);", true);
				}
				else
				{
					ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Error!', 'Record Added Succesfully!', 'error');", true);
				}
			}

		}





		protected void ddlRequestType_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (ddlRequestType.SelectedValue == "")
			{
				transferDiv.Visible = false;
				retirementDiv.Visible = false;
				resignationDiv.Visible = false;
				FromToDate.Visible = false;
			}
			if (ddlRequestType.SelectedValue == "1")
			{
				transferDiv.Visible = true;
				retirementDiv.Visible = false;
				resignationDiv.Visible = false;
				FromToDate.Visible = false;

				BindTransferType();
				BindDepList();
			}
			if (ddlRequestType.SelectedValue == "2")
			{
				transferDiv.Visible = false;
				retirementDiv.Visible = false;
				resignationDiv.Visible = true;
				FromToDate.Visible = false;
			}
			if (ddlRequestType.SelectedValue == "3")
			{
				transferDiv.Visible = false;
				retirementDiv.Visible = true;
				resignationDiv.Visible = false;
				FromToDate.Visible = false;

				BindRetirementType();
			}
			if (ddlRequestType.SelectedValue == "4")
			{
				transferDiv.Visible = true;
				retirementDiv.Visible = false;
				resignationDiv.Visible = false;
				FromToDate.Visible = true;

				BindTransferType();
				BindDepList();
			}
		}

        private void BindDepList()
        {
            DepartmentUnitController departmentUnitTypeController = ControllerFactory.CreateDepartmentUnitController();

            // Retrieve data from DB assign to list
            List<DepartmentUnit> departmentUnitType = departmentUnitTypeController.GetAllDepartmentUnit(false, false);

            List<DepartmentUnit> departmentUnitType2 = departmentUnitType;

            List<DepartmentUnit> departmentUnitType3 = departmentUnitType;

            ddlDepartment.DataSource = departmentUnitType;
            ddlDepartment.DataValueField = "DepartmentUnitId";
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("-- Select prefered work place --", ""));

            ddlDepartment2.DataSource = departmentUnitType2;
            ddlDepartment2.DataValueField = "DepartmentUnitId";
            ddlDepartment2.DataTextField = "Name";
            ddlDepartment2.DataBind();
            ddlDepartment2.Items.Insert(0, new ListItem("-- Select prefered work place --", ""));

            ddlDepartment3.DataSource = departmentUnitType3;
            ddlDepartment3.DataValueField = "DepartmentUnitId";
            ddlDepartment3.DataTextField = "Name";
            ddlDepartment3.DataBind();
            ddlDepartment3.Items.Insert(0, new ListItem("-- Select prefered work place --", ""));
        }

		private void BindTransferType()
		{

			TransferTypeController transferTypeController = ControllerFactory.CreateTransferTypeController();
			List<TransferType> transferType = transferTypeController.GetAllTransferType(false);
			ddlTransferType.DataSource = transferType;
			ddlTransferType.DataValueField = "TransferTypeName";
			ddlTransferType.DataTextField = "TransferTypeName";
			ddlTransferType.DataBind();
			ddlTransferType.Items.Insert(0, new ListItem("-- select transfer type --", ""));

		}

		private void BindRetirementType()
		{

			RetirementTypeController retirementTypeController = ControllerFactory.CreateRetirementTypeController();
			List<RetirementType> retirementTypes = retirementTypeController.GetAllRetirementType(false);

			ddlRetirementType.DataSource = retirementTypes;
			ddlRetirementType.DataValueField = "RetirementTypeName";
			ddlRetirementType.DataTextField = "RetirementTypeName";
			ddlRetirementType.DataBind();
			ddlRetirementType.Items.Insert(0, new ListItem("-- select retirement type --", ""));

		}

	}
}