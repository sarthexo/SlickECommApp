using SlickStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Application.Interfaces.RepoInterfaces
{
    public interface IPaymentRepository
    {
        Task<Payment?> GetByOrderIdAsync(int orderId);
        Task AddAsync(Payment payment);
        Task UpdateAsync(Payment payment);
    }
}
