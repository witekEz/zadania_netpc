using Contacts.DAL.EF;
using Contacts.Models.Entities;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Seeder
{
    public class ContactSeeder
    {
        private readonly ContactsDbContext _dbContext;
        private readonly IPasswordHasher<Contact> _passwordHasher;

        public ContactSeeder(ContactsDbContext dbContext, IPasswordHasher<Contact> passwordHasher)
        {
            _dbContext = dbContext;
            _passwordHasher = passwordHasher;
        }
        public void Seed()
        {
            if (_dbContext.Database.CanConnect())
            {
                var pendingMigrations = _dbContext.Database.GetPendingMigrations();
                if(pendingMigrations != null && pendingMigrations.Any())
                {
                    _dbContext.Database.Migrate();
                }
                if (!_dbContext.Roles.Any())
                {
                    var roles = GetRoles();
                    _dbContext.AddRange(roles);
                    _dbContext.SaveChanges();
                }
                if (!_dbContext.Subcategories.Any())
                {
                    var subCategories= GetSubCategories();
                    var categories = GetCategories();

                    _dbContext.AddRange(subCategories);
                    _dbContext.AddRange(categories);

                    var categoryInfo = GetAboutCategories(categories);
                    var user = GetUser(categoryInfo);

                    
                    _dbContext.AddRange(user);

                    _dbContext.SaveChanges();

                }
            }
        }
        private IEnumerable<Role> GetRoles() 
        {
            var roles = new List<Role>()
            {
                new Role()
                {
                    Name = "Admin",
                }
            };
            return roles;
        }
        private IEnumerable<Subcategory> GetSubCategories()
        {
            var subCategories = new List<Subcategory>()
            {
                new()
                {
                    Name="Szef"
                },
                new()
                {
                    Name="Klient"
                },
                new()
                {
                    Name="Menadżer"
                },
                new()
                {
                    Name="Pracownik"
                },
                new()
                {
                    Name="Kandydat"
                }
            };
            return subCategories;
        }
        private IEnumerable<Category> GetCategories()
        {
            var categories = new List<Category>() 
            {
                new()
                {
                    Name="Służbowy"
                },
                new()
                {
                    Name="Prywatny"
                },
                new()
                {
                    Name="Inny"
                }
            };
            return categories;
        }
        private IEnumerable<AboutCategory> GetAboutCategories(IEnumerable<Category> categories)
        {
            var categoryInfo = new List<AboutCategory>()
            {
                new AboutCategory()
                {
                    Category = categories.Skip(1).First(),
                    Email = "mwitkowski18@protonmail.com",
                    PhoneNumber = "+48790488680"
                }
                
            };
            return categoryInfo;
        }
        private Contact GetUser(IEnumerable<AboutCategory> categoryInfo)
        {
            var newUser = new Contact()
            {
                FirstName = "Michał",
                LastName = "Witkowski",
                NickName = "michal23",
                BirthDate = new DateOnly(2001, 03, 12),
                RoleId = 1,
                AboutCategories = categoryInfo.ToList(),
            };
            newUser.PasswordHash = _passwordHasher.HashPassword(newUser, "haslo123haslo123");
            return newUser;
        }

    }
}
