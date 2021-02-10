using DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IProvider
{
    public interface IDepositorProvider
    {
        List<Depositor> GetDepositor();
        Depositor GetDepositor(string id);
        int InsertDepositor(string did, string pwd, string dname);
        int UpdatePwd(string did, string pwd);
    }
}
