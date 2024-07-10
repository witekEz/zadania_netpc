using Contacts.Models.DTOs.Read;
using Contacts.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Contacts.WebAPI.Controllers
{
    [Route("api/subcategory")]
    [ApiController]
    [AllowAnonymous]
    public class SubcategoryController : ControllerBase
    {
        private readonly ISubcategoryService _subcategoryService;
        public SubcategoryController(ISubcategoryService subcategoryService) { _subcategoryService = subcategoryService; }
        //Returns list of Subcategories
        [HttpGet]
        public async Task<ActionResult<List<CategoryDTO>>> Get()
        {
            var subcategories = await _subcategoryService.Get();
            return Ok(subcategories);
        }
    }
}
