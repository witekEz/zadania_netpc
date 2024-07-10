using Contacts.DAL.EF;
using Contacts.Models.DTOs.Create;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Validators
{
    public class CreateAboutCategory_Validator:AbstractValidator<CreateAboutCategoryDTO>
    {
        public CreateAboutCategory_Validator()
        {
            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress();

            RuleFor(x => x.PhoneNumber)
                .Matches(@"^\+?[1-9]\d{1,10}$")
                .WithMessage("Invalid phone number format");

        }
    }
}
