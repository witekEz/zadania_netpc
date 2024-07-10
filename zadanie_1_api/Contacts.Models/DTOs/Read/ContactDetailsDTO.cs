using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.DTOs.Read
{
    public class ContactDetailsDTO
    {
        public int Id { get; set; }
        public List<AboutCategoryDTO> AboutCategories { get; set; } = null!;
    }
}
