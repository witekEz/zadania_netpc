using AutoMapper;
using Contacts.Models.DTOs.Create;
using Contacts.Models.DTOs.Read;
using Contacts.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Mapper
{
    public class ContactMappingProfile:Profile
    {
        public ContactMappingProfile() 
        {
            //From Entity => DTO
            CreateMap<Contact, ContactBasicDTO>();
            CreateMap<Contact, ContactDetailsDTO>();
            CreateMap<Category, CategoryDTO>();
            CreateMap<Subcategory, SubcategoryDTO>();
            CreateMap<AboutCategory, AboutCategoryDTO>()
                .ForMember(des => des.Category, opt => opt.MapFrom(src => src.Category.Name))
                .ForMember(des => des.Subcategory, opt => opt.MapFrom(src => (src.Subcategory!=null)? src.Subcategory.Name:""));

            //From CreateDTO => Entity
            CreateMap<CreateContactDTO, Contact>()
                .ForMember(m => m.PasswordHash, c => c.Ignore())
                .ForMember(m => m.AboutCategories, c => c.Ignore());
            CreateMap<CreateAboutCategoryDTO, AboutCategory>()
                .ForMember(m => m.Category, c => c.Ignore())
                .ForMember(m => m.Subcategory, c => c.Ignore());
        }
    }
}
