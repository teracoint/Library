using Library.Logic.Services;
using Library.Models;
using Library.Views.Interface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Logic.Presenter
{
    class AuthoresPresenter
    {
        // ناخد نسخة من ICategory
        IAuthors iauthores;

        // تاخد instance 
        AuthorsModel authorsModel = new AuthorsModel();
        // الفائدة من كونسركثور اول ما يتم استدعاء الكلاص هادي اول كود يتنفد هو كوسيكثور
        public AuthoresPresenter(IAuthors view)
        {
            this.iauthores = view;
        }
        private void connectBetweenModelInterface()
        {
            authorsModel.ID = iauthores.ID;
            authorsModel.AuthorDate = iauthores.AuthorDate;
            authorsModel.AuthorName = iauthores.AuthorName;
            authorsModel.CountryID = iauthores.CountryID;
        } 
        // دالة ادخال البيانات في القاعدة
        public bool AuthoresInsert()
        {
            connectBetweenModelInterface();
            bool check= AuthoresService.authoresInsert(authorsModel.ID, authorsModel.AuthorDate, authorsModel.AuthorDate, authorsModel.CountryID);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة التحديث
        public bool AuthoresUpdate()
        {
            connectBetweenModelInterface();
            bool check = AuthoresService.authoresUpdate(authorsModel.ID, authorsModel.AuthorDate, authorsModel.AuthorName, authorsModel.CountryID);
            getAllData();
            AutoNumber();
            return check;
            
        }
        // دالة الحدف
        public bool AuthoresDelete()
        {
            connectBetweenModelInterface();
            bool check = AuthoresService.authoresDelete(authorsModel.ID);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة حدف الكل
        public bool AuthoresDeleteAll()
        {
            connectBetweenModelInterface();
            bool check = AuthoresService.authoresDeleteAll();
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة مسح الحقول
        public void ClearFields()
        {

            iauthores.ID= 0;
            iauthores.AuthorDate = "";
            iauthores.AuthorName = "";
            iauthores.CountryID = 0;
        }
        // دالة SELECT
        public void getAllData()
        {
            //connectBetweenModelInterface();
            iauthores.dataGridView = AuthoresService.getAllData();
            ClearFields();
        }
        public void AutoNumber()
        {
            string test = (AuthoresService.getMaxID().Rows[0][0]).ToString();
            if (test == null || test == "")
            {
                iauthores.ID = 1;
            }
            else
            {
                iauthores.ID = Convert.ToInt32(AuthoresService.getMaxID().Rows[0][0]) + 1;
            }
            iauthores.AuthorDate = "";
            iauthores.AuthorName = "";
            iauthores.CountryID = 0;

            iauthores.btnSave = false;
            iauthores.btnDelete = false;
            iauthores.btnDeleteAll = false;
            iauthores.btnNew = true;

        }
        public void getRow(int row)
        {
            // نعرق طابل 
            DataTable tbl = new DataTable();
            // البيانات التي عندا وضعتاها في طابل
            tbl = AuthoresService.getAllData();

            iauthores.ID = Convert.ToInt32(tbl.Rows[row][0]);
            iauthores.AuthorName = Convert.ToString(tbl.Rows[row][1]);
            iauthores.AuthorDate = Convert.ToString(tbl.Rows[row][2]);
            iauthores.CountryID = Convert.ToInt32(tbl.Rows[row][3]);

            iauthores.btnSave = true;
            iauthores.btnDelete = true;
            iauthores.btnDeleteAll = true;
            iauthores.btnNew = false;
        }
        public DataTable getLastRow()
        {
            // نعرق طابل 
            DataTable tbl = new DataTable();
            // البيانات التي عندا وضعتاها في طابل
            tbl = AuthoresService.getLastRow();
            return tbl;
        }
    }
}
