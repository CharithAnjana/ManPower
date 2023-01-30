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
    public interface RetirementController
    {
        int Save(Retirement retirement);
        int Delete(int id);
        int Update(Retirement retirement);
        List<Retirement> GetAllRetirement(bool with0);
        Retirement GetRetirement(int Id);
    }

    public class RetirementControllerSqlImpl : RetirementController
    {
        RetirementDAO retirementDAO = DAOFactory.CreateRetirementDAO();
        DBConnection dBConnection;

        public int Save(Retirement retirement)
        {
            try
            {
                dBConnection = new DBConnection();
                return retirementDAO.Save(retirement, dBConnection);
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

        public int Update(Retirement retirement)
        {
            try
            {
                dBConnection = new DBConnection();
                return retirementDAO.Update(retirement, dBConnection);
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

        public int Delete(int id)
        {
            try
            {
                dBConnection = new DBConnection();
                return retirementDAO.Delete(id, dBConnection);
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

        public List<Retirement> GetAllRetirement(bool with0)
        {
            try
            {
                dBConnection = new DBConnection();
                return retirementDAO.GetAllRetirement(with0, dBConnection);
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

        public Retirement GetRetirement(int Id)
        {
            try
            {
                dBConnection = new DBConnection();
                return retirementDAO.GetRetirement(Id, dBConnection);
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
