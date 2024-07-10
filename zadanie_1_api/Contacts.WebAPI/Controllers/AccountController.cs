using Contacts.Models.DTOs.Create;
using Contacts.Services.Interfaces;
using Contacts.Services.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Contacts.WebAPI.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _accountService;
        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }
        //Prcesses login
        [HttpPost("login")]
        public async Task<ActionResult> Login([FromBody] LoginDTO dto)
        {
            string token = await _accountService.GenerateJwt(dto);
            return Ok(token);
        }
    }
}
