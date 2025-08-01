﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Domain.Models
{
   public class Payment
    {
        public int PaymentId { get; set; }

        public int OrderId { get; set; }
        public Order Order { get; set; }


        public string PaymentMethod { get; set; }
        public decimal Amount { get; set; }
        public DateTime PaidAt { get; set; }
        public string? Status { get; set; }


        public int CreatedBy { get; set; }
        public DateTime  CreatedAt { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedAt { get; set; }
    }
}
