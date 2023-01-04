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
    class CountryPresenter
    {
        ICountry icountry;

        CountryModel countryModel = new CountryModel();

        public CountryPresenter(ICountry views)
        {
            this.icountry = views;
        }

        private void connectBetweenModelInterface()
        {
            countryModel.ID = icountry.ID;
            countryModel.CountryName = icountry.CountryName;

        }
        // دالة ادخال البيانات في القاعدة
        public bool CountryInsert()
        {
            connectBetweenModelInterface();
            bool check =  CountryService.countryInsert(countryModel.ID, countryModel.CountryName);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة التحديث
        public bool CountryUpdate()
        {
            connectBetweenModelInterface();
            bool check = CountryService.CountryUpdate(countryModel.ID, countryModel.CountryName);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة الحدف
        public bool CountryDelete()
        {
            connectBetweenModelInterface();
            bool check =CountryService.CountryDelete(countryModel.ID);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة حدف الكل
        public bool CountryDeleteAll()
        {
            connectBetweenModelInterface();
            bool check = CountryService.countryDeleteAll();
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة مسح الحقول
        public void ClearFields()
        {
            
            icountry.ID = 0;
            icountry.CountryName = "";
        }
        // دالة select
        public void getAllData()
        {
           // connectBetweenModelInterface();
           icountry.dataGridView = CountryService.getAllData();
            ClearFields();
        }
        public void AutoNumber()
        {
            string test = (CountryService.getMaxID().Rows[0][0]).ToString();
            if (test == null || test == "")
            {
                icountry.ID = 1;
            }else
            {
                icountry.ID = Convert.ToInt32(CountryService.getMaxID().Rows[0][0]) + 1;
            }
            icountry.CountryName = "";
            icountry.btnSave = false;
            icountry.btnDelete = false;
            icountry.btnDeleteAll = false;
            icountry.btnNew = true;
            
        }
        public void getRow(int row)
        {
            // نعرق طابل 
            DataTable tbl = new DataTable();
            // البيانات التي عندا وضعتاها في طابل
            tbl = CountryService.getAllData();

            icountry.ID = Convert.ToInt32(tbl.Rows[row][0]);
            icountry.CountryName = Convert.ToString(tbl.Rows[row][1]);

            icountry.btnSave = true;
            icountry.btnDelete = true;
            icountry.btnDeleteAll = true;
            icountry.btnNew = false;
        }
        public DataTable getLastRow()
        {
            // نعرق طابل 
            DataTable tbl = new DataTable();
            // البيانات التي عندا وضعتاها في طابل
            tbl = CountryService.getLastRow();
            return tbl;
        }
    }
}
