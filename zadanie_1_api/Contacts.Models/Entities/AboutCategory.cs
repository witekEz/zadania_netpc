using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.Entities
{
    public class AboutCategory
    {
        //Primary Key
        public int Id { get; set; }
        //Properties
        public string? PhoneNumber { get; set; }
        public string Email { get; set; } = null!;
        //Nawvigation Properties
        public virtual Contact Contact { get; set; } = null!;
        public virtual Category Category { get; set; } = null!;
        public virtual Subcategory ?Subcategory { get; set; }

        //Foreign Keys
        public int CategoryId { get; set; }
        public int? SubcategoryId { get; set; }
    }
}
