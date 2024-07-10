using Contacts.DAL.EF;
using Contacts.Models.DTOs.Create;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Validators
{
    public class CreateContactDTO_Validator:AbstractValidator<CreateContactDTO>
    {
        public CreateContactDTO_Validator(ContactsDbContext dbContext)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty();
            RuleFor(x => x.LastName)
                .NotEmpty();

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress();

            RuleFor(x => x.PhoneNumber)
                .Matches(@"^\+?[1-9]\d{1,10}$")
                .WithMessage("Invalid phone number format");

            RuleFor(x => x.Password).MinimumLength(6);

            RuleFor(x => x.NickName)
                .Custom((value, context) =>
                {
                    var nickNameInUse = dbContext.Contacts.Any(u => u.NickName == value);
                    if (nickNameInUse)
                    {
                        context.AddFailure("NickName", "That nick name is taken");
                    }
                });

        }
    }
}
