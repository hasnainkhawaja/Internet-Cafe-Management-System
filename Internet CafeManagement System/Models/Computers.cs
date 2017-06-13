using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Internet_CafeManagement_System.Models
{
   public class Computers
    {
        public int Id { set; get; }
        public string PcName { set; get; }
        public string IP { set; get; }
        public int FloorId { set; get; }
        public bool Active { set; get; }
        public ComputerStatus Status { set; get; }
    }
    public enum ComputerStatus
    {
        Idle,
        Busy,
        SessionClosed,
        Payment
    }
}
