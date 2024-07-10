using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Models.Entities
{
    public class Category
    {
        //Primary Key
        public int Id { get; set; }
        //Properties
        public string Name { get; set; } = null!;

    }
}
