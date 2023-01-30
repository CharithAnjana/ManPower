﻿using ManPowerCore.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ManPowerCore.Domain
{
    [Serializable]
    public class Employee
    {
        [DBField("ID")]
        public int EmployeeId { get; set; }

        [DBField("RELIGION_ID")]
        public int ReligionId { get; set; }

        [DBField("ETHNICITY_ID")]
        public int EthnicityId { get; set; }

        [DBField("NIC")]
        public string EmployeeNIC { get; set; }

        [DBField("NIC_ISSUE_DATE")]
        public DateTime NicIssueDate { get; set; }

        [DBField("PASSPORT_NUMBER")]
        public string EmployeePassportNumber { get; set; }

        [DBField("INITIAL")]
        public string EmpInitials { get; set; }

        [DBField("LAST_NAME")]
        public string LastName { get; set; }

        [DBField("NAME_DENOTE_BY_INITIAL")]
        public string NameWithInitials { get; set; }

        [DBField("GENDER")]
        public string EmpGender { get; set; }

        [DBField("DATE_OF_BIRTH")]
        public DateTime DOB { get; set; }

        [DBField("MARITAL_STATUS")]
        public string MaritalStatus { get; set; }

        [DBField("PENSION_DATE")]
        public DateTime PensionDate { get; set; }

        [DBField("VNOP_NO")]
        public int VNOPNo { get; set; }

        [DBField("APPOINTMENT_NO")]
        public int AppointmentNo { get; set; }

        [DBField("FILE_NO")]
        public int FileNo { get; set; }

        [DBField("EMP_NO")]
        public int EmpNo { get; set; }

        [DBField("ABSORB")]
        public string EpmAbsorb { get; set; }

        [DBField("SUPERVISOR_ID")]
        public int SupervisorId { get; set; }

        [DBField("MANAGER_ID")]
        public int ManagerId { get; set; }

        [DBField("DSDIVISION_ID")]
        public int DSDivisionId { get; set; }

        [DBField("DISTRICT_ID")]
        public int DistrictId { get; set; }

        [DBField("UNIT_TYPE")]
        public int UnitType { get; set; }

        public string fullName { get; set; }



        //[DBField("LEAVE_NUMBER")]
        //public int leaveNumber { get; set; }

        //[DBField("PERMANENT_ADDRESS")]
        //public string Adress { get; set; }

        //[DBField("TELEPHONE")]
        //public int TelephoneNumber { get; set; }

        //[DBField("FAX")]
        //public int EmpFax { get; set; }

        //[DBField("MOBILE")]
        //public int empMobile { get; set; }

        //[DBField("PERSONAL_EMAIL")]
        //public string Email { get; set; }

        //[DBField("PERSONAL_FILE_NUMBER")]
        //public int FileNumber { get; set; }

        //[DBField("APPOINTMENT_LETTER_NUMBER")]
        //public int AppointmentLetterNumber { get; set; }

        //[DBField("SERVICE_TYPE")]
        //public int ServiceType { get; set; }

        //[DBField("EMPLOYEE_NUMBER")]
        //public int EmpNumber { get; set; }



        //[DBField("RETAIREMENT_DATE")]
        //public DateTime RetirementDate { get; set; }

        //[DBField("PLACE_OF_BIRTH")]
        //public string PlaceOfBirth { get; set; }





        public EmergencyContact _EmergencyContact { get; set; } = new EmergencyContact();
        public EmployeeContact _EmployeeContact { get; set; } = new EmployeeContact();
        public List<Dependant> _Dependant { get; set; } = new List<Dependant>();
        public List<EmploymentDetails> _EmploymentDetails { get; set; } = new List<EmploymentDetails>();

        public EmploymentDetails _EmploymentDetailsSingle { get; set; } = new EmploymentDetails();
        public List<EducationDetails> _EducationDetails { get; set; } = new List<EducationDetails>();
        public List<EmployeeServices> _EmployeeServices { get; set; } = new List<EmployeeServices>();
    }
}
