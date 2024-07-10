using Contacts.Models.DTOs.Read;
using Contacts.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Contacts.WebAPI.Controllers
{
    [Route("api/category")]
    [ApiController]
    [AllowAnonymous]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService) { _categoryService = categoryService; }
        //Returns list of Categories
        [HttpGet]
        public async Task<ActionResult<List<CategoryDTO>>> Get()
        {
            var categories =await _categoryService.Get();
            return Ok(categories);
        }
    }
}
