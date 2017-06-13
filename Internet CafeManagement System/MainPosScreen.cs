using Internet_CafeManagement_System.Models;
using MetroFramework.Forms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TableDependency.SqlClient;

namespace Internet_CafeManagement_System
{
    public partial class MainPosScreen : MetroForm
    {
        public MainPosScreen()
        {
            InitializeComponent();
        }

        List<Rates> Rates { set; get; }
        List<Products> Products { set; get; }
        List<Computers> Computers { set; get; }
        public SqlTableDependency<Computers> tableDependency { set; get; }

        private void MainPosScreen_Load(object sender, EventArgs e)
        {
            #region db load
            var ComputersTemp = DatabaseContext.GetData(new System.Data.SqlClient.SqlCommand("SelectComputers"));

             Computers = ComputersTemp.AsEnumerable().Select(row => new Computers()
            {
                Id = Convert.ToInt32(row["id"]),
                PcName = row["pcName"].ToString(),
                Active = Convert.ToBoolean(row["isactive"]),
                FloorId = Convert.ToInt32(row["floorid"]),
                IP = row["ipaddress"].ToString(),
                Status = (ComputerStatus)row["status"],
            }).ToList();


            var RatesTemp = DatabaseContext.GetData(new System.Data.SqlClient.SqlCommand("SelectRates"));
            Rates = RatesTemp.AsEnumerable().Select(row => new Rates()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(),
                Price = Convert.ToDecimal(row["price"]),
                Active = Convert.ToBoolean(row["active"])
            }).ToList();

            var ProductsTemp = DatabaseContext.GetData(new System.Data.SqlClient.SqlCommand("SelectProducts"));
            Products = ProductsTemp.AsEnumerable().Select(row => new Products()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(),
                Price = Convert.ToDecimal(row["price"]),
                TimeRestricted = row["timeRestricted"].ToString(),
                StartTime = Convert.ToDateTime(row["startTime"]),
                EndTime = Convert.ToDateTime(row["endTime"]),
                Active = Convert.ToBoolean(row["active"])
            }).ToList();

            foreach (Computers computer in Computers.Where(x => x.Active))
            {
                Button btn = new Button() { Text = computer.PcName, Width = 84, Height = 59 };
                btn.Click += computerOperation;
                btn.Tag = computer.Id;
                btn.Cursor = Cursors.Hand;
                if (computer.Status == ComputerStatus.Idle)
                {
                    btn.BackColor = Color.Green;
                    btn.ForeColor = Color.White;
                }
                else if (computer.Status == ComputerStatus.Busy)
                {
                    btn.BackColor = Color.Yellow;
                    btn.ForeColor = Color.Black;
                }
                else if (computer.Status == ComputerStatus.Payment)
                {
                    btn.BackColor = Color.Red;
                    btn.ForeColor = Color.White;
                }
                else if (computer.Status == ComputerStatus.SessionClosed)
                {
                    btn.BackColor = Color.Pink;
                    btn.ForeColor = Color.Black;
                }

                if (computer.FloorId == 1)
                {
                    floor1.Controls.Add(btn);
                }
                else if (computer.FloorId == 2)
                {
                    floor2.Controls.Add(btn);
                }
                else
                {
                    floor3.Controls.Add(btn);
                }

            }


            foreach (Rates rate in Rates.Where(x => x.Active))
            {
                Button btn = new Button() { Text = rate.Title, Width = 93, Height = 35 };
                btn.Click += addRateToCart;
                btn.Tag = rate.Id;
                btn.Cursor = Cursors.Hand;
                ratesPanelFlow.Controls.Add(btn);
            }
            foreach (Products product in Products.Where(x => x.Active))
            {
                for (int a = 0; a < 100; a++)
                {
                    Button btn = new Button() { Text = product.Title, Width = 97, Height = 35 };
                    btn.Click += addProductCart;
                    btn.Cursor = Cursors.Hand;
                    btn.Tag = product.Id;
                    productsFlowPanel.Controls.Add(btn);
                }
            }

