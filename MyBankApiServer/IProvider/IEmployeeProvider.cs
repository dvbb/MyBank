using DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IProvider
{
    public interface IEmployeeProvider
    {
        List<Employee> GetEmployee();
        Employee GetEmployee(string id);
        int UpdatePwd(string eid, string pwd);
    }
}
