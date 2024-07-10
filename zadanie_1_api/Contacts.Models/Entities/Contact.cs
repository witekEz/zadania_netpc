using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.Entities
{
    public class Contact
    {
        //Primary Key
        public int Id { get; set; }
        //Properties
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;
        public string NickName { get; set; } = null!;
        public string PasswordHash { get; set; } = null!;
        public DateOnly? BirthDate { get; set; }
        public int RoleId { get; set; }
        //Navigation Properties
        public virtual List<AboutCategory> AboutCategories { get; set; } = null!;
        public virtual Role Role { get; set; }=null!;
    }
}
