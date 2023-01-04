using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Library.Logic.Services
{
    static class CategoryService
    {
        public static bool categoryInsert(int id, string name)
        {
            return DBHelper.exceutedata("categoryInsert",()=> CategoryParameterInsert(id,name,DBHelper.command));
            
        }
        // this methoud to add insert parameter into store procedure
        private static void CategoryParameterInsert(int id, string name,SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;

        }
        // methoud delete
        public static bool categoryDelete(int id)
        {
            return DBHelper.exceutedata("categoryDelete", () => CategoryParameterDelete(id, DBHelper.command));
            
        }
        // this methoud to  delete parameter into store procedure
        private static void CategoryParameterDelete(int id, SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            
        }
        // دالة التحديث
        public static bool categoryUpdate(int id, string name)
        {
            return DBHelper.exceutedata("categoryUpdate", () => CategoryParameterUpdate(id, name, DBHelper.command));
            
        }
        // this methoud to add update parameter into store procedure
        private static void CategoryParameterUpdate(int id, string name, SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;

        }
        // دالة حدف الكل
        public static bool categoryDeleteAll()
        {
            return DBHelper.exceutedata("categoryDeleteAll", () => CategoryParameterDeleteAll());

        }
        // this methoud to  delete all parameter into store procedure
        private static void CategoryParameterDeleteAll()
        {

        }
        // دالة select
         static public DataTable getAllData()
        {
            return DBHelper.getData("categoryGetAll", () => { });
        }
        // method get all data to get last row in table
        static public DataTable getLastRow()
        {
            return DBHelper.getData("categoryGetLastRow", () => { });
        }
        static public DataTable getMaxID()
        {
            return DBHelper.getData("categoryMaxID", () => { });
        }

    }
}
