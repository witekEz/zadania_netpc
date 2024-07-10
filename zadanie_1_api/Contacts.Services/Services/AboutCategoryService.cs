using AutoMapper;
using Contacts.DAL.EF;
using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Update;
using Contacts.Models.Entities;
using Contacts.Services.Interfaces;
using Contacts.Services.Middleware.Exceptions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Services
{
    public class AboutCategoryService:IAboutCategoryService
    {
        private readonly ContactsDbContext _dbContext;
        private readonly IMapper _mapper;
        public AboutCategoryService(ContactsDbContext dbContext, IMapper mapper) 
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<int> Create(CreateAboutCategoryDTO dto, int contactId)
        {
            var contact=await _dbContext.Contacts.FirstOrDefaultAsync(c=>c.Id==contactId)
                 ?? throw new NotFoundException("Contact not found");
            var categories = await _dbContext.Categories.ToListAsync();
            var subcategories = await _dbContext.Subcategories.ToListAsync();
            var category = _mapper.Map<AboutCategory>(dto);
            if (dto.Category != null)
            {
                category.Category = categories.First(c => c.Name == dto.Category);
                if (dto.Category == "Służbowy" && dto.Subcategory != null)
                {
                    if (subcategories.Any(c => c.Name == dto.Subcategory))
                    {
                        category.Subcategory = subcategories.FirstOrDefault(s => s.Name == dto.Subcategory);
                    }
                    else
                        throw new BadRequestException("Bad request!");
                }
                else if (dto.Category == "Inny" && dto.Subcategory != null)
                {
                    if (!subcategories.Any(c => c.Name == dto.Subcategory))
                    {
                        var newSubcategory = new Models.Entities.Subcategory() { Name = dto.Subcategory };
                        category.Subcategory = newSubcategory;
                    }
                    else
                        throw new BadRequestException("Bad request!");
                }
                else if (dto.Category == "Prywatny" && dto.Subcategory == null)
                {
                    category.Subcategory = null;
                }
                else
                    throw new BadRequestException("Bad request!");
            }
            category.Contact = contact;
            _dbContext.AboutCategories.Add(category);
            await _dbContext.SaveChangesAsync();
            return category.Id;
        }

        public async Task Delete(int contactId, int id)
        {
            var contact= await _dbContext.Contacts.FirstOrDefaultAsync(c => c.Id == contactId)
                ?? throw new NotFoundException("Contact not found");
            var category = await _dbContext.AboutCategories.FirstOrDefaultAsync(i => i.Id == id)
                ?? throw new NotFoundException("Category not found");
            if (category == null || !contact.AboutCategories.Any(c => c.Id == id))
                throw new NotFoundException("Category not found");
            _dbContext.AboutCategories.Remove(category);
            await _dbContext.SaveChangesAsync();
        }

        public async Task Update(UpdateAboutCategoryDTO dto, int contactId, int id)
        {
            var contact=await _dbContext.Contacts.FirstOrDefaultAsync(c=>c.Id==contactId)
                ?? throw new NotFoundException("Contact not found");
            var category=await _dbContext.AboutCategories.FirstOrDefaultAsync(i=>i.Id==id)
                ?? throw new NotFoundException("Category not found");
            if (category == null || !contact.AboutCategories.Any(c => c.Id == id))
                throw new NotFoundException("Category not found");
            var subcategories=await _dbContext.Subcategories.ToListAsync();
            var categories = await _dbContext.Categories.ToListAsync();
            if (dto.Email != null)
            {
                category.Email = dto.Email;
            }
            if (dto.PhoneNumber != null)
            {
                category.PhoneNumber = dto.PhoneNumber;
            }
            if (dto.Category != null)
            {
                category.Category = categories.First(c => c.Name == dto.Category);
                if (dto.Category == "Służbowy" && dto.Subcategory!=null)
                {
                    if (subcategories.Any(c => c.Name == dto.Subcategory))
                    {
                        category.Subcategory = subcategories.FirstOrDefault(s => s.Name == dto.Subcategory);
                    }
                    else
                        throw new BadRequestException("Bad request!");
                }
                else if (dto.Category == "Inny" && dto.Subcategory!=null)
                {
                    if (!subcategories.Any(c => c.Name == dto.Subcategory))
                    {
                        var newSubcategory = new Models.Entities.Subcategory() { Name = dto.Subcategory };
                        category.Subcategory = newSubcategory;
                    }
                    else
                        throw new BadRequestException("Bad request!");
                }              
                else if (dto.Category == "Prywatny" && dto.Subcategory == null)
                {
                    category.Subcategory = null;
                }
                else
                    throw new BadRequestException("Bad request!");

            }
            await _dbContext.SaveChangesAsync();

        }
    }
}
