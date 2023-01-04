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
    class CategoryPresenter
    {
        // ناخد نسخة من ICategory
        ICategory icategory;

        // تاخد instance 
        CategoryModel catModel = new CategoryModel();
        // الفائدة من كونسركثور اول ما يتم استدعاء الكلاص هادي اول كود يتنفد هو كوسيكثور
        public CategoryPresenter(ICategory view)
        {
            this.icategory = view;
        }
        private void connectBetweenModelInterface()
        {
            catModel.ID = icategory.ID;
            catModel.CatName = icategory.CatName;

        } 
        // دالة ادخال البيانات في القاعدة
        public bool CatInsert()
        {
            connectBetweenModelInterface();
            bool check= CategoryService.categoryInsert(catModel.ID, catModel.CatName);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة التحديث
        public bool CatUpdate()
        {
            connectBetweenModelInterface();
            bool check = CategoryService.categoryUpdate(catModel.ID, catModel.CatName);
            getAllData();
            AutoNumber();
            return check;
            
        }
        // دالة الحدف
        public bool CatDelete()
        {
            connectBetweenModelInterface();
            bool check =  CategoryService.categoryDelete(catModel.ID);
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة حدف الكل
        public bool CatDeleteAll()
        {
            connectBetweenModelInterface();
            bool check = CategoryService.categoryDeleteAll();
            getAllData();
            AutoNumber();
            return check;
        }
        // دالة مسح الحقول
        public void ClearFields()
        {
            
            icategory.ID = 0;
            icategory.CatName = "";
        }
        // دالة SELECT
        public void getAllData()
        {
            //connectBetweenModelInterface();
            icategory.dataGridView = CategoryService.getAllData();
            ClearFields();
        }
        public void AutoNumber()
        {
            string test = (CategoryService.getMaxID().Rows[0][0]).ToString();
            if (test == null || test == "")
            {
                icategory.ID = 1;
            }
            else
            {
                icategory.ID = Convert.ToInt32(CategoryService.getMaxID().Rows[0][0]) + 1;
            }
            
            icategory.CatName = "";
            icategory.btnSave = false;
            icategory.btnDelete = false;
            icategory.btnDeleteAll = false;
            icategory.btnNew = true;

        }
        public void getRow(int row)
        {
            // نعرق طابل 
            DataTable tbl = new DataTable();
            // البيانات التي عندا وضعتاها في طابل
            tbl = CategoryService.getAllData();

            icategory.ID = Convert.ToInt32(tbl.Rows[row][0]);
            icategory.CatName = Convert.ToString(tbl.Rows[row][1]);

            icategory.btnSave = true;
            icategory.btnDelete = true;
            icategory.btnDeleteAll = true;
            icategory.btnNew = false;
        }
        public DataTable getLastRow()
        {
            // نعرق طابل 
            DataTable tbl = new DataTable();
            // البيانات التي عندا وضعتاها في طابل
            tbl = CategoryService.getLastRow();
            return tbl;
        }
    }
}
