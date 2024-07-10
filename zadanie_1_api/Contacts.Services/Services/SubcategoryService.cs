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
    public class SubcategoryService:ISubcategoryService
    {
        private readonly ContactsDbContext _dbContext;
        private readonly IMapper _mapper;
        public SubcategoryService(ContactsDbContext dbContext, IMapper mapper)
        {
            _dbContext = dbContext;
            _mapper = mapper;
        } 
        public async Task<List<SubcategoryDTO>> Get()
        {
            var subcategories = await _dbContext.Subcategories.ToListAsync()
                ?? throw new NotFoundException("Subcategories not found!");
            var subcategoryDTOs = _mapper.Map<List<SubcategoryDTO>>(subcategories);
            return subcategoryDTOs;
        }
    }
}
