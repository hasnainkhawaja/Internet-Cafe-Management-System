using Internet_Cafe_Management_System.DBHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Internet_Cafe_Management_System.ViewModels
{
    public class PcInformationViewModel
    {
        private object p;
        private PcInformationListViewModel pcInformationListViewModel;
        public Models.Computers Computer { set; get; }
        public PcInformationViewModel(PcInformationListViewModel pcInformationListViewModel, object p)
        {
            this.pcInformationListViewModel = pcInformationListViewModel;
            this.p = p;
            if (p == null)
            {
                Computer = new Models.Computers();
            }
        }

        internal bool saveData()
        {
            if (Computer.Pcname.Length == 0 && Computer.Ipaddress.Length == 0)
            {
                MessageBox.Show("Please enter computer name and unique ip address", "Data required", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {

                using (SqlConnection connection = new SqlConnection(DbManager.ConnectionString))
                {
                    SqlCommand command = new SqlCommand("sp_ValidatePc", connection);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.Add("@pcname", SqlDbType.VarChar,100).Value = Computer.Pcname.Trim();
                    command.Parameters.Add("@ipaddress", SqlDbType.VarChar,100).Value = Computer.Ipaddress.Trim();
                    command.Parameters.Add("@message", SqlDbType.VarChar,100).Direction = ParameterDirection.Output;
                    command.Connection = connection;
                    connection.Open();
                    command.ExecuteNonQuery();
                    string message = command.Parameters["@message"].Value.ToString();
                    if (message.Length > 0)
                    {
                        MessageBox.Show(message, "Validation error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                    }
                    else
                    {
                        command.Dispose();

                        command = new SqlCommand("sp_InsertComputer",connection);
                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.Parameters.Add("@pcname", SqlDbType.VarChar).Value = Computer.Pcname.Trim();
                        command.Parameters.Add("@ipaddress", SqlDbType.VarChar).Value = Computer.Ipaddress.Trim();
                        command.Parameters.Add("@acitve", SqlDbType.Bit).Value = Computer.Active?1:0;
                        command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                        try
                        { 
                            command.ExecuteNonQuery();
                            Computer.Id = int.Parse(command.Parameters["@id"].Value.ToString());
                            MessageBox.Show("Record inserted successfully.", "Success", MessageBoxButton.OK, MessageBoxImage.Information);
                            this.pcInformationListViewModel.Computer.Add(Computer);
                            return true;
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }
                        finally
                        {
                            connection.Close();
                            connection.Dispose();
                        }
                    }

                }


            }

            return false;
        }
    }
}
