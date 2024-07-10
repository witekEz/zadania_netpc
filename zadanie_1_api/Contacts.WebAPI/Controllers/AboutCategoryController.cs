using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Update;
using Contacts.Models.Entities;
using Contacts.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Contacts.WebAPI.Controllers
{
    [Route("api/contact/{contactId}/aboutcategory")]
    [ApiController]
    [Authorize(Roles = "Admin")]
    public class AboutCategoryController : ControllerBase
    {
        private readonly IAboutCategoryService _categoryService;
        public AboutCategoryController(IAboutCategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        //Creates new AboutCategory object for specified Contact
        [HttpPost]
        public async Task<ActionResult<int>>Create(CreateAboutCategoryDTO dto, int contactId)
        {
            var id = await _categoryService.Create(dto, contactId);
            return Ok(id);
        }
        //Updates exsisting AboutCategory object for specified Contact
        [HttpPut("{id}")]
        public async Task<ActionResult> Update(UpdateAboutCategoryDTO dto, int contactId, int id)
        {
            await _categoryService.Update(dto,contactId, id);
            return NoContent(); 
        }
        //Deletes exsisting AboutCategory object for specified Contact
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int contactId, int id)
        {
            await _categoryService.Delete(contactId, id);
            return NoContent();
        }
    }
}
