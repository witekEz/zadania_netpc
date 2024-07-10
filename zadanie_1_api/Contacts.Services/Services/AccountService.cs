using Contacts.DAL.EF;
using Contacts.Models.DTOs.Create;
using Contacts.Models.Entities;
using Contacts.Services.Interfaces;
using Contacts.Services.Middleware.Exceptions;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Services
{
    public class AccountService : IAccountService
    {
        private readonly ContactsDbContext _dbContext;
        private readonly IPasswordHasher<Contact> _passwordHasher;
        private readonly AuthenticationSettings _authenticationSettings;
        public AccountService(ContactsDbContext dbContext, IPasswordHasher<Contact> passwordHasher, AuthenticationSettings authenticationSettings) 
        {
            _dbContext = dbContext;
            _passwordHasher = passwordHasher;
            _authenticationSettings = authenticationSettings;
        }

        public async Task<string> GenerateJwt(LoginDTO dto)
        {
            var contact=await _dbContext.Contacts.FirstOrDefaultAsync(c=>c.NickName==dto.NickName)
                ?? throw new BadRequestException("Invalid email or password");
            var result = _passwordHasher.VerifyHashedPassword(contact, contact.PasswordHash, dto.Password);
            if (result == PasswordVerificationResult.Failed)
                throw new BadRequestException("Invalid email or password");

            var claims = new List<Claim>()
            {
                new Claim(ClaimTypes.NameIdentifier, contact.Id.ToString()),
                new Claim(ClaimTypes.Name, $"{contact.FirstName} {contact.LastName}"),
                new Claim(ClaimTypes.Role,$"{contact.Role.Name}"),
                new Claim("DateOfBirth",contact.BirthDate.Value.ToString("yyyy-MM-dd")),
                new Claim("NickName",contact.NickName)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_authenticationSettings.JwtKey));
            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var expires = DateTime.Now.AddHours(_authenticationSettings.JwtExpireHours);
            var token = new JwtSecurityToken(_authenticationSettings.JwtIssuer,
                _authenticationSettings.JwtIssuer,
                claims,
                expires: expires,
                signingCredentials: cred);
            var tokenHandler = new JwtSecurityTokenHandler();

            return tokenHandler.WriteToken(token);
        }
    }
}
