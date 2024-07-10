using Contacts.DAL.EF;
using Contacts.Models.DTOs.Create;
using Contacts.Models.Entities;
using Contacts.Services;
using Contacts.Services.Interfaces;
using Contacts.Services.Mapper;
using Contacts.Services.Middleware;
using Contacts.Services.Seeder;
using Contacts.Services.Services;
using Contacts.Services.Validators;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddFluentValidationAutoValidation().AddFluentValidationClientsideAdapters();

//Authentication
var authenticationSettings = new AuthenticationSettings();
builder.Configuration.GetSection("Authentication").Bind(authenticationSettings);
builder.Services.AddSingleton(authenticationSettings);
builder.Services.AddAuthentication(option =>
{
    option.DefaultAuthenticateScheme = "Bearer";
    option.DefaultScheme = "Bearer";
    option.DefaultChallengeScheme = "Bearer";
}).AddJwtBearer(cfg =>
{
    cfg.RequireHttpsMetadata = false;
    cfg.SaveToken = true;
    cfg.TokenValidationParameters = new TokenValidationParameters
    {
        ValidIssuer = authenticationSettings.JwtIssuer,
        ValidAudience = authenticationSettings.JwtIssuer,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(authenticationSettings.JwtKey)),
    };
});

// Connection to database
var connectionString = builder.Configuration.GetConnectionString("database_connection");
builder.Services.AddDbContext<ContactsDbContext>(options =>
    options.UseSqlServer(connectionString));

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Seed data configuration
builder.Services.AddScoped<ContactSeeder>();

//AutoMapper
builder.Services.AddAutoMapper(typeof(ContactMappingProfile));
//Services
builder.Services.AddScoped<IContactService, ContactService>();
builder.Services.AddScoped<IAboutCategoryService, AboutCategoryService>();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<ISubcategoryService, SubcategoryService>();
builder.Services.AddScoped<IAccountService, AccountService>();

//Validator
builder.Services.AddScoped<IPasswordHasher<Contact>, PasswordHasher<Contact>>();
builder.Services.AddScoped<IValidator<CreateContactDTO>, CreateContactDTO_Validator>();
builder.Services.AddScoped<IValidator<CreateAboutCategoryDTO>, CreateAboutCategory_Validator>();

//Middleware
builder.Services.AddScoped<ErrorHandlingMiddleware>();

//CORS
var allowedOrigins = builder.Configuration["AllowedOrigins"];
builder.Services.AddCors(options =>
{
    options.AddPolicy("Client", builder =>
        builder.AllowAnyMethod()
        .AllowAnyHeader()
        .AllowCredentials()
        .WithOrigins("http://localhost:5173")
    );
});

var app = builder.Build();

app.UseCors("Client");

//Seed data
var scope = app.Services.CreateScope();
var seeder = scope.ServiceProvider.GetRequiredService<ContactSeeder>();
seeder.Seed();



// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseMiddleware<ErrorHandlingMiddleware>();
app.UseAuthentication();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
