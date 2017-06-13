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
    public partial class ManagementScreen : MetroForm
    {
        public ManagementScreen()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            loadProducts();
            loadRates();
            loadShifts();
            loadPapers();
            loadFloors();
            loadComputers();
        }

        private void floor_btn_remove_Click(object sender, EventArgs e)
        {

        }

        private void floor_addsave_btn_Click(object sender, EventArgs e)
        {

        }

        private void floors_list_MouseDoubleClick(object sender, MouseEventArgs e)
        {

        }


        #region product crud
        Products SelectedProduct { set; get; }
        private void btn_add_save_product_Click(object sender, EventArgs e)
        {
            if (product_title.Text.Trim().Length == 0)
            {
                MessageBox.Show("Enter product title", "Invaliad title", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (SelectedProduct == null)
            {
                 
                    SqlCommand command = new SqlCommand("InserProduct");
                    command.Parameters.AddWithValue("@title", product_title.Text.Trim());

                    decimal price = 0;

                    decimal.TryParse(product_price.Text, out price);

                    command.Parameters.AddWithValue("@price", price);
                    command.Parameters.AddWithValue("@timeRestricted", product_timerestricted.Text.Trim());
                    command.Parameters.AddWithValue("@startTime", product_startime.Text.Trim());
                    command.Parameters.AddWithValue("@endTime", productEndTime.Text.Trim());
                    command.Parameters.AddWithValue("@active", productIsActive.Checked);
                    

                    if(Convert.ToBoolean(DatabaseContext.Execute(command)))
                    {
                        loadProducts();  
                        product_title.Clear();
                        productIsActive.Checked = false;
                        product_price.Clear();

                        MessageBox.Show("Product added successfully", "Product added", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                   else
                    {
                        MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                 
            }
            else
            {
                SqlCommand command = new SqlCommand("UpdateProduct");
                command.Parameters.AddWithValue("@title", product_title.Text.Trim());

                decimal price = 0;

                decimal.TryParse(product_price.Text, out price);

                command.Parameters.AddWithValue("@id", SelectedProduct.Id);
                command.Parameters.AddWithValue("@price", price);
                command.Parameters.AddWithValue("@timeRestricted", product_timerestricted.Text.Trim());
                command.Parameters.AddWithValue("@startTime", product_startime.Text.Trim());
                command.Parameters.AddWithValue("@endTime", productEndTime.Text.Trim());
                command.Parameters.AddWithValue("@active", productIsActive.Checked);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadProducts();
                    product_title.Clear();
                    productIsActive.Checked = false;
                    product_price.Clear();
                    SelectedProduct = null;
                    MessageBox.Show("Product updated successfully", "Product updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        } 
        public void loadProducts()
        {
            SqlCommand command = new SqlCommand("SelectProducts");
            command.CommandType = CommandType.StoredProcedure;

            DataTable table = DatabaseContext.GetData(command);

            List<Products> products = table.AsEnumerable().Select(row => new Products()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(),
                Price = Convert.ToDecimal(row["price"]),
                TimeRestricted = row["timeRestricted"].ToString(),
                StartTime = Convert.ToDateTime(row["startTime"]),
                EndTime = Convert.ToDateTime(row["endTime"]),
                Active = Convert.ToBoolean(row["active"])

            }).ToList();
            list_products.DataSource = products;
            list_products.DisplayMember = "title";
        }

        private void btn_product_remove_Click(object sender, EventArgs e)
        {
            if (list_products.SelectedItems.Count > 0)
            {
                foreach (Object selectedItem in list_products.SelectedItems)
                {
                    SqlCommand command = new SqlCommand("DeleteProduct");
                    command.Parameters.AddWithValue("@id", (selectedItem as Products).Id);
                    DatabaseContext.Execute(command);
                }

                loadProducts();
            }
        }
        private void list_products_DoubleClick(object sender, EventArgs e)
        {
            if (list_products.SelectedItems.Count > 0)
            {
                SelectedProduct = (list_products.SelectedItem as Products);
                product_title.Text = SelectedProduct.Title;
                product_price.Text = SelectedProduct.Price.ToString();
                product_timerestricted.SelectedItem  = SelectedProduct.TimeRestricted;
                product_startime.Value = SelectedProduct.StartTime;
                productEndTime.Value = SelectedProduct.EndTime;
                productIsActive.Checked = SelectedProduct.Active;
            }
        }

        private void btn_product_reset_Click(object sender, EventArgs e)
        {
            loadProducts();
            SelectedProduct = null;
            product_title.Clear();
            productIsActive.Checked = false;
            product_price.Clear();
        }


        #endregion


        #region rate crud
        public void loadRates()
        {
            SqlCommand command = new SqlCommand("SelectRates");
            command.CommandType = CommandType.StoredProcedure;

            DataTable table = DatabaseContext.GetData(command);

            List<Rates> rates = table.AsEnumerable().Select(row => new Rates()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(),
                Price = Convert.ToDecimal(row["price"]),
                Active = Convert.ToBoolean(row["active"])
            }).ToList();
            list_rates.DataSource = rates;
            list_rates.DisplayMember = "title";
        }
        Rates SelectedRate { set; get; }
        private void btn_rate_add_save_Click(object sender, EventArgs e)
        {
            if (rate_title.Text.Trim().Length == 0)
            {
                MessageBox.Show("Enter rate title", "Invalid title", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (SelectedRate == null)
            {

                SqlCommand command = new SqlCommand("InsertRate");
                command.Parameters.AddWithValue("@title", rate_title.Text.Trim());

                decimal price = 0;

                decimal.TryParse(rate_price.Text, out price);
                command.Parameters.AddWithValue("@price", price);
                command.Parameters.AddWithValue("@active", rate_active.Checked);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadRates();
                    rate_title.Clear();
                    rate_active.Checked = false;
                    rate_price.Clear();
                    SelectedRate = null;
                    MessageBox.Show("Rate added successfully", "Rate added", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            else
            {
                SqlCommand command = new SqlCommand("UpdateRate");
                command.Parameters.AddWithValue("@title", rate_title.Text.Trim());

                decimal price = 0;

                decimal.TryParse(rate_price.Text, out price);

                command.Parameters.AddWithValue("@id", SelectedRate.Id);
                command.Parameters.AddWithValue("@price", price); 
                command.Parameters.AddWithValue("@active", rate_active.Checked);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadRates();
                    rate_title.Clear();
                    rate_active.Checked = false;
                    rate_price.Clear();
                    SelectedRate = null;
                    MessageBox.Show("Rate updated successfully", "Rate updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }



        private void btn_remove_Click(object sender, EventArgs e)
        {
            if (list_rates.SelectedItems.Count > 0)
            {
                foreach (Object selectedItem in list_rates.SelectedItems)
                {
                    SqlCommand command = new SqlCommand("DeleteRate");
                    command.Parameters.AddWithValue("@id", (selectedItem as Rates).Id);
                    DatabaseContext.Execute(command);
                }

                loadProducts();
            }
        }

        private void list_rates_DoubleClick(object sender, EventArgs e)
        {
            if (list_rates.SelectedItems.Count > 0)
            {
                SelectedRate = (list_rates.SelectedItem as Rates);
                rate_title.Text = SelectedRate.Title;
                rate_price.Text = SelectedRate.Price.ToString();
                rate_active.Checked = SelectedRate.Active;

            }
        }
        private void btn_reset_rates_Click(object sender, EventArgs e)
        {
            SelectedRate = null;
            rate_title.Clear();
            rate_price.Clear();
            rate_active.Checked =false;
        }
        #endregion


        #region shifts crud
        Shift SelectedShift { set; get; }

        public void loadShifts()
        {
            SqlCommand command = new SqlCommand("SelectShifts");
            command.CommandType = CommandType.StoredProcedure;

            DataTable table = DatabaseContext.GetData(command);

            List<Shift> shifts = table.AsEnumerable().Select(row => new Shift()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(),
                StartTime = Convert.ToDateTime(row["startTime"]),
                EndTime = Convert.ToDateTime(row["endTime"]),
                Active = Convert.ToBoolean(row["active"])
            }).ToList();
            list_shift.DataSource = shifts;
            list_shift.DisplayMember = "Title";
        }
        private void btn_shift_addsave_Click(object sender, EventArgs e)
        {
            if (shift_title.Text.Trim().Length == 0)
            {
                MessageBox.Show("Enter shift title", "Invalid title", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (SelectedShift == null)
            {

                SqlCommand command = new SqlCommand("InsertShift");
                command.Parameters.AddWithValue("@title", shift_title.Text.Trim());
                command.Parameters.AddWithValue("@startTime", shift_starttime.Text.Trim());
                command.Parameters.AddWithValue("@endTime", shift_endtime.Text.Trim());
                command.Parameters.AddWithValue("@active", shift_acitve.Checked);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadShifts();
                    shift_title.Clear();
                    shift_acitve.Checked = false;
                  

                    MessageBox.Show("Shift added successfully", "Shift added", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            else
            {
                SqlCommand command = new SqlCommand("UpdateShift");
                command.Parameters.AddWithValue("@title", shift_title.Text.Trim()); 

                command.Parameters.AddWithValue("@id", SelectedShift.Id); 
                command.Parameters.AddWithValue("@startTime", shift_starttime.Text.Trim());
                command.Parameters.AddWithValue("@endTime", shift_endtime.Text.Trim());
                command.Parameters.AddWithValue("@active", shift_acitve.Checked);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadShifts();
                    shift_title.Clear();
                    shift_acitve.Checked = false;
                    SelectedShift = null;
                    MessageBox.Show("Shift updated successfully", "Shift updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void shift_remove_Click(object sender, EventArgs e)
        {
            if (list_shift.SelectedItems.Count > 0)
            {
                foreach (Object selectedItem in list_shift.SelectedItems)
                {
                    SqlCommand command = new SqlCommand("DeleteShift");
                    command.Parameters.AddWithValue("@id", (selectedItem as Shift).Id);
                    DatabaseContext.Execute(command);
                }

                loadShifts();
            }
        }

        private void list_shift_DoubleClick(object sender, EventArgs e)
        {
            if (list_shift.SelectedItems.Count > 0)
            {
                SelectedShift = (list_shift.SelectedItem as Shift);
                shift_title.Text = SelectedShift.Title;
                shift_acitve.Checked = SelectedShift.Active;
                shift_starttime.Value = SelectedShift.StartTime;
                shift_endtime.Value = SelectedShift.EndTime;
            }
        }

        private void btn_reset_shift_Click(object sender, EventArgs e)
        {
            loadShifts();
            SelectedShift = null;
            shift_title.Clear();
            shift_acitve.Checked = false; 
        }

        #endregion

        #region paper managemenet crud
        Papers SelectedPaper { set; get; }
        public void loadPapers()
        {
            SqlCommand command = new SqlCommand("SelectPapers");
            command.CommandType = CommandType.StoredProcedure;

            DataTable table = DatabaseContext.GetData(command);

            List<Papers> papers = table.AsEnumerable().Select(row => new Papers()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(),
                SinglePrice = Convert.ToDecimal(row["singlePrice"]),
                DoublePrice = Convert.ToDecimal(row["doublePrice"]),
                IsMisc = Convert.ToBoolean(row["isMisc"]),
                IsColorPaper = Convert.ToInt32(row["isColorPaper"]),
                IsActive = Convert.ToBoolean(row["isActive"])
            }).ToList();
            list_paper.DataSource = papers;
            list_paper.DisplayMember = "Title";
        }
        private void btn_save_paper_Click(object sender, EventArgs e)
        {
            if (paper_title.Text.Trim().Length == 0)
            {
                MessageBox.Show("Enter paper title", "Invalid title", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (SelectedPaper == null)
            {

                decimal price = 0;
                decimal.TryParse(paper_single_price.Text, out price);
                decimal price2 = 0;
                decimal.TryParse(paper_second_price.Text, out price2);

                SqlCommand command = new SqlCommand("InsertPaper");
                command.Parameters.AddWithValue("@title", paper_title.Text.Trim());
                command.Parameters.AddWithValue("@singlePrice", price);
                command.Parameters.AddWithValue("@doublePrice", price2);
                command.Parameters.AddWithValue("@isColorPaper", isColor.Checked == false ? 0 : 1);
                command.Parameters.AddWithValue("@isMisc", false);
                command.Parameters.AddWithValue("@isActive", true);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadPapers();
                    paper_title.Clear();
                    isColor.Checked = false;
                    paper_second_price.Clear();
                    paper_single_price.Clear();

                    MessageBox.Show("Paper added successfully", "Paper added", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            else
            {
                
                decimal price = 0;
                decimal.TryParse(paper_single_price.Text, out price);
                decimal price2 = 0;
                decimal.TryParse(paper_second_price.Text, out price2);

                SqlCommand command = new SqlCommand("UpdatePaper");
                command.Parameters.AddWithValue("@id", SelectedPaper.Id);
                command.Parameters.AddWithValue("@title", paper_title.Text.Trim());
                command.Parameters.AddWithValue("@singlePrice", price);
                command.Parameters.AddWithValue("@doublePrice", price2);
                command.Parameters.AddWithValue("@isColorPaper", isColor.Checked==false?0:1);
                command.Parameters.AddWithValue("@isMisc", false);
                command.Parameters.AddWithValue("@isActive", true);
 

              
                


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadPapers();
                    SelectedPaper = null;
                    paper_title.Clear();
                    isColor.Checked = false;
                    paper_second_price.Clear();
                    paper_single_price.Clear();
                    MessageBox.Show("Paper information updated successfully", "Paper updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btn_reset_paper_Click(object sender, EventArgs e)
        {
            loadPapers();
            SelectedPaper = null;
            paper_title.Clear();
            isColor.Checked = false;
            paper_second_price.Clear();
            paper_single_price.Clear();
        }

        private void btn_remove_paper_Click(object sender, EventArgs e)
        {
            if (list_paper.SelectedItems.Count > 0)
            {
                foreach (Object selectedItem in list_paper.SelectedItems)
                {
                    SqlCommand command = new SqlCommand("DeletePaper");
                    command.Parameters.AddWithValue("@id", (selectedItem as Papers).Id);
                    DatabaseContext.Execute(command);
                }

                loadPapers();
            }
        }

        private void list_paper_DoubleClick(object sender, EventArgs e)
        {
            if (list_paper.SelectedItems.Count > 0)
            {
                SelectedPaper = (list_paper.SelectedItem as Papers);
                paper_title.Text = SelectedPaper.Title;
                paper_single_price.Text = SelectedPaper.SinglePrice.ToString();
                paper_second_price.Text = SelectedPaper.DoublePrice.ToString();
                isColor.Checked = SelectedPaper.IsColorPaper==0?false:true;
                
            }
        }
        #endregion


        #region computer management
        Computers SelectedComputer { set; get; }
        public void loadFloors()
        {
            SqlCommand command = new SqlCommand("SelectFloors");
            command.CommandType = CommandType.StoredProcedure;

            DataTable table = DatabaseContext.GetData(command);

            List<Floor> floors = table.AsEnumerable().Select(row => new Floor()
            {
                Id = Convert.ToInt32(row["id"]),
                Title = row["title"].ToString(), 
                Active = Convert.ToBoolean(row["active"])

            }).ToList();
            floorDDl.DisplayMember = "title";
            floorDDl.ValueMember = "id";
            floorDDl.DataSource = floors;
        }
        public void loadComputers()
        {
            SqlCommand command = new SqlCommand("SelectComputers");
            command.CommandType = CommandType.StoredProcedure;

            DataTable table = DatabaseContext.GetData(command);

            List<Computers> Computers = table.AsEnumerable().Select(row => new Computers()
            {
                Id = Convert.ToInt32(row["id"]),
                PcName = row["pcName"].ToString(),
                Active = Convert.ToBoolean(row["isactive"]),
                FloorId= Convert.ToInt32(row["floorid"]),
                IP = row["ipaddress"].ToString(),
            }).ToList();
            computer_list.DisplayMember = "PcName";
            computer_list.DataSource = Computers;
        }

        private void reset_computer_Click(object sender, EventArgs e)
        {
            loadComputers();
            computer_title.Clear();
            computerIp.Clear();
            floorDDl.SelectedIndex = 0;
            computerActive.Checked = false;
        }

        private void addsaveComputer_Click(object sender, EventArgs e)
        {
            if (computer_title.Text.Trim().Length == 0)
            {
                MessageBox.Show("Enter computer title", "Invalid title", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (computerIp.Text.Trim().Length == 0)
            {
                MessageBox.Show("Enter computer ip", "Invalid IP", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else if (SelectedComputer == null)
            {

                SqlCommand command = new SqlCommand("InsertComputer");
                command.Parameters.AddWithValue("@pcname", computer_title.Text.Trim());
                command.Parameters.AddWithValue("@ipaddress", computerIp.Text.Trim());
                command.Parameters.AddWithValue("@floorid", floorDDl.SelectedValue);
                command.Parameters.AddWithValue("@isactive", computerActive.Checked);


                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    
                    loadComputers();
                    computer_title.Clear();
                    computerIp.Clear();
                    floorDDl.SelectedIndex = 0;
                    computerActive.Checked = false;

                    MessageBox.Show("Computer added successfully", "Computer added", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            else
            {
                SqlCommand command = new SqlCommand("UpdateComputer");
                command.Parameters.AddWithValue("@id", SelectedComputer.Id);
                command.Parameters.AddWithValue("@pcname", computer_title.Text.Trim());
                command.Parameters.AddWithValue("@ipaddress", computerIp.Text.Trim());
                command.Parameters.AddWithValue("@floorid", floorDDl.SelectedValue);
                command.Parameters.AddWithValue("@isactive", computerActive.Checked);

                if (Convert.ToBoolean(DatabaseContext.Execute(command)))
                {
                    loadComputers();
                    computer_title.Clear();
                    computerIp.Clear();
                    floorDDl.SelectedIndex = 0;
                    computerActive.Checked = false;
                    MessageBox.Show("Computer updated successfully", "Computer updated", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Please try again", "Try again", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void removepc_Click(object sender, EventArgs e)
        {
            if (computer_list.SelectedItems.Count > 0)
            {
                foreach (Object selectedItem in computer_list.SelectedItems)
                {
                    SqlCommand command = new SqlCommand("DeleteComputer");
                    command.Parameters.AddWithValue("@id", (selectedItem as Computers).Id);
                    DatabaseContext.Execute(command);
                }

                loadComputers();
            }
        }

        private void computer_list_DoubleClick(object sender, EventArgs e)
        {
            if (computer_list.SelectedItems.Count > 0)
            {
                SelectedComputer = (computer_list.SelectedItem as Computers);
                computer_title.Text = SelectedComputer.PcName;
                computerIp.Text = SelectedComputer.IP;
                floorDDl.SelectedValue = SelectedComputer.FloorId;
                computerActive.Checked = SelectedComputer.Active;
            }
        }
        #endregion


    }
}
