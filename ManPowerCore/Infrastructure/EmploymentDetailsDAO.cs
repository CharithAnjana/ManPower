﻿using ManPowerCore.Common;
using ManPowerCore.Domain;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManPowerCore.Infrastructure
{
	public interface EmploymentDetailsDAO
	{
		List<EmploymentDetails> GetAllEmploymentDetails(DBConnection dbConnection);

		EmploymentDetails GetEmploymentDetailsById(int id, DBConnection dbConnection);

		int SaveEmploymentDetails(EmploymentDetails empDetails, DBConnection dbConnection);

		int UpdateEmploymentDetails(EmploymentDetails empDetails, DBConnection dbConnection);

		List<EmploymentDetails> GetEmploymentDetailsByEmpId(int id, DBConnection dbConnection);
	}

	public class EmploymentDetailsDAOImpl : EmploymentDetailsDAO
	{
		public int SaveEmploymentDetails(EmploymentDetails empDetails, DBConnection dbConnection)
		{
			if (dbConnection.dr != null)
				dbConnection.dr.Close();

			dbConnection.cmd.CommandType = System.Data.CommandType.Text;
			dbConnection.cmd.Parameters.Clear();
			dbConnection.cmd.CommandText = "INSERT INTO EMPLOYMENT_DETAIL(DESIGNATION_ID,CONTRACT_TYPE_ID,EMPLOYEE_ID,COMPANY_NAME,START_DATE, " +
				"END_DATE,IS_RESIGNED,RETIREMENT_DATE)" +
				" VALUES(@EmpName,@DesignationId,@ContractTypeId,@EmpID,@CompanyName,@StartDate,@EndDate,@IsResigned,@RetirementDate)";

			dbConnection.cmd.Parameters.AddWithValue("@EmpName", empDetails.EmpName);
			dbConnection.cmd.Parameters.AddWithValue("@DesignationId", empDetails.DesignationId);
			dbConnection.cmd.Parameters.AddWithValue("@ContractTypeId", empDetails.ContractTypeId);
			dbConnection.cmd.Parameters.AddWithValue("@EmpID", empDetails.EmpID);
			dbConnection.cmd.Parameters.AddWithValue("@CompanyName", empDetails.CompanyName);
			dbConnection.cmd.Parameters.AddWithValue("@StartDate", empDetails.StartDate);
			dbConnection.cmd.Parameters.AddWithValue("@EndDate", empDetails.EndDate);
			dbConnection.cmd.Parameters.AddWithValue("@IsResigned", empDetails.IsResigned);
			if (empDetails.RetirementDate.ToShortDateString() == "01/01/0001")
			{
				dbConnection.cmd.Parameters.AddWithValue("@RetirementDate", SqlDateTime.Null);
			}
			else
			{
				dbConnection.cmd.Parameters.AddWithValue("@RetirementDate", empDetails.RetirementDate);
			}


			dbConnection.cmd.ExecuteNonQuery();
			return 1;
		}


		public int UpdateEmploymentDetails(EmploymentDetails empDetails, DBConnection dbConnection)
		{
			if (dbConnection.dr != null)
				dbConnection.dr.Close();

			dbConnection.cmd.Parameters.Clear();
			dbConnection.cmd.CommandText = "UPDATE Employment_Detail SET EMPLOYEE_NAME = @EmpName, DESIGNATION_ID = @DesignationId, EMPLOYEE_ID = @EmpID, " +
				"COMPANY_NAME = @CompanyName, START_DATE = @StartDate,END_DATE = @EndDate,IS_RESIGNED = @IsResigned," +
				"RETIREMENT_DATE = @RetirementDate WHERE ID = @EmploymentDetailId ";

			dbConnection.cmd.Parameters.AddWithValue("@EmploymentDetailId", empDetails.EmploymentDetailId);
			dbConnection.cmd.Parameters.AddWithValue("@EmpName", empDetails.EmpName);
			dbConnection.cmd.Parameters.AddWithValue("@DesignationId", empDetails.DesignationId);
			dbConnection.cmd.Parameters.AddWithValue("@EmpID", empDetails.EmpID);
			dbConnection.cmd.Parameters.AddWithValue("@CompanyName", empDetails.CompanyName);
			dbConnection.cmd.Parameters.AddWithValue("@StartDate", empDetails.StartDate);
			dbConnection.cmd.Parameters.AddWithValue("@EndDate", empDetails.EndDate);
			dbConnection.cmd.Parameters.AddWithValue("@IsResigned", empDetails.IsResigned);
			dbConnection.cmd.Parameters.AddWithValue("@RetirementDate", empDetails.RetirementDate);

			dbConnection.cmd.ExecuteNonQuery();
			return 1;
		}


		public List<EmploymentDetails> GetAllEmploymentDetails(DBConnection dbConnection)
		{
			if (dbConnection.dr != null)
				dbConnection.dr.Close();

			dbConnection.cmd.CommandText = "SELECT * FROM Employment_Detail";

			dbConnection.dr = dbConnection.cmd.ExecuteReader();
			DataAccessObject dataAccessObject = new DataAccessObject();
			return dataAccessObject.ReadCollection<EmploymentDetails>(dbConnection.dr);

		}

		public List<EmploymentDetails> GetEmploymentDetailsByEmpId(int id, DBConnection dbConnection)
		{
			if (dbConnection.dr != null)
				dbConnection.dr.Close();

			dbConnection.cmd.CommandText = "SELECT * FROM Employment_Detail WHERE Employee_id = " + id + " ";

			dbConnection.dr = dbConnection.cmd.ExecuteReader();
			DataAccessObject dataAccessObject = new DataAccessObject();
			return dataAccessObject.ReadCollection<EmploymentDetails>(dbConnection.dr);

		}

		public EmploymentDetails GetEmploymentDetailsById(int id, DBConnection dbConnection)
		{
			if (dbConnection.dr != null)
				dbConnection.dr.Close();

			dbConnection.cmd.CommandText = "SELECT * FROM Employment_Detail WHERE ID = " + id + " ";

			dbConnection.dr = dbConnection.cmd.ExecuteReader();
			DataAccessObject dataAccessObject = new DataAccessObject();
			return dataAccessObject.GetSingleOject<EmploymentDetails>(dbConnection.dr);

		}


	}
}