            #endregion
            loadSqlDependency();

        }

        private void loadSqlDependency()
        {
            tableDependency = new SqlTableDependency<Computers>("Data Source=MY-DESKTOP;Initial Catalog=InternetcafeManagment;Integrated Security=True", "Computers");
            tableDependency.OnStatusChanged += TableDependency_OnStatusChanged;
            tableDependency.OnChanged += TableDependency_OnChanged;
            tableDependency.OnError += TableDependency_OnError;
            tableDependency.TraceLevel = TraceLevel.Verbose; 
            tableDependency.TraceListener = new TextWriterTraceListener(Console.Out);  
            tableDependency.TraceListener = new TextWriterTraceListener(File.AppendText("F:\\logs\\output.txt"));
            tableDependency.Start();

        }

        private void TableDependency_OnError(object sender, TableDependency.EventArgs.ErrorEventArgs e)
        {
            //error condition
        }

        private void TableDependency_OnChanged(object sender, TableDependency.EventArgs.RecordChangedEventArgs<Computers> e)
        {
            var computer = e.Entity as Computers;
            var computerBtn = Computers.SingleOrDefault(x => x.Id == computer.Id);
            if(computerBtn!=null)
            {
                computerBtn = computer;
                if(computerBtn.FloorId==1)
                {
                    var btnFind = floor1.Controls.OfType<Button>().ToList().SingleOrDefault(x => x.Tag.ToString().Equals(computer.Id.ToString()));
                    if(btnFind!=null)
                    {
                        if (computerBtn.Status == ComputerStatus.Idle)
                        {
                            btnFind.BackColor = Color.Green;
                            btnFind.ForeColor = Color.White;
                        }
                        else if (computerBtn.Status == ComputerStatus.Busy)
                        {
                            btnFind.BackColor = Color.Yellow;
                            btnFind.ForeColor = Color.Black;
                        }
                        else if (computerBtn.Status == ComputerStatus.Payment)
                        {
                            btnFind.BackColor = Color.Red;
                            btnFind.ForeColor = Color.White;
                        }
                        else if (computerBtn.Status == ComputerStatus.SessionClosed)
                        {
                            btnFind.BackColor = Color.Pink;
                            btnFind.ForeColor = Color.Black;
                        }
                    }
                }
                else if(computerBtn.FloorId==2)
                {
                    var btnFind = floor2.Controls.OfType<Button>().ToList().SingleOrDefault(x => x.Tag.ToString().Equals(computer.Id.ToString()));
                    if (btnFind != null)
                    {
                        if (computerBtn.Status == ComputerStatus.Idle)
                        {
                            btnFind.BackColor = Color.Green;
                            btnFind.ForeColor = Color.White;
                        }
                        else if (computerBtn.Status == ComputerStatus.Busy)
                        {
                            btnFind.BackColor = Color.Yellow;
                            btnFind.ForeColor = Color.Black;
                        }
                        else if (computerBtn.Status == ComputerStatus.Payment)
                        {
                            btnFind.BackColor = Color.Red;
                            btnFind.ForeColor = Color.White;
                        }
                        else if (computerBtn.Status == ComputerStatus.SessionClosed)
                        {
                            btnFind.BackColor = Color.Pink;
                            btnFind.ForeColor = Color.Black;
                        }
                    }
                }
                else
                {
                    var btnFind = floor3.Controls.OfType<Button>().ToList().SingleOrDefault(x => x.Tag.ToString().Equals(computer.Id.ToString()));
                    if (btnFind != null)
                    {
                        if (computerBtn.Status == ComputerStatus.Idle)
                        {
                            btnFind.BackColor = Color.Green;
                            btnFind.ForeColor = Color.White;
                        }
                        else if (computerBtn.Status == ComputerStatus.Busy)
                        {
                            btnFind.BackColor = Color.Yellow;
                            btnFind.ForeColor = Color.Black;
                        }
                        else if (computerBtn.Status == ComputerStatus.Payment)
                        {
                            btnFind.BackColor = Color.Red;
                            btnFind.ForeColor = Color.White;
                        }
                        else if (computerBtn.Status == ComputerStatus.SessionClosed)
                        {
                            btnFind.BackColor = Color.Pink;
                            btnFind.ForeColor = Color.Black;
                        }
                    }
                }
            }
        }

        private void TableDependency_OnStatusChanged(object sender, TableDependency.EventArgs.StatusChangedEventArgs e)
        {
            //start end dependency
        }

        private void computerOperation(object sender, EventArgs e)
        {
            Computers computer =  Computers.SingleOrDefault(x => x.Id == Convert.ToInt32((sender as Button).Tag));
            SessionGenerator session = new SessionGenerator(computer.Id);
            session.Owner = this;
            session.ShowDialog();
        }

        private void addProductCart(object sender, EventArgs e)
        {

        }

        private void addRateToCart(object sender, EventArgs e)
        {

        }

        private void groupBox7_Enter(object sender, EventArgs e)
        {

        }

        private void btn_settings_Click(object sender, EventArgs e)
        {
            ManagementScreen sc = new ManagementScreen();
            sc.ShowDialog();
        }

        private void MainPosScreen_FormClosing(object sender, FormClosingEventArgs e)
        {
            tableDependency.Stop();
        }
    }
}
