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
using Internet_Cafe_Management_System.ViewModels;

namespace Internet_Cafe_Management_System
{
    /// <summary>
    /// Interaction logic for PCInformation.xaml
    /// </summary>
    public partial class PCInformation : Window
    {
        private object p;
        private PcInformationListViewModel pcInformationListViewModel;
 
        public PCInformation(PcInformationListViewModel pcInformationListViewModel, object p)
        {
            InitializeComponent();
            this.pcInformationListViewModel = pcInformationListViewModel;
            this.p = p;
            this.DataContext = new PcInformationViewModel(this.pcInformationListViewModel, p); 
        }

        private void btn_exit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_addsave_Click(object sender, RoutedEventArgs e)
        {

            bool close = (this.DataContext as PcInformationViewModel).saveData();

            if(close)
            {
                this.Close();
            }
        }
    }
}
