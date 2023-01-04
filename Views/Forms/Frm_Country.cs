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
    public partial class Frm_Country : DevExpress.XtraEditors.XtraForm, ICountry
    {
        // ناخد نسخة
        CountryPresenter countryPresenter;
        public Frm_Country()
        {
            InitializeComponent();
            countryPresenter = new CountryPresenter(this);
        }

        public int ID { get => Convert.ToInt32(txtID.Text); set => txtID.Text = value.ToString(); }
        public string CountryName { get => Convert.ToString(txtName.Text); set => txtName.Text = value.ToString(); }
        public object dataGridView { get => Dgv.DataSource; set => Dgv.DataSource = value; }
        int ICountry.row { get => row; set => row = value; }
        object ICountry.btnNew { get => btnNew.Enabled; set => btnNew.Enabled =Convert.ToBoolean (value); }
        object ICountry.btnAdd { get => btnAdd.Enabled; set => btnAdd.Enabled = Convert.ToBoolean(value); }
        object ICountry.btnSave { get => btnSave.Enabled; set => btnSave.Enabled = Convert.ToBoolean(value); }
        object ICountry.btnDelete { get => btnDelete.Enabled; set => btnDelete.Enabled = Convert.ToBoolean(value); }
        object ICountry.btnDeleteAll { get => btnDeleteAll.Enabled; set => btnDeleteAll.Enabled = Convert.ToBoolean(value); }

        int row = 0;
        private void Frm_Country_Load(object sender, EventArgs e)
        {
            countryPresenter.getAllData();
            countryPresenter.AutoNumber();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if(txtName.Text == "")
            {
                MessageBox.Show("من فظلك أدخل إسم الدولة","تأكيد",MessageBoxButtons.OK,MessageBoxIcon.Information);
                return;
            }
            bool check = countryPresenter.CountryInsert();
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
            bool check = countryPresenter.CountryUpdate();
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
            bool check = countryPresenter.CountryDelete();
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
            bool check = countryPresenter.CountryDeleteAll();
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
            countryPresenter.ClearFields();
            countryPresenter.AutoNumber();
        }

        private void btnFrist_Click(object sender, EventArgs e)
        {
            row = 0;
            countryPresenter.getRow(row);
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            try
            {
                int countRow = Convert.ToInt32(countryPresenter.getLastRow().Rows[0][0]);
                if (countRow == row)
                {
                    row = 0;
                }
                else
                {
                    row = row + 1;
                }
                countryPresenter.getRow(row);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            int countRow = Convert.ToInt32(countryPresenter.getLastRow().Rows[0][0]) - 1;
            if (row == 0)
            {
                row = countRow;
            }
            else
            {
                row = row - 1;
            }
            
            countryPresenter.getRow(row);
        }

        private void btnLast_Click(object sender, EventArgs e)
        {
            try
            {
                int countRow = Convert.ToInt32(countryPresenter.getLastRow().Rows[0][0]) - 1;
                row = countRow;
                countryPresenter.getRow(row);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {

        }
    }
}