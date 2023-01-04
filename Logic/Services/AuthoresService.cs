using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Library.Logic.Services
{
    static class AuthoresService
    {
        // this method to insert into aithors table
        public static bool authoresInsert(int id, string name, string date, int countryID)
        {
            return DBHelper.exceutedata("AuthoresInsert", ()=> authoresParameterInsert(id,name,date, countryID,DBHelper.command));
            
        }
        // this methoud to add insert parameter into store procedure
        private static void authoresParameterInsert(int id, string name,string date, int countryID,SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;
            command.Parameters.Add("@date", SqlDbType.NVarChar).Value = date;
            command.Parameters.Add("@countryID", SqlDbType.Int).Value = countryID;
        }
        // methoud delete
        public static bool authoresDelete(int ID)
        {
            return DBHelper.exceutedata("authorDelete", () => AuthoresParameterDelete(ID, DBHelper.command));
            
        }
        // this methoud to  delete parameter into store procedure
        private static void AuthoresParameterDelete(int ID, SqlCommand command)
        {
            command.Parameters.Add("@ID", SqlDbType.Int).Value = ID;
            
        }
        // دالة التحديث
        public static bool authoresUpdate(int id, string name, string date, int countryID)
        {
            return DBHelper.exceutedata("AuthoresUpdate", () => AuthoresParameterUpdate(id, name, date, countryID, DBHelper.command));
            
        }
        // this methoud to add update parameter into store procedure
        private static void AuthoresParameterUpdate(int id, string name, string date, int countryID, SqlCommand command)
        {
            command.Parameters.Add("@id", SqlDbType.Int).Value = id;
            command.Parameters.Add("@name", SqlDbType.NVarChar).Value = name;
            command.Parameters.Add("@date", SqlDbType.NVarChar).Value = date;
            command.Parameters.Add("@countryID", SqlDbType.Int).Value = countryID;

        }
        // دالة حدف الكل
        public static bool authoresDeleteAll()
        {
            return DBHelper.exceutedata("authorDeleteAll", () => AuthoresParameterDeleteAll());

        }
        // this methoud to  delete all parameter into store procedure
        private static void AuthoresParameterDeleteAll()
        {

        }
        // دالة select
         static public DataTable getAllData()
        {
            return DBHelper.getData("authorGetAll", () => { });
        }
        // method get all data to get last row in table
        static public DataTable getLastRow()
        {
            return DBHelper.getData("authorGetLastRow", () => { });
        }
        static public DataTable getMaxID()
        {
            return DBHelper.getData("authorMaxID", () => { });
        }

    }
}
