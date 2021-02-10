using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DataTransfer;
using IProvider;
using Microsoft.AspNetCore.Mvc;

namespace MyBankApiServer.Controllers
{
    [ApiController]
    [Route("api/employee")]

    public class EmployeeController : Controller
    {
        //实现依赖注入
        private IEmployeeProvider _employee;

        public EmployeeController(IEmployeeProvider employee)
        {
            _employee = employee;
        }

        [HttpGet]
        public List<Employee> GetAllEmployee()
        {
            return _employee.GetEmployee();
        }

        [HttpGet("{id}")]
        public Employee GetEmployee(string id)
        {
            Employee employee = _employee.GetEmployee(id);
            return employee;
        }

        [HttpPut("{id}/{pwd}")]
        public int UpdatePwd(string id, string pwd)
        {
            return _employee.UpdatePwd(id, pwd);
        }

    }
}