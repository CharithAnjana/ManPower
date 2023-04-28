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
    public interface EmployeeDAO
    {
        List<Employee> GetAllEmployee(DBConnection dbConnection);

        Employee GetEmployeeById(int id, DBConnection dbConnection);

        int SaveEmployee(Employee emp, DBConnection dbConnection);

        int UpdateEmployee(Employee emp, DBConnection dbConnection);

        int AcInAcEmployee(int EmpId, int isActive, DBConnection dbConnection);

        int ChanngeDepartment(Employee emp, DBConnection dbConnection);
    }

    public class EmployeeDAOImpl : EmployeeDAO
    {
        public int SaveEmployee(Employee emp, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandType = System.Data.CommandType.Text;
            dbConnection.cmd.Parameters.Clear();
            dbConnection.cmd.CommandText = "INSERT INTO EMPLOYEE (Religion_Id, Ethnicity_Id, NIC, Passport_Number, Title" +
                                            ",Initial,Last_Name,Name_Denote_By_Initial,Gender,Date_Of_Birth" +
                                            ",Marital_Status,Supervisor_Id,Manager_Id,DSDivision_Id,District_Id,Unit_Type, " +
                                            " Pension_Date,VNOP_No,Appointment_No,File_No, Designation_Id, Salary_Num) " +

                                            "VALUES(@ReligionId, @EthnicityId, @EmployeeNIC, @EmployeePassportNumber, @Title " +
                                            ",@EmpInitials, @LastName, @NameWithInitials, @EmpGender, @DOB " +
                                            ",@MaritalStatus, @SupervisorId, @ManagerId, @DSDivisionId, @DistrictId, @UnitType " +
                                            ",@PensionDate, @VNOPNo, @AppointmentNo, @FileNo, @DesignationId, @SalaryNo) " +
                                            "SELECT SCOPE_IDENTITY() ";



            dbConnection.cmd.Parameters.AddWithValue("@ReligionId", emp.ReligionId);
            dbConnection.cmd.Parameters.AddWithValue("@EthnicityId", emp.EthnicityId);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeeNIC", emp.EmployeeNIC);
            //dbConnection.cmd.Parameters.AddWithValue("@NicIssueDate", emp.NicIssueDate);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeePassportNumber", emp.EmployeePassportNumber);
            dbConnection.cmd.Parameters.AddWithValue("@MaritalStatus", emp.MaritalStatus);
            dbConnection.cmd.Parameters.AddWithValue("@SupervisorId", emp.SupervisorId);
            dbConnection.cmd.Parameters.AddWithValue("@ManagerId", emp.ManagerId);
            dbConnection.cmd.Parameters.AddWithValue("@Title", emp.Title);

            dbConnection.cmd.Parameters.AddWithValue("@EmpInitials", emp.EmpInitials);
            dbConnection.cmd.Parameters.AddWithValue("@LastName", emp.LastName);
            dbConnection.cmd.Parameters.AddWithValue("@NameWithInitials", emp.NameWithInitials);
            dbConnection.cmd.Parameters.AddWithValue("@EmpGender", emp.EmpGender);
            dbConnection.cmd.Parameters.AddWithValue("@DOB", emp.DOB);
            dbConnection.cmd.Parameters.AddWithValue("@DSDivisionId", emp.DSDivisionId);
            dbConnection.cmd.Parameters.AddWithValue("@DistrictId", emp.DistrictId);
            dbConnection.cmd.Parameters.AddWithValue("@UnitType", emp.UnitType);
            dbConnection.cmd.Parameters.AddWithValue("@PensionDate", emp.PensionDate);
            dbConnection.cmd.Parameters.AddWithValue("@VNOPNo", emp.VNOPNo);
            dbConnection.cmd.Parameters.AddWithValue("@AppointmentNo", emp.AppointmentNo);
            dbConnection.cmd.Parameters.AddWithValue("@FileNo", emp.FileNo);
            dbConnection.cmd.Parameters.AddWithValue("@DesignationId", emp.DesignationId);
            dbConnection.cmd.Parameters.AddWithValue("@SalaryNo", emp.SalaryNo);
            //dbConnection.cmd.Parameters.AddWithValue("@EDCompletionDate", emp.EDCompletionDate);
            //dbConnection.cmd.Parameters.AddWithValue("@EpmAbsorb", emp.EpmAbsorb);
            //dbConnection.cmd.Parameters.AddWithValue("@EmpNo", emp.EmpNo);

            int result = Convert.ToInt32(dbConnection.cmd.ExecuteScalar());
            return result;
        }

        public int UpdateEmployee(Employee emp, DBConnection dbConnection)
        {
            int output = 0;
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandType = System.Data.CommandType.Text;
            dbConnection.cmd.Parameters.Clear();
            dbConnection.cmd.CommandText = "UPDATE EMPLOYEE SET Title = @Title, Gender = @EmpGender, Pension_Date = @PensionDate, VNOP_No = @VNOPNo, " +
                                           "NIC = @EmployeeNIC, Initial = @EmpInitials, Date_Of_Birth = @DOB, PASSPORT_NUMBER = @EmployeePassportNumber, Appointment_No = @AppointmentNo, " +
                                           "Last_Name = @LastName, Name_Denote_By_Initial = @NameWithInitials, Marital_Status = @MaritalStatus, NIC_ISSUE_DATE = @NicIssueDate, " +
                                           "Designation_Id = @DesignationId, File_No = @FileNo , Salary_Num = @SalaryNo WHERE ID = @EmployeeId";


            dbConnection.cmd.Parameters.AddWithValue("@Title", emp.Title);
            dbConnection.cmd.Parameters.AddWithValue("@EmpGender", emp.EmpGender);
            dbConnection.cmd.Parameters.AddWithValue("@MaritalStatus", emp.MaritalStatus);
            dbConnection.cmd.Parameters.AddWithValue("@EmpInitials", emp.EmpInitials);
            dbConnection.cmd.Parameters.AddWithValue("@LastName", emp.LastName);
            dbConnection.cmd.Parameters.AddWithValue("@NameWithInitials", emp.NameWithInitials);
            dbConnection.cmd.Parameters.AddWithValue("@DOB", emp.DOB);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeeNIC", emp.EmployeeNIC);
            dbConnection.cmd.Parameters.AddWithValue("@DesignationId", emp.DesignationId);
            dbConnection.cmd.Parameters.AddWithValue("@PensionDate", emp.PensionDate);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeePassportNumber", emp.EmployeePassportNumber);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeeId", emp.EmployeeId);
            dbConnection.cmd.Parameters.AddWithValue("@VNOPNo", emp.VNOPNo);
            dbConnection.cmd.Parameters.AddWithValue("@AppointmentNo", emp.AppointmentNo);
            dbConnection.cmd.Parameters.AddWithValue("@FileNo", emp.FileNo);
            dbConnection.cmd.Parameters.AddWithValue("@SalaryNo", emp.SalaryNo);
            if (emp.NicIssueDate.ToShortDateString() == "01/01/0001")
            {
                dbConnection.cmd.Parameters.AddWithValue("@NicIssueDate", SqlDateTime.Null);
            }
            else
            {
                dbConnection.cmd.Parameters.AddWithValue("@NicIssueDate", emp.NicIssueDate);
            }

            output = dbConnection.cmd.ExecuteNonQuery();
            return output;
        }

        //public int UpdateProgramType(ProgramType programType, DBConnection dbConnection)
        //{
        //    if (dbConnection.dr != null)
        //        dbConnection.dr.Close();

        //    dbConnection.cmd.CommandText = "UPDATE PROGRAM_TYPE SET NAME = @ProgramTypeName, IS_ACTIVE = @IsActive WHERE ID = @ProgramTypeId ";


        //    dbConnection.cmd.Parameters.AddWithValue("@ProgramTypeId", programType.ProgramTypeId);
        //    dbConnection.cmd.Parameters.AddWithValue("@ProgramTypeName", programType.ProgramTypeName);
        //    dbConnection.cmd.Parameters.AddWithValue("@IsActive", programType.IsActive);


        //    return dbConnection.cmd.ExecuteNonQuery();
        //}

        public List<Employee> GetAllEmployee(DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM Employee ";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.ReadCollection<Employee>(dbConnection.dr);

        }

        public Employee GetEmployeeById(int id, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM Employee WHERE ID=" + id + " ";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.GetSingleOject<Employee>(dbConnection.dr);
        }

        public int AcInAcEmployee(int EmpId, int isActive, DBConnection dbConnection)
        {

            if (dbConnection.dr != null)
                dbConnection.dr.Close(); dbConnection.cmd.CommandType = System.Data.CommandType.Text;
            dbConnection.cmd.Parameters.Clear();
            dbConnection.cmd.CommandText = "UPDATE EMPLOYEE SET Is_Active = @Is_Active  WHERE ID = @EmployeeId";

            dbConnection.cmd.Parameters.AddWithValue("@Is_Active", isActive);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeeId", EmpId);

            dbConnection.cmd.ExecuteNonQuery();
            return 1;
        }

        public int ChanngeDepartment(Employee emp, DBConnection dbConnection)
        {

            if (dbConnection.dr != null)
                dbConnection.dr.Close(); dbConnection.cmd.CommandType = System.Data.CommandType.Text;
            dbConnection.cmd.Parameters.Clear();
            dbConnection.cmd.CommandText = "UPDATE EMPLOYEE SET DSDivision_Id = @DSDivisionId, District_Id = @DistrictId, " +
                "Unit_Type = @UnitType  WHERE ID = @EmployeeId";

            dbConnection.cmd.Parameters.AddWithValue("@DSDivisionId", emp.DSDivisionId);
            dbConnection.cmd.Parameters.AddWithValue("@DistrictId", emp.DistrictId);
            dbConnection.cmd.Parameters.AddWithValue("@UnitType", emp.UnitType);
            dbConnection.cmd.Parameters.AddWithValue("@EmployeeId", emp.EmployeeId);

            dbConnection.cmd.ExecuteNonQuery();
            return 1;
        }
    }
}
