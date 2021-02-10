using DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IProvider
{
    public interface IAmountChangeProvider
    {
        List<AmountChange> GetAmountChange(string did);
        int InsertAmountChange(string did, string dname, string addr, string dtype, double rate, decimal deposit);
        int UpdateAmountChange(string pid);
        AmountChange GetAmountChangeByPid(string pid);
    }
}
