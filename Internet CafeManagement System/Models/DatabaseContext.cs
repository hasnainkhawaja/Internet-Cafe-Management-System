using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_CafeManagement_System.Models
{
    class DatabaseContext
    {
        public static DataTable GetData(SqlCommand command)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=MY-DESKTOP;Initial Catalog=InternetcafeManagment;Integrated Security=True"))
                {
                    command.Connection = connection;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    command.CommandType = CommandType.StoredProcedure;
                    DataTable table = new DataTable();
                    table.Load(reader);
                    return table;
                };
            } catch(Exception ex)
            {
                return new DataTable();
            }
        }

        public static bool Execute(SqlCommand command)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=MY-DESKTOP;Initial Catalog=InternetcafeManagment;Integrated Security=True"))
                {
                    command.Connection = connection;
                    connection.Open();
                    command.CommandType = CommandType.StoredProcedure;
                    command.ExecuteNonQuery();

                    return true;
                };
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
