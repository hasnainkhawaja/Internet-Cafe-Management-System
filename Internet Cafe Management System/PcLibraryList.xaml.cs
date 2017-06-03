using Internet_Cafe_Management_System.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Internet_Cafe_Management_System
{
    /// <summary>
    /// Interaction logic for PcLibraryList.xaml
    /// </summary>
    public partial class PcLibraryList : Window
    {
        public PcLibraryList()
        {
            InitializeComponent();
            this.DataContext = new PcInformationListViewModel(this);
        }

        private void btn_exit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_addNewPc_Click(object sender, RoutedEventArgs e)
        {
            PCInformation information = new PCInformation((this.DataContext as PcInformationListViewModel),null);
            information.Owner = this;
            information.ShowDialog();
        }
    }
}
