using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Update
{
    public class UpdateContactDTO
    {
        public string? FirstName{ get; set; }
        public string? LastName { get; set; }
        public DateOnly? BirthDate { get; set; }
    }
}
