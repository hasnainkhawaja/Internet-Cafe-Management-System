using Internet_Cafe_Management_System.DBHelper;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_Cafe_Management_System.ViewModels
{
    public class PcInformationListViewModel
    {
        public PcLibraryList form;
        public ObservableCollection<Models.Computers> Computer { set; get; }

        public PcInformationListViewModel(PcLibraryList pcLibraryList)
        {
            this.form = pcLibraryList;

            using (SqlConnection connection = new SqlConnection(DbManager.ConnectionString))
            {
                SqlCommand command = new SqlCommand("sp_SelectComputers", connection);
                connection.Open();
                SqlDataReader reader=  command.ExecuteReader();
                DataTable tmpComputerDataTable = new DataTable();
                tmpComputerDataTable.Load(reader);
                reader.Close();
                connection.Dispose(); 
                Computer = new ObservableCollection<Models.Computers>();

                foreach(DataRow row in tmpComputerDataTable.Rows)
                {
                    Computer.Add(new Models.Computers()
                    {
                        Id = int.Parse(row["id"].ToString()),
                        Pcname = row["pcname"].ToString(),
                        Ipaddress = row["ipaddress"].ToString(),
                        Active = bool.Parse(row["isactive"].ToString())
                    });
                }
                
                
            }


        }
    }
}
