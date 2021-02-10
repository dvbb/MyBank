using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using DataTransfer;
using IProvider;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace MyBankApiServer.Controllers
{
    [ApiController]
    [Route("api/amount")]

    public class AmountChangeController : Controller
    {
        private IAmountChangeProvider _amountChange;
        public AmountChangeController(IAmountChangeProvider amountChange)
        {
            _amountChange = amountChange;
        }
        [HttpGet("{id}")]
        public List<AmountChange> GetAmountChanges(string id)
        {
            return _amountChange.GetAmountChange(id);
        }

        [HttpGet("pid/{pid}")]
        public AmountChange GetAmountChangeByPid(string pid)
        {
            return _amountChange.GetAmountChangeByPid(pid);
        }

        [HttpPost]
        public int InsertAmountChange([FromBody] AmountChange ac)
        {
            return _amountChange.InsertAmountChange(ac.dId, ac.dName, ac.addr, ac.dType, ac.rate, ac.deposit);
        }

        [HttpPut("{id}")]
        public int UpdateAmountChange(string id)
        {
            return _amountChange.UpdateAmountChange(id);
        }
    }
}