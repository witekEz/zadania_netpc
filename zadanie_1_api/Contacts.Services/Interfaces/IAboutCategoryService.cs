using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Update;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Interfaces
{
    public interface IAboutCategoryService
    {
        Task Update(UpdateAboutCategoryDTO dto, int contactId, int id);
        Task<int> Create(CreateAboutCategoryDTO dto, int contactId);
        Task Delete(int contactId, int id);
    }
}
