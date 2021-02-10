using DataTransfer;
using IProvider;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BankApiServer.Controllers
{
    [ApiController]
    [Route("api/depositor")]

    public class DepositorController : Controller
    {
        private IDepositorProvider _depositor;

        public DepositorController(IDepositorProvider depositor)
        {
            _depositor = depositor;
        }
        [HttpGet]
        public List<Depositor> GetDepositorAll()
        {
            return _depositor.GetDepositor();
        }



        [HttpGet("{id}")]
        public Depositor GetDepositor(string id)
        {
            return _depositor.GetDepositor(id);
        }

        [HttpPost("{id}/{pwd}/{name}")]
        public int InsertDepositor(string id, string pwd, string name)
        {
            return _depositor.InsertDepositor(id, pwd, name);
        }

        [HttpPut("{id}/{pwd}")]
        public int UpdatePwd(string id, string pwd)
        {
            return _depositor.UpdatePwd(id, pwd);
        }

    }
}