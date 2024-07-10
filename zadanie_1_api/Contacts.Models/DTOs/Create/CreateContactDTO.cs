using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Create
{
    public class CreateContactDTO
    {
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string NickName { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string Category { get; set; } = null!;
        public string? Subcategory { get; set; }
        public string Email { get; set; } = null!;
        public string? PhoneNumber { get; set; } 
        public DateOnly? BirthDate { get; set; }
    }
}
