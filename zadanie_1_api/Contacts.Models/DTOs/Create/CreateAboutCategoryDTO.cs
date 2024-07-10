using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Create
{
    public class CreateAboutCategoryDTO
    {
        public string Email { get; set; } = null!;
        public string? PhoneNumber { get; set; }
        public string Category { get; set; } = null!;
        public string? Subcategory { get; set; }
    }
}
