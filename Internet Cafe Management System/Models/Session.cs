using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_Cafe_Management_System.Models
{
    public class Session
    {
        public string Sessionid { get; set; }
        public Nullable<DateTime> Starttime { get; set; }
        public Nullable<DateTime> Endtime { get; set; }
        public int Cusomerid { set; get; }
        public int Computerid { set; get; }
        public string Session_password { set; get; }
        public bool Active { set; get; }
        public bool isInternetAvailable { set; get; }
    }
}
