using DataTransfer;
using IProvider;
using Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Provider
{
    public class DepositorProvider : IDepositorProvider
    {
        public List<Depositor> GetDepositor()
        {
            List<Depositor> list = new List<Depositor>();
            SqlParameter[] paras = { };
            SqlDataReader dr = SqlHelper.SearchSQL("proc_depositor_none_select", paras);
            while (dr.Read())
            {
                Depositor depositor = new Depositor();
                depositor.dId = dr["dId"].ToString();
                depositor.pwd = dr["pwd"].ToString();
                depositor.dName = dr["dName"].ToString();
                depositor.deposit = (decimal)dr["deposit"];
                list.Add(depositor);
            }
            return list;
        }

        public Depositor GetDepositor(string id)
        {
            Depositor depositor = new Depositor();
            SqlParameter[] paras =
            {
                new SqlParameter("@did",id)
            };
            SqlDataReader dr = SqlHelper.SearchSQL("proc_depositor_dId_select", paras);
            while (dr.Read())
            {
                depositor.dId = dr["dId"].ToString();
                depositor.pwd = dr["pwd"].ToString();
                depositor.dName = dr["dName"].ToString();
                depositor.deposit = (decimal)dr["deposit"];
            }
            return depositor;
        }

        public int InsertDepositor(string did, string pwd, string dname)
        {
            SqlParameter[] paras =
            {
                new SqlParameter("@did",did),
                new SqlParameter("@pwd",pwd),
                new SqlParameter("@dname",dname)
            };
            int result = SqlHelper.UpdateSQL("proc_depositor_all_insert", paras);
            return result;
        }

        public int UpdatePwd(string did, string pwd)
        {
            SqlParameter[] paras =
            {
                new SqlParameter("@dId ",did),
                new SqlParameter("@pwd",pwd)
            };
            int result = SqlHelper.UpdateSQL("proc_depositor_pwd_update", paras);
            return result;
        }
    }
}
