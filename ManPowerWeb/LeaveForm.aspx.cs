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
    public partial class LeaveForm : System.Web.UI.Page
    {
        static List<LeaveType> leavesTypeList = new List<LeaveType>();
        List<HolidaySheet> holidaySheetsList = new List<HolidaySheet>();
        static List<StaffLeave> staffLeavesList = new List<StaffLeave>();
        List<StaffLeaveAllocation> staffLeaveAllocationsList = new List<StaffLeaveAllocation>();

        int empId;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            empId = Convert.ToInt32(Session["EmpNumber"]);
            if (!IsPostBack)
            {
                bindData();
                bindgvMyLeaves();
            }
        }


        private void bindData()
        {
            LeaveTypeController leaveTypeController = ControllerFactory.CreateLeaveTypeController();
            leavesTypeList = leaveTypeController.GetAllLeaveTypes();

            leavesTypeList = leavesTypeList.Where(x => x.IsActive == 1).ToList();

            ddlLeaveType.DataSource = leavesTypeList;
            ddlLeaveType.DataValueField = "LeaveTypeId";
            ddlLeaveType.DataTextField = "Name";
            ddlLeaveType.DataBind();
            ddlLeaveType.Items.Insert(0, new ListItem("Select Leave Type", ""));

        }

        private void bindgvMyLeaves()
        {
            try
            {
                StaffLeaveController staffLeaveController = ControllerFactory.CreateStaffLeaveControllerImpl();
                staffLeavesList = staffLeaveController.getStaffLeaves(true).Where(x => x.LeaveStatusId == 1 && x._EMployeeDetails.UnitType != 1).ToList();
                // ViewState["staffLeavesList"] = staffLeavesList.Where(x => x.EmployeeId == empId);
            }
            catch
            {
                staffLeavesList.Clear();
            }
            finally
            {
                gvMyLeaves.DataSource = staffLeavesList;
                gvMyLeaves.DataBind();
            }

        }
        protected void gvMyLeaves_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMyLeaves.PageIndex = e.NewPageIndex;
            bindgvMyLeaves();
        }

        protected void btnChoose_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
            int pagesize = gvMyLeaves.PageSize;
            int pageindex = gvMyLeaves.PageIndex;
            rowIndex = (pagesize * pageindex) + rowIndex;

            StaffLeave staffLeave = staffLeavesList[rowIndex];

            txtLeaveId.Text = staffLeave.StaffLeaveId.ToString();
            txtxEmpId.Text = staffLeave.EmployeeId.ToString();
            lblListOfUploadedFiles.Text = staffLeave.LeaveDocument;

            bindData();

            int year = DateTime.Today.Year;
            StaffLeaveController staffLeaveController = ControllerFactory.CreateStaffLeaveControllerImpl();

            decimal casual = staffLeaveController.getRemainLeaveByEmpAndYear(staffLeave.EmployeeId, year, 1);
            decimal medical = staffLeaveController.getRemainLeaveByEmpAndYear(staffLeave.EmployeeId, year, 2);
            decimal lapsed = staffLeaveController.getRemainLeaveByEmpAndYear(staffLeave.EmployeeId, year, 7);

            if (casual <= 0) { leavesTypeList.RemoveAll(x => x.LeaveTypeId == 1); }
            if (medical <= 0) { leavesTypeList.RemoveAll(x => x.LeaveTypeId == 2); }
            if (lapsed <= 0) { leavesTypeList.RemoveAll(x => x.LeaveTypeId == 7); }
            if (casual > 0 || medical > 0) { leavesTypeList.RemoveAll(x => x.LeaveTypeId == 7); }

            ddlLeaveType.DataSource = leavesTypeList;
            ddlLeaveType.DataValueField = "LeaveTypeId";
            ddlLeaveType.DataTextField = "Name";
            ddlLeaveType.DataBind();
            ddlLeaveType.Items.Insert(0, new ListItem("Select Leave Type", ""));
        }

        protected void btnApplyLeave_Click(object sender, EventArgs e)
        {
            StaffLeaveController staffLeaveController = ControllerFactory.CreateStaffLeaveControllerImpl();
            StaffLeave staffLeave = new StaffLeave();

            bool validation = false;

            int response = 0;



            if (DateTime.Parse(txtDateCommencing.Text) > DateTime.Now)
            {
                staffLeave.LeaveDate = DateTime.Parse(txtDateCommencing.Text);
                validation = true;

            }
            else
            {
                lblDate.Text = "Invalid Date";
            }



            staffLeave.CreatedDate = DateTime.Now;
            staffLeave.DayTypeId = int.Parse(ddlDayType.SelectedValue);

            //must change
            staffLeave.EmployeeId = Convert.ToInt32(txtxEmpId.Text);
            staffLeave.StaffLeaveId = Convert.ToInt32(txtLeaveId.Text);

            if (ddlDayType.SelectedValue == "3")
            {
                staffLeave.IsHalfDay = 0;
            }
            else
            {
                staffLeave.IsHalfDay = 1;
            }


            staffLeave.ReasonForLeave = txtLeaveReason.Text;
            staffLeave.LeaveTypeId = int.Parse(ddlLeaveType.SelectedValue);


            if (ddlLeaveType.SelectedValue == "4")
            {
                staffLeave.FromTime = DateTime.Parse(txtDateCommencing.Text).Add(TimeSpan.Parse(txtFrom.Text));

                staffLeave.ToTime = DateTime.Parse(txtDateCommencing.Text).Add(TimeSpan.Parse(txtTo.Text));
                staffLeave.NoOfLeaves = 0;
                staffLeave.ResumingDate = DateTime.Parse(txtDateCommencing.Text);
                if (staffLeave.FromTime < staffLeave.ToTime)
                {
                    validation = true;
                }
                else
                {
                    validation = false;
                }


            }
            else
            {
                staffLeave.FromTime = DateTime.Parse(txtDateCommencing.Text); ;
                staffLeave.ToTime = DateTime.Parse(txtDateResuming.Text); ;
                staffLeave.NoOfLeaves = float.Parse(txtNoOfDates.Text);
                staffLeave.ResumingDate = DateTime.Parse(txtDateResuming.Text);

            }


            //if (Uploader.HasFile)
            //{
            //    HttpFileCollection uploadFiles = Request.Files;
            //    for (int i = 0; i < uploadFiles.Count; i++)
            //    {
            //        HttpPostedFile uploadFile = uploadFiles[i];
            //        if (uploadFile.ContentLength > 0)
            //        {
            //            uploadFile.SaveAs(Server.MapPath("~/SystemDocuments/StaffLeaveResources/") + uploadFile.FileName);
            //            lblListOfUploadedFiles.Text += String.Format("{0}<br />", uploadFile.FileName);

            //            staffLeave.LeaveDocument = uploadFile.FileName;

            //        }
            //    }
            //}
            //else
            //{
            //    staffLeave.LeaveDocument = "";
            //}

            staffLeave.LeaveStatusId = 4;
            staffLeave.ApprovedDate = DateTime.Now.Date;
            staffLeave.ApprovedBy = empId;

            if (validation)
            {
                response = staffLeaveController.updateStaffLeavesSubmit(staffLeave);

            }

            if (response != 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Success!', 'Leave Apply Succesfully!', 'success');window.setTimeout(function(){window.location='LeaveForm.aspx'},2500);", true);
                //Response.Redirect(Request.RawUrl);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Failed!', 'Something Went Wrong!', 'error');window.setTimeout(function(){window.location='LeaveForm.aspx'},2500);", true);

            }


        }

        //protected void btnLeaveBalance_Click(object sender, EventArgs e)
        //{


        //    Response.Redirect("LeaveBalance.aspx?EmpId=" + Convert.ToInt32(Session["EmpNumber"]));

        //}

        protected void txtNoOfDates_TextChanged(object sender, EventArgs e)
        {
            if (txtDateCommencing.Text != null)
            {
                if (ddlLeaveType.SelectedValue != "4")
                {
                    float dayCount = float.Parse(txtNoOfDates.Text);
                    txtDateResuming.Text = holidayChecker(DateTime.Parse(txtDateCommencing.Text), dayCount).ToString("yyyy-MM-dd");
                }
                else
                {
                    txtDateResuming.Text = txtDateCommencing.Text;
                }

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('Warning!', 'Select consuming date first!', 'warning');window.setTimeout(function(){window.location='ApplyLeaves.aspx'},2500);", true);

            }


            // dayCount = dayCount + CheckDate(DateTime.Parse(txtDateCommencing.Text), DateTime.Parse(txtDateCommencing.Text).AddDays(dayCount));

            //int resumingday = CheckResumingDate(DateTime.Parse(txtDateCommencing.Text).AddDays(dayCount));

            //   txtDateResuming.Text = CheckResumingDate(DateTime.Parse(txtDateCommencing.Text).AddDays(dayCount)).ToString("yyyy-MM-dd");


        }

        protected int CheckDate(DateTime Startday, DateTime Endday)
        {
            holidaySheetsList = ControllerFactory.CreateHolidaySheetController().getAllHolidays();

            int dayCount = 0;

            for (DateTime i = Startday; i < Endday; i = i.AddDays(1))
            {
                if (i.DayOfWeek == DayOfWeek.Saturday || i.DayOfWeek == DayOfWeek.Sunday)
                {
                    dayCount++;
                }
                else
                {
                    // holidaySheetsList = holidaySheetsList.Where(x => x.HolidayDate.Month == Startday.Month && x.HolidayDate.Year == Startday.Year).ToList();

                    if (holidaySheetsList.Where(x => x.HolidayDate == i).Count() > 0)
                    {
                        dayCount++;
                    }
                    //foreach (var holiday in holidaySheetsList)
                    //{
                    //    if (i == holiday.HolidayDate)
                    //    {
                    //        dayCount++;
                    //    }
                    //}
                }
            }
            return dayCount;


        }
        protected DateTime CheckResumingDate(DateTime day)
        {
            holidaySheetsList = ControllerFactory.CreateHolidaySheetController().getAllHolidays();

            if (day.DayOfWeek == DayOfWeek.Saturday)
            {
                day = day.AddDays(2);
            }
            if (day.DayOfWeek == DayOfWeek.Sunday)
            {
                day = day.AddDays(1);

            }

            if (holidaySheetsList.Where(x => x.HolidayDate == day).Count() > 0)
            {
                day = day.AddDays(1);
            }

            return day;

        }

        private DateTime holidayChecker(DateTime day, float daycount)
        {
            holidaySheetsList = ControllerFactory.CreateHolidaySheetController().getAllHolidays();

            for (int i = 1; i <= daycount; i++)
            {
                if (day.DayOfWeek == DayOfWeek.Saturday || day.DayOfWeek == DayOfWeek.Sunday || holidaySheetsList.Where(x => x.HolidayDate == day).Count() > 0)
                {
                    day = day.AddDays(1);
                    daycount = daycount + 1;
                }
                else
                {
                    if (day.DayOfWeek == DayOfWeek.Friday)
                    {
                        day = day.AddDays(3);
                    }
                    else
                    {
                        day = day.AddDays(1);
                    }

                }

            }
            return day;
        }

    }
}