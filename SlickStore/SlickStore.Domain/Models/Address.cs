using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Domain.Models
{
   public class Address
    {
        public int AddressId { get; set; }
        public int UserId { get; set; }



        public string FullName { get; set; }
        public string Phone { get; set; }
        public string AddressLine1 { get; set; }
        public string? AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }

        public bool IsDefault { get; set; }

        public User User { get; set; }


        public int CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedAt { get; set; }


        public ICollection<Order> Orders { get; set; }
    }
}
