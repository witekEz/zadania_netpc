using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Read;
using Contacts.Models.DTOs.Update;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Interfaces
{
    public interface IContactService
    {
        Task<List<ContactBasicDTO>> Get();
        Task<ContactDetailsDTO> Get(int id);
        Task<int> Create(CreateContactDTO dto);
        Task Upadte(int id, UpdateContactDTO dto);
        Task Delete(int id);

    }
}
