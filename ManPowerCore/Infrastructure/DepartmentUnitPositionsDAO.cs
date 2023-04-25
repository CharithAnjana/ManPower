﻿using ManPowerCore.Common;
using ManPowerCore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManPowerCore.Infrastructure
{
    public interface DepartmentUnitPositionsDAO
    {
        int SaveDepartmentUnitPositions(DepartmentUnitPositions departmentUnitPositions, DBConnection dbConnection);
        int UpdateDepartmentUnitPositions(DepartmentUnitPositions departmentUnitPositions, DBConnection dbConnection);

        int Delete(int positionId, DBConnection dbConnection);

        int UpdateSytemUserIdByDepartment_Unit_Position_Id(int SystemUserId, int Department_Unit_Position_Id, DBConnection dbConnection);

        DepartmentUnitPositions departmentUnitPositionsWIthSystemUser(int programTargetid, DBConnection dbConnection);
        List<DepartmentUnitPositions> GetAllDepartmentUnitPositions(DBConnection dbConnection);
        DepartmentUnitPositions GetDepartmentUnitPositions(int id, DBConnection dbConnection);
        List<DepartmentUnitPositions> GetAllDepartmentUnitPositionsByDepartmentUnitId(int departmentUnitId, DBConnection dbConnection);
        DepartmentUnitPositions GetAllDepartmentUnitPositionsBySystemUserId(int systemUserId, DBConnection dbConnection);
        List<DepartmentUnitPositions> GetAllDepartmentUnitPositionByPossitionId(int possitionId, DBConnection dbConnection);

        List<DepartmentUnitPositions> GetAllUsersBySystemUserId(int runSystemUserId, DBConnection dbConnection);

        List<DepartmentUnitPositions> GetDepartmentUnitPositionsBYPId(int ParentID, DBConnection dbConnection);

    }

    public class DepartmentUnitPositionsDAOImpl : DepartmentUnitPositionsDAO
    {
        public int getMaxDepartmentUnitPositionsId(DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT ISNULL(MAX(ID),0) FROM DEPARTMENT_UNIT_POSSITIONS";
            int DepartmentUnitPositionsId = Convert.ToInt32(dbConnection.cmd.ExecuteScalar());
            if (DepartmentUnitPositionsId == 0)
            {
                DepartmentUnitPositionsId = 1;
            }
            else
            {
                DepartmentUnitPositionsId += 1;
            }


            return DepartmentUnitPositionsId;
        }

        public int SaveDepartmentUnitPositions(DepartmentUnitPositions departmentUnitPositions, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            int id = getMaxDepartmentUnitPositionsId(dbConnection);

            dbConnection.cmd.CommandType = System.Data.CommandType.Text;
            dbConnection.cmd.Parameters.Clear();
            dbConnection.cmd.CommandText = "INSERT INTO DEPARTMENT_UNIT_POSSITIONS(SYSTEM_USER_ID, POSSITIONS_ID, DEPARTMENT_UNIT_ID, PARENT_ID) values " +
                "(@SystemUserId,@PossitionsId,@DepartmentUnitId,@ParentId) ";


            dbConnection.cmd.Parameters.AddWithValue("@SystemUserId", departmentUnitPositions.SystemUserId);
            dbConnection.cmd.Parameters.AddWithValue("@PossitionsId", departmentUnitPositions.PossitionsId);
            dbConnection.cmd.Parameters.AddWithValue("@DepartmentUnitId", departmentUnitPositions.DepartmentUnitId);
            dbConnection.cmd.Parameters.AddWithValue("@ParentId", departmentUnitPositions.ParentId);

            return dbConnection.cmd.ExecuteNonQuery();
        }

        public int UpdateDepartmentUnitPositions(DepartmentUnitPositions departmentUnitPositions, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "UPDATE DEPARTMENT_UNIT_POSSITIONS SET SYSTEM_USER_ID = '" + departmentUnitPositions.SystemUserId + "', POSSITIONS_ID = '" + departmentUnitPositions.PossitionsId + "', DEPARTMENT_UNIT_ID = '" + departmentUnitPositions.DepartmentUnitId + "', PARENT_ID = '" + departmentUnitPositions.ParentId + "' WHERE ID = " + departmentUnitPositions.DepartmetUnitPossitionsId;

            return dbConnection.cmd.ExecuteNonQuery();
        }

        public int UpdateSytemUserIdByDepartment_Unit_Position_Id(int SystemUserId, int Department_Unit_Position_Id, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "UPDATE DEPARTMENT_UNIT_POSSITIONS SET SYSTEM_USER_ID = @SystemUserId WHERE Id = @Department_Unit_Position_Id";

            dbConnection.cmd.Parameters.AddWithValue("@SystemUserId", SystemUserId);
            dbConnection.cmd.Parameters.AddWithValue("@Department_Unit_Position_Id", Department_Unit_Position_Id);

            return dbConnection.cmd.ExecuteNonQuery();
        }

        public List<DepartmentUnitPositions> GetAllDepartmentUnitPositions(DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE Is_Active = 1";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.ReadCollection<DepartmentUnitPositions>(dbConnection.dr);

        }

        public List<DepartmentUnitPositions> GetDepartmentUnitPositionsBYPId(int ParentID, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE ParentId =" + ParentID + " AND Is_Active = 1";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.ReadCollection<DepartmentUnitPositions>(dbConnection.dr);

        }

        public DepartmentUnitPositions GetDepartmentUnitPositions(int id, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE ID = " + id;

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.GetSingleOject<DepartmentUnitPositions>(dbConnection.dr);

        }


        public List<DepartmentUnitPositions> GetAllDepartmentUnitPositionsByDepartmentUnitId(int departmentUnitId, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE DEPARTMENT_UNIT_ID = " + departmentUnitId + " AND Is_Active = 1";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.ReadCollection<DepartmentUnitPositions>(dbConnection.dr);
        }


        public DepartmentUnitPositions GetAllDepartmentUnitPositionsBySystemUserId(int systemUserId, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();


            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE SYSTEM_USER_ID = " + systemUserId + " AND Is_Active = 1";



            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.GetSingleOject<DepartmentUnitPositions>(dbConnection.dr);
        }

        public List<DepartmentUnitPositions> GetAllDepartmentUnitPositionByPossitionId(int possitionId, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE POSSITIONS_ID = " + possitionId + " AND Is_Active = 1";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.ReadCollection<DepartmentUnitPositions>(dbConnection.dr);
        }

        public List<DepartmentUnitPositions> GetAllUsersBySystemUserId(int runSystemUserId, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT * FROM DEPARTMENT_UNIT_POSSITIONS WHERE SYSTEM_USER_ID = " + runSystemUserId + " AND Is_Active = 1";

            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.ReadCollection<DepartmentUnitPositions>(dbConnection.dr);
        }
        public DepartmentUnitPositions departmentUnitPositionsWIthSystemUser(int programTargetid, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandText = "SELECT System_User_Id FROM Department_Unit_Possitions WHERE Id =(SELECT Department_Unit_Possitions_Id FROM Program_Assignee WHERE Program_Target_Id =" + programTargetid + ") AND Is_Active = 1";
            dbConnection.dr = dbConnection.cmd.ExecuteReader();
            DataAccessObject dataAccessObject = new DataAccessObject();
            return dataAccessObject.GetSingleOject<DepartmentUnitPositions>(dbConnection.dr);

        }

        public int Delete(int positionId, DBConnection dbConnection)
        {
            if (dbConnection.dr != null)
                dbConnection.dr.Close();

            dbConnection.cmd.CommandType = System.Data.CommandType.Text;
            dbConnection.cmd.Parameters.Clear();
            dbConnection.cmd.CommandText = "UPDATE DEPARTMENT_UNIT_POSSITIONS SET Is_Active = 0 WHERE Id = @PositionId";

            dbConnection.cmd.Parameters.AddWithValue("@PositionId", positionId);

            return dbConnection.cmd.ExecuteNonQuery();
        }
    }
}
