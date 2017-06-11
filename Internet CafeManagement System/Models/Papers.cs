using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_CafeManagement_System.Models
{
    public class Papers
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public decimal SinglePrice { get; set; }
        public decimal DoublePrice { get; set; }
        public int IsColorPaper { get; set; }
        public bool IsMisc { get; set; }
        public bool IsActive { get; set; } 
    }
}
