using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_Cafe_Management_System.Models
{
    public class Customer
    {
        public int Id { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Contactno { get; set; }
        public string Address { get; set; } 
        public bool Active { get; set; }
    }
}
