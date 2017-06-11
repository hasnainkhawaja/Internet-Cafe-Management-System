using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_CafeManagement_System.Models
{
    public class Shift
    {
        public int Id { set; get; }
        public string Title { set; get; }
        public DateTime StartTime { set; get; }
        public DateTime EndTime { set; get; }
        public bool Active { set; get; }
    }
}
