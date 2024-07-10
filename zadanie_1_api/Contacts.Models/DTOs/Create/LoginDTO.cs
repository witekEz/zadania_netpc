using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Create
{
    public class LoginDTO
    {
        public string NickName { get; set; } = null!;
        public string Password { get; set; } = null!;
    }
}
