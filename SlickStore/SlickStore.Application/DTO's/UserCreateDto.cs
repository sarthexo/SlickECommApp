using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Application.DTO_s
{
   public class UserCreateDto
    {
        public string UserName { get; set; } = string.Empty;

        [EmailAddress]
        public string Email { get; set; } = string.Empty;

        public string Password { get; set; } = String.Empty; //will get hashed in service

        public int RoleId { get; set; }
    }
}
