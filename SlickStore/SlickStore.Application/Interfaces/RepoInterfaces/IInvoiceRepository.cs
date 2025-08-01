using SlickStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Application.Interfaces.RepoInterfaces
{
   public interface IInvoiceRepository
    {
        Task<Invoice> GetByOrderIdAsync(int orderId);
        Task AddAsync(Invoice invoice);
    }
}
