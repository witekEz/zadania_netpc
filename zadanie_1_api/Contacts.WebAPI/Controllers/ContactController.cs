using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Read;
using Contacts.Models.DTOs.Update;
using Contacts.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Contacts.WebAPI.Controllers
{
    [Route("api/contact")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        private readonly IContactService _contactService;
        public ContactController(IContactService contactService)
        {
            _contactService = contactService;
        }
        //Returns list of Contacts
        [HttpGet]
        [AllowAnonymous]
        public async Task<ActionResult<List<ContactBasicDTO>>>Get()
        {
            var contactsBasic = await _contactService.Get();
            return Ok(contactsBasic);
        }
        //Returns sepcified Contact object
        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<ActionResult<ContactDetailsDTO>> Get(int id)
        {
            var contactDetails = await _contactService.Get(id);
            return Ok(contactDetails);
        }
        //Creates new Contact object
        [HttpPost]
        [Authorize(Roles ="Admin")]
        public async Task<ActionResult<int>> Create(CreateContactDTO dto)
        {
            var contactId = await _contactService.Create(dto);
            return Ok(contactId);
        }
        //Updates exsisting Contact object
        [HttpPut("{id}")]
        [Authorize(Roles = "Admin")]
        public async Task<ActionResult> Update(UpdateContactDTO dto, int id)
        {
            await _contactService.Upadte(id,dto);
            return NoContent();
        }
    }
}
