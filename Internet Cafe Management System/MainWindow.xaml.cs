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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Internet_Cafe_Management_System
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btn_listpc_Click(object sender, RoutedEventArgs e)
        {
            PcLibraryList list = new PcLibraryList();
            list.Owner = this;
            list.ShowDialog();
        }

        private void btn_exit_Click(object sender, RoutedEventArgs e)
        {   
            App.Current.Shutdown();
        }
    }
}
