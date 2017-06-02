using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_Cafe_Management_System.Models
{
    public class Papers
    {
        public int Id { get; set; }
        public int PaperSizeId { get; set; }
        public int PapercolorId { get; set; }
        public decimal price { get; set; }
    }
}
