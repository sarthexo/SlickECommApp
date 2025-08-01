using SlickStore.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Application.Interfaces.RepoInterfaces
{
   public interface ICartItemRepository
    {
        Task<IEnumerable<CartItem>> GetByCartIdAsync(int CartId);
        Task<CartItem?> GetByIdAsync(int id);
        Task AddAsync(CartItem item);
        Task UpdateAsync(CartItem item);
        Task DeleteAsync(CartItem item);
    }
}
