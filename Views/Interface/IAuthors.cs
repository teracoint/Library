using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Library.Views.Interface
{
    public interface IAuthors
    {
        int ID { get; set; }
        string AuthorName { get; set; }
        string AuthorDate { get; set; }
        int CountryID { get; set; }
        object dataGridView { get; set; }
        object cbxCountry { get; set; }
        // من اجل اسهم التنقل
        int row { get; set; }
        // نعمل كل الازرار المراد التحكم بها  على شكل اوبجي
        object btnNew { get; set; }
        object btnAdd { get; set; }
        object btnSave { get; set; }
        object btnDelete { get; set; }
        object btnDeleteAll { get; set; }

    }
}
