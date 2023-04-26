﻿using ManPowerCore.Common;
using ManPowerCore.Domain;
using ManPowerCore.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManPowerCore.Controller
{
    public interface StaffLeaveAllocationController
    {
        int saveStaffLeaveAllocation(StaffLeaveAllocation staffLeaveAllocation);

        List<StaffLeaveAllocation> getLeaveAllocation(int year, int type, int emp);

    }

    public class StaffLeaveAllocationControllerImpl : StaffLeaveAllocationController
    {
        DBConnection dBConnection;
        StaffLeaveAllocationDAO staffLeaveAllocationDAO = DAOFactory.CreateStaffLeaveAllocationDAO();
        public int saveStaffLeaveAllocation(StaffLeaveAllocation staffLeaveAllocation)
        {
            try
            {
                dBConnection = new DBConnection();
                return staffLeaveAllocationDAO.saveStaffLeaveAllocation(staffLeaveAllocation, dBConnection);


            }
            catch (Exception)
            {
                dBConnection.RollBack();
                throw;
            }
            finally
            {
                if (dBConnection.con.State == System.Data.ConnectionState.Open)
                    dBConnection.Commit();
            }
        }

        public List<StaffLeaveAllocation> getLeaveAllocation(int year, int type, int emp)
        {
            try
            {
                dBConnection = new DBConnection();
                return staffLeaveAllocationDAO.getLeaveAllocation(year, type, emp, dBConnection);


            }
            catch (Exception)
            {
                dBConnection.RollBack();
                throw;
            }
            finally
            {
                if (dBConnection.con.State == System.Data.ConnectionState.Open)
                    dBConnection.Commit();
            }
        }
    }
}
