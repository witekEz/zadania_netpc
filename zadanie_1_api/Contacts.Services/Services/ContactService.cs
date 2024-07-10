using AutoMapper;
using Contacts.DAL.EF;
using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Read;
using Contacts.Models.DTOs.Update;
using Contacts.Models.Entities;
using Contacts.Services.Interfaces;
using Contacts.Services.Middleware.Exceptions;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Services
{
    public class ContactService : IContactService
    {
        private readonly ContactsDbContext _dbContext;
        private readonly IPasswordHasher<Contact> _passwordHasher;
        private readonly IMapper _mapper;
        public ContactService(ContactsDbContext dbContext, IMapper mapper, IPasswordHasher<Contact> passwordHasher) 
        {
            _dbContext = dbContext;
            _mapper = mapper;
            _passwordHasher = passwordHasher;
        }
        public async Task<int> Create(CreateContactDTO dto)
        {
            var contact = _mapper.Map<Contact>(dto);
            var hashedPassword = _passwordHasher.HashPassword(contact, dto.Password);
            contact.PasswordHash = hashedPassword;
            contact.RoleId = 1;

            var category = await _dbContext.Categories.FirstOrDefaultAsync(c => c.Name == dto.Category)
                ?? throw new NotFoundException("Category not found");

            contact.AboutCategories = new List<AboutCategory>
            {
                new AboutCategory()
                {
                    Email=dto.Email,
                    PhoneNumber=dto.PhoneNumber,
                    CategoryId=category.Id,
                }
            };
            if (category.Name=="Służbowy" && dto.Subcategory != null)
            {
                var subcategory = await _dbContext.Subcategories.FirstOrDefaultAsync(c => c.Name == dto.Subcategory)
                    ?? throw new NotFoundException("Subcategory not found");
                contact.AboutCategories.First().SubcategoryId=subcategory.Id;
            };

            if (category.Name == "Inny" && dto.Subcategory!=null)
            {
                var subcategory = await _dbContext.Subcategories.FirstOrDefaultAsync(c => c.Name == dto.Subcategory);
                if(subcategory == null)
                {
                    subcategory = new Models.Entities.Subcategory { Name = dto.Subcategory };
                    await _dbContext.Subcategories.AddAsync(subcategory);
                    await _dbContext.SaveChangesAsync();
                }
                contact.AboutCategories.First().SubcategoryId = subcategory.Id;

            };
            await _dbContext.Contacts.AddAsync(contact);
            await _dbContext.SaveChangesAsync();

            return contact.Id;
        }

        public async Task Delete(int id)
        {
            var contact = await _dbContext.Contacts.FirstOrDefaultAsync(c => c.Id == id)
                ?? throw new NotFoundException("Contact not found");

            _dbContext.Contacts.Remove(contact);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<ContactBasicDTO>> Get()
        {
            var contactsBasic=await _dbContext.Contacts.ToListAsync() 
                ?? throw new NotFoundException("Contacts not found");

            var contactsBasicDTO=_mapper.Map<List<ContactBasicDTO>>(contactsBasic);
            return contactsBasicDTO;
        }

        public async Task<ContactDetailsDTO> Get(int id)
        {
            var contactDetails=await _dbContext.Contacts.FirstOrDefaultAsync(i=>i.Id==id) 
                ?? throw new NotFoundException("Contact not found");
            var contactDetailsDTO=_mapper.Map<ContactDetailsDTO>(contactDetails);
            return contactDetailsDTO;
        }

        public async Task Upadte(int id, UpdateContactDTO dto)
        {
            var contact = await _dbContext.Contacts.FirstOrDefaultAsync(i => i.Id == id)
                ?? throw new NotFoundException("Contact not found");

            if(dto.FirstName!=null)
            {
                contact.FirstName = dto.FirstName;
            }
            if (dto.LastName != null)
            {
                contact.LastName = dto.LastName;
            }
            if (dto.BirthDate != null)
            {
                contact.BirthDate = dto.BirthDate;
            }
            await _dbContext.SaveChangesAsync();
        }
    }
}
