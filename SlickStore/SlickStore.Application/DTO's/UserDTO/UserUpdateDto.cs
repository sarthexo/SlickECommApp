using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Application.DTO_s
{
   public class UserUpdateDto
    {
        public string Username { get; set; } = string.Empty;

        [EmailAddress]
        public string Email { get; set; } = string.Empty;

        public int RoleId { get; set; }

        public bool IsActive { get; set; }
    }
}
