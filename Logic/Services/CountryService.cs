using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Library.Logic.Services
{
    static class CountryService
    {
        public static bool countryInsert(int id, string name)
        {
            return DBHelper.exceutedata("countryInsert", () => CountryParameterInsert(id, name, DBHelper.command));

        }
        // this methoud to add insert parameter into store procedure
        private static void CountryParameterInsert(int id, string name, SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;

        }
        // methoud delete
        public static bool CountryDelete(int id)
        {
            return DBHelper.exceutedata("CountryDelete", () => CountryParameterDelete(id, DBHelper.command));

        }
        // this methoud to  delete parameter into store procedure
        private static void CountryParameterDelete(int id, SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;

        }
        public static bool CountryUpdate(int id, string name)
        {
            return DBHelper.exceutedata("countryUpdate", () => CountryParameterUpdate(id, name, DBHelper.command));

        }
        // this methoud to add update parameter into store procedure
        private static void CountryParameterUpdate(int id, string name, SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;

        }
        // دالة حدف الكل
        public static bool countryDeleteAll()
        {
            return DBHelper.exceutedata("countryDeleteAll", () => CountryParameterDeleteAll());

        }
        // this methoud to  delete all parameter into store procedure
        private static void CountryParameterDeleteAll()
        {

        }
        // method get all data to show in dgv or return as table
        static public DataTable getAllData()
        {            
           return DBHelper.getData("countryGetAll", () => { });
        }
        // method get all data to get last row in table
        static public DataTable getLastRow()
        {
            return DBHelper.getData("countryGetLastRow", () => { });
        }
        // method get all data to get max id in table
        static public DataTable getMaxID()
        {
            return DBHelper.getData("countryMaxID", () => { });
        }
    }
}
