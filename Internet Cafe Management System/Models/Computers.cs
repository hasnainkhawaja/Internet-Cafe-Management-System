using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_Cafe_Management_System.Models
{
    public class Computers  :INotifyPropertyChanged
    {
        private string pcname;
        private string ip;
        private bool active;

        public int Id
        {
            set;get;
        }
        public string Pcname
        {
            set
            {
                pcname = value; onChange("Pcname");
            }
            get
            {
                return pcname;
            }
        }
        public string Ipaddress
        {
            set
            {
                ip = value; onChange("Ipaddress");
            }
            get
            {
                return ip;
            }

        }
        public bool Active
        {
            set
            {
                active = value; onChange("Active");
            }
            get
            {
                return active;
            }

        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void onChange(string parameter)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(parameter));
        }
    }
}
