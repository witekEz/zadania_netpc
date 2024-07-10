using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Update
{
    public class UpdateAboutCategoryDTO
    {
        public string? Email { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Category { get; set; }
        public string? Subcategory { get; set; }
    }
}
