using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Read
{
    public class AboutCategoryDTO
    {
        public int Id { get; set; }
        public string Email { get; set; } = null!;
        public string? PhoneNumber { get; set; }
        public string Category { get; set; } = null!;
        public string? Subcategory { get; set; }
    }
}
