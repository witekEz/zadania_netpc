using Contacts.Models.DTOs.Read;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Interfaces
{
    public interface ISubcategoryService
    {
        Task<List<SubcategoryDTO>> Get();
    }
}
