using AutoMapper;
using Contacts.DAL.EF;
using Contacts.Models.DTOs.Read;
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
    public class CategoryService:ICategoryService
    {
        private readonly ContactsDbContext _dbContext;
        private readonly IMapper _mapper;
        public CategoryService(ContactsDbContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        }

        public async Task<List<CategoryDTO>> Get()
        {
            var categories = await _dbContext.Categories.ToListAsync()
                ?? throw new NotFoundException("Categories not found!");
            var categoryDTOs=_mapper.Map<List<CategoryDTO>>(categories);
            return categoryDTOs;

        }
    }
}
