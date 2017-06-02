using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_Cafe_Management_System.Models
{
    public class SessionPrint
    {
        public int Id { get; set; }
        public int Paperid { get; set; }
        public string Sessionid { get; set; }
        public int Qty { get; set; }
        public string Status { get; set; }
        public Nullable<DateTime> processData { get; set; }
    }
}
