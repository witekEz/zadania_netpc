using Contacts.Models.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.DAL.EF
{
    public class ContactsDbContext : DbContext
    {
        public ContactsDbContext(DbContextOptions<ContactsDbContext> options) : base(options) { }

        public DbSet<Contact> Contacts { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Subcategory> Subcategories { get; set; }
        public DbSet<AboutCategory> AboutCategories { get; set; }
        public DbSet<Role> Roles { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseLazyLoadingProxies().LogTo(Console.WriteLine, new[] { DbLoggerCategory.Database.Command.Name });
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //Contact
            modelBuilder.Entity<Contact>()
                .Property(x => x.PasswordHash)
                .IsRequired();
            modelBuilder.Entity<Contact>()
                .Property(x => x.NickName)
                .IsRequired();
            modelBuilder.Entity<Contact>()
                .Property(x => x.FirstName)
                .IsRequired();
            modelBuilder.Entity<Contact>()
                .Property(x => x.LastName)
                .IsRequired();
            //Role
            modelBuilder.Entity<Role>()
                .Property(x => x.Name)
                .IsRequired();
            //CategoryInfo
            modelBuilder.Entity<AboutCategory>()
                .Property(x => x.Email)
                .IsRequired();
            //Category
            modelBuilder.Entity<Category>()
                .Property(x=>x.Name) 
                .IsRequired();
            //SubCategory
            modelBuilder.Entity<Subcategory>()
                .Property(x => x.Name)
                .IsRequired();
        }
    }
}
