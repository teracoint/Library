using DevExpress.XtraEditors;
using Library.Logic.Presenter;
using Library.Views.Interface;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Library.Views.Forms
{
    public partial class Frm_Category : DevExpress.XtraEditors.XtraForm , ICategory 
    {
        // ناخد نسخة
        CategoryPresenter catPresenter;

        public int ID { get =>Convert.ToInt32(txtID.Text); set => txtID.Text = value.ToString(); }
        public string CatName { get =>Convert.ToString (txtName.Text); set => txtName.Text=value.ToString(); }
        public object dataGridView { get => Dgv.DataSource; set => Dgv.DataSource = value; }
        int ICategory.row { get => row; set => row = value; }
        object ICategory.btnNew { get => btnNew.Enabled; set => btnNew.Enabled = Convert.ToBoolean(value); }
        object ICategory.btnAdd { get => btnAdd.Enabled; set => btnAdd.Enabled = Convert.ToBoolean(value); }
        object ICategory.btnSave { get => btnSave.Enabled; set => btnSave.Enabled = Convert.ToBoolean(value); }
        object ICategory.btnDelete { get => btnDelete.Enabled; set => btnDelete.Enabled = Convert.ToBoolean(value); }
        object ICategory.btnDeleteAll { get => btnDeleteAll.Enabled; set => btnDeleteAll.Enabled = Convert.ToBoolean(value); }

        int row;
        public Frm_Category()
        {
            InitializeComponent();
            catPresenter = new CategoryPresenter(this);
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void Frm_Category_Load(object sender, EventArgs e)
        {
            catPresenter.getAllData();
            catPresenter.AutoNumber();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "")
            {
                MessageBox.Show("من فظلك أدخل إسم الدولة", "تأكيد", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            bool check = catPresenter.CatInsert();
            if (check)
            {
                MessageBox.Show("تمت الإصافة بنجاح");
            }
            else
            {
                MessageBox.Show("فشل في عملية الإضافة");
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "")
            {
                MessageBox.Show("من فظلك أدخل إسم الدولة", "تأكيد", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            bool check = catPresenter.CatUpdate();
            if (check)
            {
                MessageBox.Show("تم التعديل بنجاح");
            }
            else
            {
                MessageBox.Show("فشل في عملية التعديل");
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            bool check = catPresenter.CatDelete();
            if (check)
            {
                MessageBox.Show("تم الحدف بنجاح");
            }
            else
            {
                MessageBox.Show("فشل في عملية الحدف");
            }
        }

        private void btnDeleteAll_Click(object sender, EventArgs e)
        {
            bool check = catPresenter.CatDeleteAll();
            if (check)
            {
                MessageBox.Show("تم حدف الكل بنجاح");
            }
            else
            {
                MessageBox.Show("فشل في عملية الحدف");
            }

        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            catPresenter.ClearFields();
            catPresenter.AutoNumber();
        }

        private void btnFrist_Click(object sender, EventArgs e)
        {
            row = 0;
            catPresenter.getRow(row);
        }

        private void btnLast_Click(object sender, EventArgs e)
        {
            try
            {
                int countLastRow = Convert.ToInt32(catPresenter.getLastRow().Rows[0][0]) - 1;
                row = countLastRow;
                catPresenter.getRow(row);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                int countRow = Convert.ToInt32(catPresenter.getLastRow().Rows[0][0]);
                if (countRow == row)
                {
                    row = 0;
                }
                else
                {
                    row = row + 1;
                }
                catPresenter.getRow(row);
            }
            catch (Exception ex)
            {

            }
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            int countRow = Convert.ToInt32(catPresenter.getLastRow().Rows[0][0]) - 1;
            if (row == 0)
            {
                row = countRow;
            }
            else
            {
                row = row - 1;
            }

            catPresenter.getRow(row);
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

        }
    }
}