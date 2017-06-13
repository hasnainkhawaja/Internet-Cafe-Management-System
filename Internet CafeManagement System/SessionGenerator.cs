using Internet_CafeManagement_System.Models;
using MetroFramework.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Internet_CafeManagement_System
{
    public partial class SessionGenerator : MetroForm
    {
        public int computerId { set; get; }
        public SessionGenerator(int computerid)
        {
            InitializeComponent();
            computerId = computerid;
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_generateCode_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Do you want to generate session?","Confirm",MessageBoxButtons.YesNo,MessageBoxIcon.Question)==DialogResult.Yes)
            {
                string code = RandomString(4);
                SqlCommand command = new SqlCommand("GenerateSession");
                command.Parameters.AddWithValue("@computerId", computerId);
                command.Parameters.AddWithValue("@sessionCode", code);
                command.Parameters.AddWithValue("@createdBy","Hasnain");
                command.Parameters.AddWithValue("@startTime",DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));

                if(DatabaseContext.Execute(command))
                {
                    MessageBox.Show("Session generated successfully Session Code : " + code, "Session Key generated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Please try again");
                }


            }
        }


        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
