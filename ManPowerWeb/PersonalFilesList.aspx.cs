﻿using ManPowerCore.Common;
using ManPowerCore.Controller;
using ManPowerCore.Domain;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManPowerWeb
{
	public partial class PersonalFilesList : System.Web.UI.Page
	{
		static List<Employee> employees = new List<Employee>();
		static List<Employee> employeesFilter = new List<Employee>();

		protected void Page_Load(object sender, EventArgs e)
		{
			this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

			if (!IsPostBack)
			{
				BindEmployee();
			}
		}

		private void BindEmployee()
		{
			EmployeeController employeeController = ControllerFactory.CreateEmployeeController();
			employees = employeeController.GetAllEmployees();
			//employeesFilter = employees.ToList();
		}

		protected void btnSearch_Click(object sender, EventArgs e)
		{
			if (txtName.Text != "" && txtName.Text != null)
			{
				employeesFilter = employees.
				   Where(x => x.NameWithInitials.ToLower().Contains(txtName.Text.ToLower()) ||
				   x.EmpInitials.ToLower().Contains(txtName.Text.ToLower()) ||
				   x._DepartmentUnit.Name.ToLower().Contains(txtName.Text.ToLower()) ||
				   x.LastName.ToLower().Contains(txtName.Text.ToLower()) ||
				   x.EmployeeNIC.ToLower().Contains(txtName.Text.ToLower())).ToList();


				gvPersonalFiles.DataSource = employeesFilter;
				gvPersonalFiles.DataBind();

				lblSearch.Text = "Search Result for '" + txtName.Text + "'";

				if (gvPersonalFiles.Rows.Count == 0)
				{
					gvPersonalFiles.EmptyDataText = "No data found";

				}
			}
			else
			{
				employeesFilter.Clear();
				gvPersonalFiles.DataSource = employeesFilter;
				gvPersonalFiles.DataBind();

				lblSearch.Text = string.Empty;
			}

		}

		public override void VerifyRenderingInServerForm(Control control)
		{

		}
		protected void btnExportExcel_Click(object sender, EventArgs e)
		{
			if (employees.Count > 0)
			{
				gvPersonalFiles.Columns[9].Visible = false;
				Response.Clear();
				Response.Buffer = true;
				Response.ClearContent();
				Response.ClearHeaders();
				Response.Charset = "";
				string FileName = "Personal Files " + DateTime.Now + ".xls";
				StringWriter strwritter = new StringWriter();
				HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
				Response.Cache.SetCacheability(HttpCacheability.NoCache);
				Response.ContentType = "application/vnd.ms-excel";
				Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
				gvPersonalFiles.GridLines = GridLines.Both;
				//gvPersonalFiles.HeaderStyle.Font.Bold = true;
				gvPersonalFiles.RenderControl(htmltextwrtter);
				Response.Write(strwritter.ToString());
				Response.End();
			}
			gvPersonalFiles.Columns[9].Visible = true;
		}

		protected void btnView_Click(object sender, EventArgs e)
		{
			int rowIndex = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
			int pagesize = gvPersonalFiles.PageSize;
			int pageindex = gvPersonalFiles.PageIndex;
			rowIndex = (pagesize * pageindex) + rowIndex;

			//------------------ Encrypt URL ---------------------------------------
			string queryString = "Id=" + employeesFilter[rowIndex].EmployeeId;
			FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
				version: 1,
				name: "MyAuthTicket",
				issueDate: DateTime.Now,
				expiration: DateTime.Now.AddMinutes(10),
				isPersistent: false,
				userData: queryString,
				cookiePath: FormsAuthentication.FormsCookiePath);

			string encryptedTicket = FormsAuthentication.Encrypt(ticket);
			string url = "PersonalFilesListView.aspx?Ticket=" + encryptedTicket;
			Response.Redirect(url);

			//Response.Redirect("PersonalFilesListView.aspx?Id=" + employeesFilter[rowIndex].EmployeeId);
		}
	}
}